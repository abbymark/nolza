package co.kr.nolza;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	@Autowired
	private SqlSession sqlSession;
	
	//글쓰기 폼, 답글쓰기
	@RequestMapping("book_writeForm.do")
	public String writeForm(Model model, String book_no, String book_group, String book_step, String book_indent, String pageNum) {
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
		
		return "/board/writeForm";//뷰이름
	}//writeForm() end
}
