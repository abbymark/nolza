package co.kr.nolza;


import java.io.IOException;

import javax.servlet.ServletRequest;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookInfoController {
	
	@RequestMapping("book_info.do")
	public String infoPage(ServletRequest request) {
		System.out.println(request.getServletContext().getRealPath("/"));
		System.out.println(request.getRealPath("/"));
		Runtime rt = Runtime.getRuntime();
		
		//먼저 R.dll, Rblas.dll, Rgraphapp.dll, Riconv.dll, Rlapack.dll 를 
		//C:\Program Files\R\R-3.6.2\bin\x64 에서 복사(R이 설치된 폴더)
		//C:\Users\hong\Documents\R\win-library\3.6\Rserve\libs\x64 여기에 붙여넣는다. 밑에 주소와 동일 주소임
		//다른 컴퓨터에서 하면 밑에 경로 바꿔줘야 함
		String exeFile = "C:\\Users\\hong\\DOCUME~1\\R\\WIN-LI~1\\3.6\\Rserve\\libs\\x64\\Rserve.exe";
		//System.out.println("exeFile: " + exeFile);
		Process p;
		
		//Rserve 시작
		try {
			p = rt.exec(exeFile);
		
		//R접속
		System.out.println(111);
		RConnection conn=new RConnection();
		System.out.println(222);
		conn.eval("source('C:/__sts/sts_work/nolza/book_scraper.R', encoding=\"utf-8\")");
		System.out.println(333);
		conn.eval("bookScraper()");
		
		//Rserve에서 뜨는 오류 보는법
//		REXP r = conn.parseAndEval("try(source('C:/ourStudy/Rpro1/pro1/rData/MyScript.R', encoding=\"utf-8\"),silent=TRUE)");
//		if (r.inherits("try-error")) 
//			System.err.println("Error: "+r.asString());
//		else 
//		{ // success ... 
//			
//		}
		
//		conn.eval("source('C:/ourStudy/Rpro1/pro1/rData/MyScript.R')");
//		int x = 100;
//		int y = 900;
//		int sum = conn.eval("mySum("+x+","+y+")").asInteger();
//		System.out.println("R스크립트 실행결과="+sum);
		
		
		System.out.println(555);
		System.out.println(444);
		System.out.println(new SavePath().path());
		System.out.println(new SavePath().path());
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//Rserve 종료
			try {
				rt.exec("taskkill /F /IM Rserve.exe");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		return ".main.book.book_info";
	}
}
