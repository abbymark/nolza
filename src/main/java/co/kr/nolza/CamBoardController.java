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

import model.book.Book_boardDto;
import  model.dto.CamBoardDTO;
import model.dto.CamjaBoardDTO;

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
	public String cam_writeForm(Model model, String gdsNo, String cam_group, String cam_step, String cam_indent, String pageNum) {
		if(gdsNo==null) {//최초 글쓰기
			gdsNo="0";
			
		}// if 
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gdsNo", gdsNo);
			
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
	public String cam_content(Model model, String gdsNo, String pageNum) 
	throws NamingException, IOException
	{
		int num1 = Integer.parseInt(gdsNo);
				
		CamBoardDTO dto=sqlSession.selectOne("camboard.contentBoard", num1);
		String cam_content = dto.getCam_content();
		//content=content.replaceAll("\n","<br>");
		
		model.addAttribute("cam_content", cam_content);
		model.addAttribute("dto", dto);
		model.addAttribute("gdsNo", gdsNo);
		model.addAttribute("pageNum", pageNum);		
		
		
		//return "/board/content";
		return ".main.camboard.cam_content";
	}// content () end
	
	
	//글수정 폼
	@RequestMapping("cam_updateForm.do")
	public ModelAndView cam_updateForm(String gdsNo, String pageNum) throws NamingException, IOException{
		int num1 = Integer.parseInt(gdsNo);
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
	public String cam_delete(Model model, String gdsNo, String pageNum) {
		int num1= Integer.parseInt(gdsNo);
		sqlSession.delete("camboard.deleteBoard", num1);
		return "redirect:cam_list.do";
	}//delete() end
		
	//검색 리스트
		@RequestMapping("campsearch.do")
		public String searchList(String searchType, String searchValue, String gdsCat, String pageNum, Model model){
			
			if(pageNum==null) {
				pageNum="1";
			}
			
			int pageSize = 10;//한페이지에 10개
			int currentPage=Integer.parseInt(pageNum);//현재 페이지
			
			int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
			int endRow=currentPage*pageSize;//한 페이지의 마지막 행
			
			int count=0;//글 전체
			int pageBlock=10;//1블럭당 10페이지씩 표시하려고
			
			String gdsCat_search=gdsCat;
			model.addAttribute("gdsCat",gdsCat);//글 종류 넘기기
			
			HashMap <String, String> map1=new HashMap<String,String>();
			map1.put("searchType", searchType);
			map1.put("searchValue", searchValue);
			System.out.println(searchType);
			System.out.println(searchValue);
			if(gdsCat==null||gdsCat.equals("")) {
				count=sqlSession.selectOne("camboard.searchCount",map1);//총 글 갯수
			}else if(gdsCat.equals("야영장")){
				gdsCat="야영장";
				map1.put("gdsCat", gdsCat);
				count=sqlSession.selectOne("camboard.searchCountCat", map1);
			}else if(gdsCat.equals("자동차야영장")){
				gdsCat="자동차야영장";
				map1.put("gdsCat", gdsCat);
				count=sqlSession.selectOne("camboard.searchCountCat", map1);
			
			}
			
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
			HashMap<String, Object> map =new HashMap<String,Object>();
			map.put("start",startRow-1);
			map.put("cnt",pageSize);
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
	    	System.out.println(searchType);
			System.out.println(searchValue);
			System.out.println(startRow-1);
			System.out.println(pageSize);
			System.out.println(gdsCat);
			List<CamBoardDTO> list=null;
			
			if(gdsCat==null||gdsCat.equals("")) {
				list=sqlSession.selectList("camboard.searchList", map);
				System.out.println("전체 검색");
			}else {
				map.put("gdsCat",gdsCat);
				list=sqlSession.selectList("camboard.searchListCat", map);
				System.out.println("카테고리 검색");
			}
						
			//*****************************************************
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchValue", searchValue);
			
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
			
			model.addAttribute("gdsCat_search",gdsCat_search);
			
				
			return ".main.camboard.cam_list";
		}
}//class end 
