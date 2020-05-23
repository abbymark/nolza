package co.kr.nolza;


import javax.servlet.ServletRequest;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookInfoController {
	
	@RequestMapping("book_info.do")
	public String infoPage(ServletRequest request) throws Exception {
		System.out.println(request.getServletContext().getRealPath("/"));
		System.out.println(request.getRealPath("/"));
		Runtime rt = Runtime.getRuntime();
		
		//먼저 R.dll, Rblas.dll, Rgraphapp.dll, Riconv.dll, Rlapack.dll 를 
		//C:\Program Files\R\R-3.6.2\bin\x64 에사 복사(R이 설치된 폴더)
		//C:\Users\hong\Documents\R\win-library\3.6\Rserve\libs\x64 여기에 붙여넣는다. 밑에 주소와 동일 주소임
		//다른 컴퓨터에서 하면 경로 바꿔줘야 함
		String exeFile = "C:\\Users\\hong\\DOCUME~1\\R\\WIN-LI~1\\3.6\\Rserve\\libs\\x64\\Rserve.exe";
		//System.out.println("exeFile: " + exeFile);
		Process p;
		
		//Rserve 시작
		p = rt.exec(exeFile);
		
		//R접속
		RConnection conn=new RConnection();
		
		conn.eval("source('C:/__sts/sts_work/nolza/book_scraper.R')");
		
		int x = 100;
		int y = 900;
		int sum = conn.eval("mySum("+x+","+y+")").asInteger();
		
		System.out.println("R스크립트 실행결과="+sum);
		
		
		
		
		//Rserve 종료
		rt.exec("taskkill /F /IM Rserve.exe");
		
		return ".main.book.book_info";
	}
}
