package co.kr.nolza;

import java.util.Map;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.naming.NamingException;
import java.io.IOException;

import model.fb.FB_boardDTO;
import model.fb.FB_cmtDTO;

@Controller
public class FBController {

	@Autowired
	private SqlSession sqlSession;
	
//글쓰기 폼
	@RequestMapping("fb_writeForm.do")
	public String writeForm(Model model,String fb_no,String fb_group,String fb_step,String fb_indent,String pageNum,
			String fb_type,String fb_category)
	{
		if(fb_no==null) { //처음 글쓰기
			fb_no="0";
			fb_group="1";
			fb_step="0";
			fb_indent="0";
		}//if
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("fb_no",fb_no);
		model.addAttribute("fb_group",fb_group);
		model.addAttribute("fb_step",fb_step);
		model.addAttribute("fb_indent",fb_indent);
		model.addAttribute("fb_type",fb_type);/////글 유형 넘기기 
		model.addAttribute("fb_category",fb_category);/////글 종류 넘기기 
		
		return ".main.fb_board.fb_writeForm"; //뷰
		
	}//writeForm() end 
	
//DB에 글쓰기
	@RequestMapping(value="fb_writePro.do", method=RequestMethod.POST)
	public String writePro(@ModelAttribute("fb_boardDTO") FB_boardDTO fb_boardDTO,HttpServletRequest request)
	throws NamingException, IOException{
		
		int maxNum=0; //변수
		
		if(sqlSession.selectOne("fb_board.maxNumber") != null) {
			maxNum=sqlSession.selectOne("fb_board.maxNumber");
		}
		
		if(maxNum != 0) { //최대 글번호가 0이 아니면 
			maxNum=maxNum+1;
		}else{
			maxNum=1;
		}
				
		
		String fb_ip=request.getRemoteAddr(); //ip구하기 
		fb_boardDTO.setFb_ip(fb_ip); //dto에 setter 작업 
		
		if(fb_boardDTO.getFb_no() != 0) {//답글이면  
			//답글 끼워넣기 위치 확보 
			sqlSession.update("fb_board.reStep",fb_boardDTO);
			fb_boardDTO.setFb_step(fb_boardDTO.getFb_step()+1); //글  순서 
			fb_boardDTO.setFb_indent(fb_boardDTO.getFb_indent()+1); //글 깊이
		}else {
			fb_boardDTO.setFb_group(new Integer(maxNum)); //글 그룹번호, 즉 현재 글번호를 fb_group에 넣어준다
			fb_boardDTO.setFb_step(new Integer(0)); //글 순서
			fb_boardDTO.setFb_indent(new Integer(0)); //글 깊이
		}
		
		sqlSession.insert("fb_board.insertBoard",fb_boardDTO);
		return "redirect:fb_list.do"; //response.sendRedirect("List.jsp")
		
	}//writePro() end 

//fb_list 리스트
	@RequestMapping("fb_list.do")
	public String list(Model model,String pageNum,String fb_category)
	throws NamingException,IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10; //한 페이지에 10개씩 
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1; //한 페이지의 시작 행
		int endRow=currentPage*pageSize; //한 페이지의 마지막 행 
		
		int count=0; //글 전체 갯수 넣을변수 
		int pageBlock=10; //1블럭당 10페이지씩 표시 
		
      	model.addAttribute("fb_category",fb_category); /////글 종류1 넘기기 
		
		if(fb_category==null) {
			count=sqlSession.selectOne("fb_board.selectCount"); //총 글 갯수 
		}else if(fb_category.equals("free")) {
			fb_category="자유게시판";
			count=sqlSession.selectOne("fb_board.selectCountCategory", fb_category);		
		}else if(fb_category.equals("info")) {
			fb_category="정보게시판";
			count=sqlSession.selectOne("fb_board.selectCountCategory", fb_category);
		}else if(fb_category.equals("solo")) {
			fb_category="용병신청&구함";
			count=sqlSession.selectOne("fb_board.selectCountCategory", fb_category);						
		}else if(fb_category.equals("team")) {
			fb_category="팀원신청&구함";
			count=sqlSession.selectOne("fb_board.selectCountCategory", fb_category);						
		}else if(fb_category.equals("media")) {
			fb_category="축구&풋살 동영상";
			count=sqlSession.selectOne("fb_board.selectCountCategory", fb_category);						
		}
		
		int number=count-(currentPage-1)*pageSize;//글 번호
		int pageCount=count/pageSize+(count%pageSize==0?0:1);// 총 페이지 갯수
		
		int result = currentPage/10; // 5/10=0   15/10=1   25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1페이지   11페이지   21페이지
		int endPage=startPage + pageBlock-1 ;
		//               1+10-1= 10페이지  20페이지  30페이지 
		
		if(endPage>pageCount) { //에러 방지
			endPage=pageCount;
		}
		
		//****************************
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<FB_boardDTO> list = null;
		if(fb_category==null) {
			list=sqlSession.selectList("fb_board.selectList",map);
		}else {
			map.put("fb_category",fb_category);
			list=sqlSession.selectList("fb_board.selectListCategory",map);	
		}
		//****************************
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum); ///////// 
		
		
		return ".main.fb_board.fb_list";		
	}//list() end

	
//글 내용보기
	@RequestMapping("fb_content.do")
	public String content(Model model,String fb_no,String pageNum,String fb_type,String fb_category)
	throws NamingException,IOException{
		
		System.out.println("fb_no:"+fb_no);
		int fb_no1=Integer.parseInt(fb_no);
		sqlSession.update("fb_board.readCount",fb_no1); //조회수 증가
	
		FB_boardDTO fb=sqlSession.selectOne("fb_board.contentBoard",fb_no1);
		
		String fb_content=fb.getFb_content();
		
		model.addAttribute("fb_content",fb_content);
		model.addAttribute("fb",fb);
		model.addAttribute("fb_no",fb_no);
		model.addAttribute("pageNum",pageNum);
		
      	model.addAttribute("fb_type",fb_type); /////글 유형 넘기기 
      	model.addAttribute("fb_category",fb_category); /////글 종류1 넘기기 

      	
		return ".main.fb_board.fb_content";
		
	}//content() end 
	
//글 수정 폼
	@RequestMapping("fb_updateForm.do") 
	public String updateForm(Model model,String fb_no,String pageNum)
	throws NamingException,IOException{
		System.out.println(" fb_no:"+ fb_no);
		
		
		int fb_no1=Integer.parseInt(fb_no);
		FB_boardDTO dto=sqlSession.selectOne("fb_board.contentBoard",fb_no1);
		//FB_boardDTO fb=sqlSession.selectOne("fb_board.contentBoard",fb_no1);
		
		//ModelAndView mv=new ModelAndView();
		//mv.addObject("pageNum",pageNum);
		//mv.addObject("dto",dto);
		//mv.setViewName(".main.fb_board.fb_updateForm"); // 뷰 이름 
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("dto",dto);
		//model.addAttribute("fb",fb);
		
		return ".main.fb_board.fb_updateForm"; // 뷰 이름 
		
		//return mv;
		
	}//updateForm() end 
	
//DB글 수정
	@RequestMapping(value="fb_updatePro.do",method=RequestMethod.POST)
	public String updatePro(Model model,FB_boardDTO fb_boardDTO,String pageNum)
	throws NamingException, IOException{
		
		sqlSession.update("fb_board.updateBoard",fb_boardDTO);
		
		//ModelAndView mv=new ModelAndView();
		//mv.addObject("pageNum",pageNum);
		//mv.setViewName("redirect:fb_list.do");
		
		model.addAttribute("pageNum",pageNum);
		return "redirect:fb_list.do";
		
		//return mv;
		
	}//updatePro() end 
	
//글 삭제
	@RequestMapping("fb_delete.do")
	public String delete(Model model, String fb_no, String pageNum) {
		int fb_no1=Integer.parseInt(fb_no);
		sqlSession.delete("fb_board.deleteBoard", fb_no1);
		
		return "redirect:fb_list.do";
	}//delete() end 
	
	
//댓글 기능=========================================================================================================================
	
//댓글 입력 기능
	@RequestMapping(value="fb_cmt_insert.do", method=RequestMethod.POST)
	@ResponseBody
	public String fbCmtInsert(Model model, FB_cmtDTO fb_cmtDTO, HttpServletRequest request) {
		
		int maxNum=0;
		if(sqlSession.selectOne("fb_board.cmtMaxNumber") != null) {
				maxNum=sqlSession.selectOne("fb_board.cmtMaxNumber",fb_cmtDTO.getFb_no());
		}
		
		if(maxNum != 0) { //최대글번호가 0이 아니면 
			maxNum=maxNum+1;			
		}else { //최대 글번호가 0이면, 첫 댓글
			maxNum=1;
		}
	
		String ip=request.getRemoteAddr(); // ip구하기 
		fb_cmtDTO.setCmt_ip(ip);
		System.out.println("cmtno"+fb_cmtDTO.getCmt_no());
		System.out.println("maxNum"+maxNum);
		if(fb_cmtDTO.getCmt_no() != 0) {//대댓글이면
				//대댓글 끼워넣을 위치 확보 
				sqlSession.update("fb_board.cmtReStep", fb_cmtDTO); //대댓글 위치확보 
				
				fb_cmtDTO.setCmt_step(fb_cmtDTO.getCmt_step()+1); //글 순서 
				fb_cmtDTO.setCmt_indent(fb_cmtDTO.getCmt_indent()+1); //글 순서 
		}else { //원글 이면
			System.out.println("fbCmtInsert error");
			fb_cmtDTO.setCmt_group(maxNum); //글 그룹번호, 즉 현재 글번호를 group에 위치
			fb_cmtDTO.setCmt_step(0);
			fb_cmtDTO.setCmt_indent(0);
		}
		
		sqlSession.insert("fb_board.insertCmt",fb_cmtDTO);
		
		HashMap<String,Integer>map=new HashMap<String,Integer>();
		map.put("fb_no",fb_cmtDTO.getFb_no());
		System.out.println("fbnotest:"+fb_cmtDTO.getFb_no());
		map.put("countState",1);
		System.out.println("countstateerre");
		sqlSession.update("fb_board.updateBoardCmtCnt", map);
		
		
		return "success";
	}

	
//댓글 리스트	
	@RequestMapping(value="fb_cmt_list.do",method=RequestMethod.POST, produces="application/text; charset=utf8")
	public ResponseEntity fbCmtList(String fb_no, String page) {
	
		HttpHeaders responseHeaders = new HttpHeaders();
		
		int maxNum=0;
		int pageSize=10;
		int currentPage=Integer.parseInt(page);
		
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		
		if(!page.equals("1")) {
			
			if(sqlSession.selectOne("fb_board.cmtMaxNumber",new Integer(fb_no)) != null) {
				maxNum=sqlSession.selectOne("fb_board.cmtMaxNumber",new Integer(fb_no));
			}
			startRow=maxNum%10+10*(Integer.parseInt(page)-2);
			System.out.println(startRow);
		}
		System.out.println("page:"+page);
		System.out.println(startRow);
		
		if(!page.equals("1")&&maxNum%10==0) {
			startRow=(Integer.parseInt(page)-1)*10;
		}
		System.out.println(startRow);
		HashMap<String, Integer>map = new HashMap<String,Integer>();
		map.put("start",startRow-1);
		if(!page.equals("1")) {
			map.put("start",startRow);
		}
		
		map.put("cnt",pageSize);
		map.put("fb_no", new Integer(fb_no));
	
		List<FB_cmtDTO> list=sqlSession.selectList("fb_board.cmtList",map);
	
		JSONArray json = new JSONArray(list);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		
	}
	

//댓글 갯수
	@RequestMapping(value="fb_cmt_cnt.do", method=RequestMethod.POST)
	@ResponseBody
	public String fbCmtCnt(String fb_no) {
		int maxNum=0;
		if(sqlSession.selectOne("fb_board.cmtMaxNumber", new Integer(fb_no)) != null) {
			maxNum=sqlSession.selectOne("fb_board.cmtMaxNumber",new Integer(fb_no));
		}
		return Integer.toString(maxNum);
	}

//댓글 삭제	
	@RequestMapping(value="fb_cmt_delete.do", method=RequestMethod.POST)
	@ResponseBody
	public String fbCmtDelete(String fb_no, String cmt_no, String mem_id) {
		String result="";
		
		System.out.println("fbCmtDelete error");
		System.out.println(fb_no);
		System.out.println(cmt_no);
		
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("fb_no",Integer.parseInt(fb_no));
		map.put("cmt_no",Integer.parseInt(cmt_no));
		
		System.out.println("fbCmtDelete result");
		result=sqlSession.selectOne("fb_board.cmtIdSearch",map);
		if(result.equals(mem_id)) {
			sqlSession.delete("fb_board.deleteCmt", map);
			HashMap<String,Integer>map2=new HashMap<String,Integer>();
			map2.put("fb_no",Integer.parseInt(fb_no));
			map2.put("countState",-1);
			
			sqlSession.update("fb_board.updateBoardCmtCnt", map2);
		
			result="success";
		}
		
		return result;
	}

//검색 기능=========================================================================================================================

	@RequestMapping("fb_search.do")
	public String searchList(String searchType, String searchValue, String fb_category, String pageNum, Model model) {
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10; //한 페이지에 10개씩 
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1; //한 페이지의 시작 행
		int endRow=currentPage*pageSize; //한 페이지의 마지막 행 
		
		int count=0; //글 전체 갯수 넣을변수 
		int pageBlock=10; //1블럭당 10페이지씩 표시 
		
      	model.addAttribute("fb_category",fb_category); /////글 종류1 넘기기 
		
      	HashMap <String,String> map1=new HashMap<String,String>();
      	map1.put("searchType",searchType);
      	map1.put("searchValue",searchValue);
		
      	System.out.println(fb_category);
		if(fb_category==null||fb_category.equals("")) {
			count=sqlSession.selectOne("fb_board.searchCount",map1); //총 글 갯수 
		}else if(fb_category.equals("free")) {
			fb_category="자유게시판";
			map1.put("fb_category",fb_category);
			count=sqlSession.selectOne("fb_board.searchCountCategory",map1);		
		}else if(fb_category.equals("info")) {
			fb_category="정보게시판";
			map1.put("fb_category",fb_category);
			count=sqlSession.selectOne("fb_board.searchCountCategory",map1);
		}else if(fb_category.equals("solo")) {
			fb_category="용병신청&구함";
			map1.put("fb_category",fb_category);			
			count=sqlSession.selectOne("fb_board.searchCountCategory",map1);						
		}else if(fb_category.equals("team")) {
			fb_category="팀원신청&구함";
			map1.put("fb_category",fb_category);			
			count=sqlSession.selectOne("fb_board.searchCountCategory",map1);						
		}else if(fb_category.equals("media")) {
			fb_category="축구&풋살 동영상";
			map1.put("fb_category",fb_category);			
			count=sqlSession.selectOne("fb_board.searchCountCategory",map1);						
		}


		int number=count-(currentPage-1)*pageSize;//글 번호
		int pageCount=count/pageSize+(count%pageSize==0?0:1);// 총 페이지 갯수
		
		int result = currentPage/10; // 5/10=0   15/10=1   25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1페이지   11페이지   21페이지
		int endPage=startPage + pageBlock-1 ;
		//               1+10-1= 10페이지  20페이지  30페이지 
		
		if(endPage>pageCount) { //에러 방지
			endPage=pageCount;
		}

		//****************************
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		map.put("searchType",searchType);
		map.put("searchValue",searchValue);
		
		List<FB_boardDTO> list = null;
		if(fb_category==null||fb_category.equals("")) {
			list=sqlSession.selectList("fb_board.searchList",map);
		}else {
			map.put("fb_category",fb_category);
			list=sqlSession.selectList("fb_board.searchListCategory",map);	
		}
		//****************************


		model.addAttribute("searchType",searchType);
		model.addAttribute("searchValue",searchValue);		
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum); ///////// 
      	
		
		return ".main.fb_board.fb_list";		

	}
		
}//class end 
