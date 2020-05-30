package co.kr.nolza;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.naming.NamingException;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import  model.dto.CamjaBoardDTO;


import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class CamjaBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("camja_writeForm.do")
	public String camja_writeForm(Model model, String camja_no, String camja_group, String camja_step, String camja_indent, String pageNum) {
		if(camja_no==null) {//최초 글쓰기
			camja_no="0";
			camja_group="1";
			camja_step="0";
			camja_indent="0";
		}// if 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("camja_no", camja_no);
		model.addAttribute("camja_group", camja_group);
		model.addAttribute("camja_step", camja_step);
		model.addAttribute("camja_indent", camja_indent);
	
		//return "/board/writeForm";// 뷰이름 
		return ".main.camjaboard.camja_writeForm";// 뷰이름 
	}// writeForm end
	
	//DB 에 글쓰기 
	@RequestMapping(value="camja_writePro.do", method=RequestMethod.POST)
	public String camja_writePro(@ModelAttribute("camjaboardDTO") CamjaBoardDTO camjaboardDTO, HttpServletRequest request)
	throws NamingException, IOException{
		int maxNum=0;
		if(sqlSession.selectOne("camjaboard.maxNumber") != null) {
			maxNum=sqlSession.selectOne("camjaboard.maxNumber");
					
		}
		if(maxNum != 0) {
			maxNum=maxNum+1;
		}else {//최대 글번호가 0이면 
			maxNum=1;
		}
		
		String camja_ip=request.getRemoteAddr(); // ip 구하기 
		camjaboardDTO.setCamja_ip(camja_ip); //dto에 setter 작업 
		
		
		if(camjaboardDTO.getCamja_no() != 0) {//답글이면 
			//답글끼워넣기 위치 확보
			sqlSession.update("camjaboard.camja_Step", camjaboardDTO);
			camjaboardDTO.setCamja_step(camjaboardDTO.getCamja_step()+1);//글순서 
			camjaboardDTO.setCamja_indent(camjaboardDTO.getCamja_indent()+1);//글 깊이 
		}else {
			camjaboardDTO.setCamja_group(new Integer(maxNum));// 글 그룹 번호  즉 현재 글번호를 camja_group에 넣어준다. 그냥 글쓰기인경우 
			camjaboardDTO.setCamja_step(new Integer(0));
			camjaboardDTO.setCamja_indent(new Integer(0));			
		}	
		
		sqlSession.insert("camjaboard.insertBoard", camjaboardDTO);
		return "redirect:camja_list.do";		
	}//writePro end
	
	//리스트 
	@RequestMapping("/camja_list.do")
	public String list(Model model, String pageNum)throws NamingException, IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		int pageSize=10;
		int currentPage=Integer.parseInt(pageNum);  //현재 페이지
		int startRow=(currentPage-1)*pageSize+1;  // 한 페이지의 시작 행
		int endRow=currentPage*pageSize; //한페이지의 마지막 행 
		int count=0;
		int pageBlock=10;   //1페이지에 10개씩 표시 하려고 
		
		count=sqlSession.selectOne("camjaboard.selectCount");  // 총 글 갯수
		
		int number = count-(currentPage-1)*pageSize;  //글번호 역순
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
 		
		int result = currentPage/10;
		int startPage=result*10+1;
		int endPage=startPage + pageBlock-1;
		
		if(endPage>pageCount) {
			endPage = pageCount;
		}
		
		
//***************************************************************************	
		HashMap<String, Integer>map= new HashMap<String,Integer>();
		map.put("start", startRow-1);
		map.put("cnt", pageSize);		
		
		List<CamjaBoardDTO> list = sqlSession.selectList("camjaboard.selectList",map);		
//***************************************************************************			
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
		
		
		//return "/board/list";  //뷰리턴 
		//return ".main.camjaboard.view_mat2";  //뷰리턴 
		return ".main.camjaboard.camja_list";  //뷰리턴 
	}//list() end	
	
	//글내용 보기 
	@RequestMapping("camja_content.do")
	public String camja_content(Model model, String camja_no, String pageNum) 
	throws NamingException, IOException
	{
		int num1 = Integer.parseInt(camja_no);
		sqlSession.update("camjaboard.readCount", num1); //조회수 증가 
		
		CamjaBoardDTO dto=sqlSession.selectOne("camjaboard.contentBoard", num1);
		String camja_content = dto.getCamja_content();
		//content=content.replaceAll("\n","<br>");
		
		model.addAttribute("camja_content", camja_content);
		model.addAttribute("dto", dto);
		model.addAttribute("camja_no",camja_no);
		model.addAttribute("pageNum", pageNum);		
		
		
		//return "/board/content";
		return ".main.camjaboard.camja_content";
	}// content () end
		
	//글수정 폼
	@RequestMapping("camja_updateForm.do")
	public ModelAndView camja_updateForm(String camja_no, String pageNum) throws NamingException, IOException{
		int num1 = Integer.parseInt(camja_no);
		CamjaBoardDTO dto=sqlSession.selectOne("camjaboard.contentBoard", num1);
		ModelAndView mv= new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("dto", dto);
		//mv.setViewName("/board/updateForm");// 뷰이름 
		mv.setViewName(".main.camjaboard.camja_updateForm");
		return mv;
	}//
	
	// DB 글 수정
	@RequestMapping(value="camja_updatePro.do", method=RequestMethod.POST)
	public ModelAndView camja_updatePro(CamjaBoardDTO camjaboardDTO, String pageNum) throws NamingException,IOException{
		sqlSession.update("camjaboard.updateBoard", camjaboardDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.setViewName("redirect:camja_list.do");
		return mv;
	}
	
	//글삭제
	@RequestMapping("camja_delete.do")
	public String camja_delete(Model model, String camja_no, String pageNum) {
		int num1= Integer.parseInt(camja_no);
		sqlSession.delete("camjaboard.deleteBoard", num1);
		return "redirect:camja_list.do";
	}//delete() end
	
}//class end 
