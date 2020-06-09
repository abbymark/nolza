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

import  model.dto.CaminfoDTO;


import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class CaminfoController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("caminfo_writeForm.do")
	public String caminfo_writeForm(Model model, String caminfo_no, String caminfo_group, String caminfo_step, String caminfo_indent, String pageNum,
			String caminfo_type) {
		if(caminfo_no==null) {//최초 글쓰기
			caminfo_no="0";
			caminfo_group="1";
			caminfo_step="0";
			caminfo_indent="0";
			
		}// if 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("caminfo_no", caminfo_no);
		model.addAttribute("caminfo_group", caminfo_group);
		model.addAttribute("caminfo_step", caminfo_step);
		model.addAttribute("caminfo_indent", caminfo_indent);
		model.addAttribute("caminfo_type", caminfo_type);
	
		//return "/board/writeForm";// 뷰이름 
		return ".main.caminfo.caminfo_writeForm";// 뷰이름 
	}// writeForm end
	
	//DB 에 글쓰기 
	@RequestMapping(value="caminfo_writePro.do", method=RequestMethod.POST)
	public String caminfo_writePro(@ModelAttribute("caminfoDTO") CaminfoDTO caminfoDTO, HttpServletRequest request)
	throws NamingException, IOException{
		int maxNum=0;
		if(sqlSession.selectOne("caminfo.maxNumber") != null) {
			maxNum=sqlSession.selectOne("caminfo.maxNumber");
					
		}
		if(maxNum != 0) {
			maxNum=maxNum+1;
		}else {//최대 글번호가 0이면 
			maxNum=1;
		}
		
		String caminfo_ip=request.getRemoteAddr(); // ip 구하기 
		caminfoDTO.setCaminfo_ip(caminfo_ip); //dto에 setter 작업 
		
		
		if(caminfoDTO.getCaminfo_no() != 0) {//답글이면 
			//답글끼워넣기 위치 확보
			sqlSession.update("caminfo.caminfo_Step", caminfoDTO);
			caminfoDTO.setCaminfo_step(caminfoDTO.getCaminfo_step()+1);//글순서 
			caminfoDTO.setCaminfo_indent(caminfoDTO.getCaminfo_indent()+1);//글 깊이 
		}else {
			caminfoDTO.setCaminfo_group(new Integer(maxNum));// 글 그룹 번호  즉 현재 글번호를 caminfo_group에 넣어준다. 그냥 글쓰기인경우 
			caminfoDTO.setCaminfo_step(new Integer(0));
			caminfoDTO.setCaminfo_indent(new Integer(0));			
		}	
		
		sqlSession.insert("caminfo.insertBoard", caminfoDTO);
		return "redirect:caminfo_list.do";		
	}//writePro end
	
	//리스트 
	@RequestMapping("/caminfo_list.do")
	public String list(Model model, String pageNum, String caminfo_type)throws NamingException, IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		int pageSize=10;
		int currentPage=Integer.parseInt(pageNum);  //현재 페이지
		int startRow=(currentPage-1)*pageSize+1;  // 한 페이지의 시작 행
		int endRow=currentPage*pageSize; //한페이지의 마지막 행 
		int count=0;
		int pageBlock=10;   //1페이지에 10개씩 표시 하려고 
			
		
		model.addAttribute("caminfo_type",caminfo_type); /////글 종류넘기기 
		if(caminfo_type==null||caminfo_type.equals("")) {
			count=sqlSession.selectOne("caminfo.selectCount");  // 총 글 갯수 
		}else if(caminfo_type.equals("equip")) {
			caminfo_type="캠핑 장비 정보";
			count=sqlSession.selectOne("caminfo.selectCountCategory", caminfo_type);		
		}else if(caminfo_type.equals("food")) {
			caminfo_type="캠핑 음식 정보";
			count=sqlSession.selectOne("caminfo.selectCountCategory", caminfo_type);				
		}else if(caminfo_type.equals("backpack")) {
			caminfo_type="백패킹 정보";
			count=sqlSession.selectOne("caminfo.selectCountCategory", caminfo_type);						
		}else if(caminfo_type.equals("install")) {
			caminfo_type="장비 설치 관련 영상";
			count=sqlSession.selectOne("caminfo.selectCountCategory", caminfo_type);						
		}	
		
		int number = count-(currentPage-1)*pageSize;  //글번호 역순
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
 		
		int result = currentPage/10;
		int startPage=result*10+1;
		int endPage=startPage + pageBlock-1;
		
		if(endPage>pageCount) {
			endPage = pageCount;
		}
		
		
//***************************************************************************	
		HashMap<String, Object>map= new HashMap<String,Object>();
		map.put("start", startRow-1);
		map.put("cnt", pageSize);		
		
		List<CaminfoDTO> list = null;
		if(caminfo_type==null|| caminfo_type.equals("")){
			list=sqlSession.selectList("caminfo.selectList",map);		
		}else {
			map.put("caminfo_type", caminfo_type);
			list=sqlSession.selectList("caminfo.selectListCategory",map);
		}
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
		//return ".main.caminfo.view_mat2";  //뷰리턴 
		return ".main.caminfo.caminfo_list";  //뷰리턴 
	}//list() end	
	
	//글내용 보기 
	@RequestMapping("caminfo_content.do")
	public String caminfo_content(Model model, String caminfo_no, String pageNum, String caminfo_type) 
	throws NamingException, IOException
	{
		int num1 = Integer.parseInt(caminfo_no);
		sqlSession.update("caminfo.readCount", num1); //조회수 증가 
		
		CaminfoDTO dto=sqlSession.selectOne("caminfo.contentBoard", num1);
		String caminfo_content = dto.getCaminfo_content();
		//content=content.replaceAll("\n","<br>");
		
		model.addAttribute("caminfo_content", caminfo_content);
		model.addAttribute("dto", dto);
		model.addAttribute("caminfo_no",caminfo_no);
		model.addAttribute("pageNum", pageNum);		
		
		model.addAttribute("caminfo_type", caminfo_type);		
		
		//return "/board/content";
		return ".main.caminfo.caminfo_content";
	}// content () end
		
	//글수정 폼
	@RequestMapping("caminfo_updateForm.do")
	public ModelAndView caminfo_updateForm(String caminfo_no, String pageNum) throws NamingException, IOException{
		int num1 = Integer.parseInt(caminfo_no);
		CaminfoDTO dto=sqlSession.selectOne("caminfo.contentBoard", num1);
		ModelAndView mv= new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("dto", dto);
		//mv.setViewName("/board/updateForm");// 뷰이름 
		mv.setViewName(".main.caminfo.caminfo_updateForm");
		return mv;
	}//
	
	// DB 글 수정
	@RequestMapping(value="caminfo_updatePro.do", method=RequestMethod.POST)
	public ModelAndView caminfo_updatePro(CaminfoDTO caminfoDTO, String pageNum) throws NamingException,IOException{
		sqlSession.update("caminfo.updateBoard", caminfoDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.setViewName("redirect:caminfo_list.do");
		return mv;
	}
	
	//글삭제
	@RequestMapping("caminfo_delete.do")
	public String caminfo_delete(Model model, String caminfo_no, String pageNum) {
		int num1= Integer.parseInt(caminfo_no);
		sqlSession.delete("caminfo.deleteBoard", num1);
		return "redirect:caminfo_list.do";
	}//delete() end
	
}//class end 
