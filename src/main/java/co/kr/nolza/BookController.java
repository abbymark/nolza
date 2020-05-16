package co.kr.nolza;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		
		return "/book/book_writeForm";//뷰이름
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
		return "redirect:book_list.do";
	}//writePro() end
	
	//리스트
	@RequestMapping("book_list.do")
	public String list(Model model, String pageNum)throws NamingException, IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize = 10;//한페이지에 10개
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행
		
		int count=0;//글 전체
		int pageBlock=10;//1블럭당 10페이지씩 표시하려고
		
		count=sqlSession.selectOne("book_board.selectCount");//총 글 갯수
		
		int number=count-(currentPage-1)*pageSize;//글번호
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//총 페이지 객수
		
		int result = currentPage/10;// 2/10=10   12/10=1   22/10=2
		int startPage=result*10+1;
		//						0*10+1=1페이지  1*10+1=11페이지 2*10+1=21페이지
		int endPage=startPage+pageBlock-1;
		//						1+10-10 페이지   1+20-1=20페이지    1+30-1=30 페이지
		
		if(endPage>pageCount) {//에러 방지
			endPage=pageCount;
		}
		
		//*****************************************************
		HashMap<String, Integer> map =new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		
		List<Book_boardDto> list=sqlSession.selectList("book_board.selectList", map);
		//*****************************************************
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("number", number);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		return "/book/book_list";//뷰 리턴
	}//list() end
	
	//글내용보기
	@RequestMapping("book_content.do")
	public String content(Model model, String book_no, String pageNum)
	throws NamingException, IOException{
		
		int book_no1=Integer.parseInt(book_no);
		sqlSession.update("book_board.readCount", book_no1);//조횟수 증가
		
		Book_boardDto book_dto = sqlSession.selectOne("book_board.contentBoard", book_no1);
		
		String book_content=book_dto.getBook_content();
		//book_content=book_content.replaceAll("\n", "<br>");
		
		model.addAttribute("book_content", book_content);
		model.addAttribute("book_dto", book_dto);
		model.addAttribute("book_no", book_no);
		model.addAttribute("pageNum", pageNum);
		
		return "/book/book_content";
	}//content() end
	
	//글 수정 폼
	@RequestMapping("book_updateForm.do")
	public ModelAndView updateForm(String book_no, String pageNum)
			throws NamingException, IOException{
		
		int book_no1 = Integer.parseInt(book_no);
		Book_boardDto book_dto = sqlSession.selectOne("book_board.contentBoard", book_no1);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("book_dto", book_dto);
		mv.setViewName("/board/updateForm");//뷰이름
		
		return mv;
	}//updateForm() end
	
	//DB글수정
	@RequestMapping(value="book_updatePro.do", method=RequestMethod.POST)
	public ModelAndView updatePro(Book_boardDto book_boardDto, String pageNum)
			throws NamingException, IOException{
		sqlSession.update("book_board.updateBoard", book_boardDto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.setViewName("redirect:book_list.do");
		
		return mv;
	}//updatePro() end
	
	//글삭제
	@RequestMapping("book_delete.do")
	public String delete(Model model, String book_no, String pageNum) {
		int book_no1=Integer.parseInt(book_no);
		sqlSession.delete("book_board.deleteBoard", book_no1);
		
		return "redirect:list.do";
	}// delete() end
}



























