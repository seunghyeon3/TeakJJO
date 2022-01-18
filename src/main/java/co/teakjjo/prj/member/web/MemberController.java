package co.teakjjo.prj.member.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import co.teakjjo.prj.member.service.MemberService;
import co.teakjjo.prj.member.service.MemberVO;
import co.teakjjo.prj.reserve.service.ReserveService;
import co.teakjjo.prj.reserve.service.ReserveVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private ReserveService reserveDao;
	
	
	@RequestMapping("/changeAuthor.do")
	public String changeAuthor(@Param("url") String url, HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("memberinfo");
		memberDao.updateAuthor(vo.getMember_Id());
		vo.setMember_Author('V');
		session.setAttribute("memberinfo", vo);
		int urlLocation = url.indexOf("/prj/");
		
		return "redirect:"+ url.substring(urlLocation+5);
	}
	
	@RequestMapping(value = "/memberRegister.do", produces = "application/json; charset=utf8")
	public String memberRegister(MemberVO vo, HttpSession session) {
		memberDao.insertMember(vo);
		vo = memberDao.getMember(vo.getMember_Id());
		session.setAttribute("memberinfo", vo);
		return "redirect:home.do";
	}

	@RequestMapping("/geturi.do")
	@ResponseBody
	public String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=80fd8a8ab79372ef8a66ba99b5dc4ed0"
				+ "&redirect_uri=http://localhost/prj/dologin.do" + "&response_type=code";
		return reqUrl;
	}

	// 카카오 연동정보 조회
	@RequestMapping(value = "/dologin.do", produces = "application/json; charset=utf8")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, HttpSession session)
			throws Exception {
		System.out.println("#########" + code);
		String access_Token = getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);

		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###userInfo#### : " + userInfo.get("email"));
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println(userInfo);
		
		if (memberDao.idCheck(userInfo.get("email").toString())) {
			session.setAttribute("memberinfo", memberDao.getMember(userInfo.get("email").toString()));
			memberDao.getMember(userInfo.get("email").toString());
			return "redirect:home.do"; // 본인 원하는 경로 설정
		} else {
			session.setAttribute("userInfo", userInfo);
			return "member/signup"; // 본인 원하는 경로 설정
		}
	}

	// 토큰발급
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=80fd8a8ab79372ef8a66ba99b5dc4ed0"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost/prj/dologin.do"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);

			access_Token = (String) obj.get("access_token");

			refresh_Token = (String) obj.get("refresh_token");

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	// 유저정보조회
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			@SuppressWarnings("deprecation")
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("accessToken", access_Token);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userInfo;
	}

	
	@RequestMapping("/email.do")
	public String email(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("subject") String subject,
			@RequestParam("recipient") String recipient, @RequestParam("body") String body,	HttpServletRequest request, ModelMap mo) {
		try {
		
			int index = username.indexOf("@");
			int indexPw = password.indexOf(",");
		String host = "smtp.naver.com";
		//네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
		//네이버 이메일 비밀번호를 기재합니다.
		int port=465;
		// 메일 내용
		//메일을 발송할 이메일 주소를 기재해 줍니다.
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.debug","true");
		System.out.println(password);
		System.out.println(username.substring(0, index));
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username.substring(0, index); String pw=password.substring(0,indexPw);
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw); 
				} 
			});
		session.setDebug(true);
		//for debug
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(username));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimeMessage.setSubject(subject); mimeMessage.setText(body);
		Transport.send(mimeMessage);
		
		}catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:home.do";
	}
		
	 private static String readAll(Reader rd)  {
		 StringBuilder sb = new StringBuilder();
		 try {
			    int cp;
			    while ((cp = rd.read()) != -1) {
			      sb.append((char) cp);
			    }
		 }catch (Exception e) {
			 e.printStackTrace();
			 
		 }
		    return sb.toString();
		}
	

	 
	 @RequestMapping("/updateInfo.do")
	 public String updateInfo(MemberVO vo,HttpSession session) {
		 memberDao.updateMember(vo);
		 session.setAttribute("memberinfo", vo);
		 return "redirect:home.do";
	 }
	 @RequestMapping("/updateInfoAdmin.do")
	 public String updateInfoAdmin(MemberVO vo,HttpSession session) {
		 memberDao.updateMember(vo);		 
		 return "redirect:showTotalMember.do";
	 }
	 
	 //영화 내용의 사진 내용도 들고와야함 조인 해야함
	 @RequestMapping("/getresertaionMember.do")
	 @ResponseBody
	 public List<ReserveVO> getresertaionMember(HttpSession session) {
		 MemberVO vo = (MemberVO)session.getAttribute("memberinfo");
		 ReserveVO Rvo = new ReserveVO();
		 Rvo.setMember_id(vo.getMember_Id());
		 List<ReserveVO> list =  reserveDao.getReserveMember(Rvo);
		 return list;
	 }
	 
	 @RequestMapping("/showTotalMember.do")
	 public String showTotalMember(Model model) {
		 model.addAttribute("getMemberList", memberDao.getMembers());
		 return "member/showTotalMember";
	 }
	 
	 @RequestMapping("/updateMember.do")
	 public String updateMember(@RequestParam("id") String id, Model model) {
		 MemberVO vo = memberDao.getMember(id);
		 model.addAttribute("userInfo", vo);
		 return "member/showUser";
	 }
	 

}
