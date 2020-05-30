package co.kr.nolza;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.naming.NamingException;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import  model.dto.CamBoardDTO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import  org.springframework.web.multipart.MultipartHttpServletRequest;
import java.io.File;


import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class CamBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("cam_writeForm.do")
	public String cam_writeForm(Model model, String cam_no, String cam_group, String cam_step, String cam_indent, String pageNum) {
		if(cam_no==null) {//최초 글쓰기
			cam_no="0";
			cam_group="1";
			cam_step="0";
			cam_indent="0";
		}// if 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("cam_no", cam_no);
		model.addAttribute("cam_group", cam_group);
		model.addAttribute("cam_step", cam_step);
		model.addAttribute("cam_indent", cam_indent);
	
		//return "/board/writeForm";// 뷰이름 
		return ".main.camboard.cam_writeForm";// 뷰이름 
	}// writeForm end
	
	//DB 에 글쓰기 
	@RequestMapping(value="cam_writePro.do", method=RequestMethod.POST)
	public String cam_writePro(@ModelAttribute("camboardDTO") CamBoardDTO camboardDTO, HttpServletRequest request)
	throws NamingException, IOException{
		int maxNum=0;
		if(sqlSession.selectOne("camboard.maxNumber") != null) {
			maxNum=sqlSession.selectOne("camboard.maxNumber");
					
		}
		if(maxNum != 0) {
			maxNum=maxNum+1;
		}else {//최대 글번호가 0이면 
			maxNum=1;
		}
		
		String cam_ip=request.getRemoteAddr(); // ip 구하기 
		camboardDTO.setCam_ip(cam_ip); //dto에 setter 작업 
		
		
		if(camboardDTO.getCam_no() != 0) {//답글이면 
			//답글끼워넣기 위치 확보
			sqlSession.update("camboard.cam_Step", camboardDTO);
			camboardDTO.setCam_step(camboardDTO.getCam_step()+1);//글순서 
			camboardDTO.setCam_indent(camboardDTO.getCam_indent()+1);//글 깊이 
		}else {
			camboardDTO.setCam_group(new Integer(maxNum));// 글 그룹 번호  즉 현재 글번호를 cam_group에 넣어준다. 그냥 글쓰기인경우 
			camboardDTO.setCam_step(new Integer(0));
			camboardDTO.setCam_indent(new Integer(0));			
		}	
		
		sqlSession.insert("camboard.insertBoard", camboardDTO);
		return "redirect:cam_list.do";		
	}//writePro end
	
	//리스트 
	@RequestMapping("/cam_list.do")
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
		
		count=sqlSession.selectOne("camboard.selectCount");  // 총 글 갯수
		
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
		
		List<CamBoardDTO> list = sqlSession.selectList("camboard.selectList",map);		
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
		//return ".main.camboard.view_mat2";  //뷰리턴 
		return ".main.camboard.cam_list";  //뷰리턴 
	}//list() end	
	
	//글내용 보기 
	@RequestMapping("cam_content.do")
	public String cam_content(Model model, String cam_no, String pageNum) 
	throws NamingException, IOException
	{
		int num1 = Integer.parseInt(cam_no);
		sqlSession.update("camboard.readCount", num1); //조회수 증가 
		
		CamBoardDTO dto=sqlSession.selectOne("camboard.contentBoard", num1);
		String cam_content = dto.getCam_content();
		//content=content.replaceAll("\n","<br>");
		
		model.addAttribute("cam_content", cam_content);
		model.addAttribute("dto", dto);
		model.addAttribute("cam_no",cam_no);
		model.addAttribute("pageNum", pageNum);		
		
		
		//return "/board/content";
		return ".main.camboard.cam_content";
	}// content () end
	
	
	
	 //입력폼
	@RequestMapping(value="/fileup")
	public String fileupload() throws Exception{
		return "/fileup";//fileup.jsp ( 뷰 )
	}//action--

	
	//파일 업로드
		//import org.springframework.web.multipart.MultipartFile;
		@RequestMapping(value="/action.do",method = RequestMethod.POST)
		public String action(@RequestParam("upfile") MultipartFile multipartFile,
				HttpServletRequest request,MultipartHttpServletRequest multi,
				Model model) throws Exception{
			
			    System.out.println(multipartFile.getOriginalFilename());
			 
			    System.out.println("name:"+multi.getParameter("name"));
			    // dto.setName(multi.getParameter("name"))
			
			   //import java.io.File;
			    File f=new File("E:\\imgUp\\"+multipartFile.getOriginalFilename());
			    multipartFile.transferTo(f);
			
			return "/cam_list";
			
		}//action--

	
	
	
	//글수정 폼
	@RequestMapping("cam_updateForm.do")
	public ModelAndView cam_updateForm(String cam_no, String pageNum) throws NamingException, IOException{
		int num1 = Integer.parseInt(cam_no);
		CamBoardDTO dto=sqlSession.selectOne("camboard.contentBoard", num1);
		ModelAndView mv= new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("dto", dto);
		//mv.setViewName("/board/updateForm");// 뷰이름 
		mv.setViewName(".main.camboard.cam_updateForm");
		return mv;
	}//
	
	// DB 글 수정
	@RequestMapping(value="cam_updatePro.do", method=RequestMethod.POST)
	public ModelAndView cam_updatePro(CamBoardDTO camboardDTO, String pageNum) throws NamingException,IOException{
		sqlSession.update("camboard.updateBoard", camboardDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.setViewName("redirect:cam_list.do");
		return mv;
	}
	
	//글삭제
	@RequestMapping("cam_delete.do")
	public String cam_delete(Model model, String cam_no, String pageNum) {
		int num1= Integer.parseInt(cam_no);
		sqlSession.delete("camboard.deleteBoard", num1);
		return "redirect:cam_list.do";
	}//delete() end
		
	
}//class end 
