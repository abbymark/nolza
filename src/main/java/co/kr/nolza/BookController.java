package co.kr.nolza;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.book.Book_boardDto;

@Controller
public class BookController {
	@Autowired
	private SqlSession sqlSession;
	
	//글쓰기 폼, 답글쓰기
	@RequestMapping("book_writeForm.do")
	public String writeForm(Model model, String book_no, String book_group, String book_step, String book_indent, String pageNum, String book_type) {
		if(book_no==null) {//처음 글쓰기
			book_no="0";
			book_group="1";
			book_step="0";
			book_indent="0";
		}//if end
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("book_no", book_no);
		model.addAttribute("book_group", book_group);
		model.addAttribute("book_step", book_step);
		model.addAttribute("book_indent", book_indent);
		model.addAttribute("book_type", book_type);
		
		return "/board/writeForm";//뷰이름
	}//writeForm() end
	
	//Db에 글쓰기
	@RequestMapping(value="/book_writePro.do",method=RequestMethod.POST)
	public String writePro(Book_boardDto book_boardDto, HttpServletRequest request)
		throws NamingException, IOException{
		
		int maxNum=0;//변수
		if(sqlSession.selectOne("book_board.maxNumber") != null) {
			maxNum=sqlSession.selectOne("book_board.maxNumber");
		}
		
		if(maxNum != 0) {//최대글번호가 0이 아니면
			maxNum=maxNum+1;
		}else {//최대 글번호가 0이면, 처음 글쓰기
			maxNum=1;
		}
		
		String book_ip=request.getRemoteAddr();//ip 구하기
		book_boardDto.setBook_ip(book_ip);//dto에 setter 작업
		
		if(book_boardDto.getBook_no() !=0) {//답글이면
			//답글 끼워넣을 위치 확보
			sqlSession.update("book_board.reStep", book_boardDto);//답글 위치 확보
			
			book_boardDto.setBook_step(book_boardDto.getBook_step()+1);//글 순서
			book_boardDto.setBook_indent(book_boardDto.getBook_indent()+1);//글 깊이
		}else {//원글
			book_boardDto.setBook_group(new Integer(maxNum));//글 그룹번호, 즉 현재 글번호를 group에 넣어준다
			book_boardDto.setBook_step(new Integer(0));
			book_boardDto.setBook_indent(new Integer(0));
		}
		
		sqlSession.insert("book_board.insertBoard",book_boardDto);
		return "redirect:list.do";
	}//writePro() end
}
