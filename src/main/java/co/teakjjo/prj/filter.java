package co.teakjjo.prj;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class filter implements Filter {

	public filter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// pass the request along the filter chain
		chain.doFilter(request, response); // 서블릿실행
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
