package co.kr.nolza;

import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import sun.security.jgss.HttpCaller;

public class SavePath{

	public String path() {
		//이 클래스의 경로를 알아낸다
		String path2 = getClass().getResource("/").getPath().replaceAll("/WEB-INF/classes/","/");
		
		
		//ServletContext path; 

		
		
		return path2;
	}
}
