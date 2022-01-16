package co.teakjjo.prj.realty.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealtyController {
	
	@RequestMapping("/getRealty.do")
	public List<List<String>> getRealty() {
		 List<List<String>> csvList = new ArrayList<List<String>>();
		 File csv = new File("resources\\apartmentList.csv");
		  BufferedReader br = null;
	      String line = "";
	      
	      try {
	            br = new BufferedReader(new FileReader(csv));
	            while ((line = br.readLine()) != null) { // readLine()은 파일에서 개행된 한 줄의 데이터를 읽어온다.
	                List<String> aLine = new ArrayList<String>();
	                String[] lineArr = line.split(","); // 파일의 한 줄을 ,로 나누어 배열에 저장 후 리스트로 변환한다.
	                aLine = Arrays.asList(lineArr);
	                csvList.add(aLine);
	            }
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (br != null) { 
	                    br.close(); // 사용 후 BufferedReader를 닫아준다.
	                }
	            } catch(IOException e) {
	                e.printStackTrace();
	            }
	        }
	      System.out.println(csvList);
	        return null;
	    }
}
