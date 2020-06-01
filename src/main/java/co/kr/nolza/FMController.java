package co.kr.nolza;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.kr.utils.UploadFileUtils;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.annotation.Resource;
import javax.naming.NamingException;

import java.io.File;
import java.io.IOException;

import model.fb.FM_cmtDTO;
import model.fb.FB_boardDTO;
import model.fb.FM_boardDTO;

@Controller
public class FMController {

	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
//글쓰기 폼
	@RequestMapping("fm_writeForm.do")
	public String writeForm(Model model,String fm_no,String fm_group,String fm_step,String fm_indent,String pageNum,
			String fm_type,String fm_category)
	{
		if(fm_no==null) { //처음 글쓰기
			fm_no="0";
			fm_group="1";
			fm_step="0";
			fm_indent="0";
		}//if
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("fm_no",fm_no);
		model.addAttribute("fm_group",fm_group);
		model.addAttribute("fm_step",fm_step);
		model.addAttribute("fm_indent",fm_indent);
		model.addAttribute("fm_type",fm_type);/////글 유형 넘기기 
		model.addAttribute("fm_category",fm_category);/////글 종류 넘기기 
		
		return ".main.fm_board.fm_writeForm"; //뷰
		
	}//writeForm() end 
	
//DB에 글쓰기
	@RequestMapping(value="fm_writePro.do",method=RequestMethod.POST)
	public String writePro(@ModelAttribute("fm_boardDTO") FM_boardDTO fm_boardDTO,MultipartFile file,HttpServletRequest request)
	throws NamingException,IOException,Exception{
				
		
		int maxNum=0; //변수
		
		if(sqlSession.selectOne("fm_board.maxNumber") != null) {
			maxNum=sqlSession.selectOne("fm_board.maxNumber");
		}
		
		if(maxNum != 0) { //최대 글번호가 0이 아니면 
			maxNum=maxNum+1;
		}else{
			maxNum=1;
		}
		String realPath=request.getServletContext().getRealPath("/");
		String imgUploadPath = realPath+"\\resources\\" + File.separator + "imgUpload";
		String fileName = null;
		
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		}else {
			fileName = realPath+"\\resources\\" + File.separator + "images" + File.separator + "none.png";			
		}
		
		fm_boardDTO.setFm_img(fileName);
		
		
		String fm_ip=request.getRemoteAddr(); //ip구하기 
		fm_boardDTO.setFm_ip(fm_ip); //dto에 setter 작업 
		
		if(fm_boardDTO.getFm_no() != 0) {//답글이면  
			//답글 끼워넣기 위치 확보 
			sqlSession.update("fm_board.reStep",fm_boardDTO);
			fm_boardDTO.setFm_step(fm_boardDTO.getFm_step()+1); //글  순서 
			fm_boardDTO.setFm_indent(fm_boardDTO.getFm_indent()+1); //글 깊이
		}else {
			fm_boardDTO.setFm_group(new Integer(maxNum)); //글 그룹번호, 즉 현재 글번호를 fm_group에 넣어준다
			fm_boardDTO.setFm_step(new Integer(0)); //글 순서
			fm_boardDTO.setFm_indent(new Integer(0)); //글 깊이
		}
		
		sqlSession.insert("fm_board.insertBoard",fm_boardDTO);
		return "redirect:fm_list.do"; //response.sendRedirect("List.jsp")
		
	}//writePro() end 
	
//fm_list 리스트
	@RequestMapping("fm_list.do")
	public String list(Model model,String pageNum,String fm_category)
			throws NamingException,IOException{
		
		System.out.println(111);
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10; //한 페이지에 10개씩 
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1; //한 페이지의 시작 행
		int endRow=currentPage*pageSize; //한 페이지의 마지막 행 
		
		int count=0; //글 전체 갯수 넣을변수 
		int pageBlock=10; //1블럭당 10페이지씩 표시 
		
		model.addAttribute("fm_category",fm_category); /////글 종류1 넘기기 
		
		if(fm_category==null) {
			count=sqlSession.selectOne("fm_board.selectCount"); //총 글 갯수 
		}else if(fm_category.equals("match")) {
			fm_category="경기매치";
			count=sqlSession.selectOne("fm_board.selectCountCategory", fm_category);		
		}else if(fm_category.equals("result")) {
			fm_category="경기결과";
			count=sqlSession.selectOne("fm_board.selectCountCategory", fm_category);
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
		List<FM_boardDTO> list = null;
		if(fm_category==null) {
			list=sqlSession.selectList("fm_board.selectList",map);
		}else {
			map.put("fm_category",fm_category);
			list=sqlSession.selectList("fm_board.selectListCategory",map);
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
		
		
		return ".main.fm_board.fm_list";		
	}//list() end

//글 내용보기
		@RequestMapping("fm_detail.do")
		public String content(Model model,String fm_no,String pageNum,String fm_type,String fm_category)
		throws NamingException,IOException{

			int fm_no1=Integer.parseInt(fm_no);
			sqlSession.update("fm_board.readCount",fm_no1); //조회수 증가
		
			FM_boardDTO fm=sqlSession.selectOne("fm_board.contentBoard",fm_no1);
			
			String fm_detail=fm.getFm_detail();
			fm_detail=fm_detail.replaceAll("\n","<br>");
			System.out.println("fm_detail"+fm_detail);
			
			model.addAttribute("fm_detail",fm_detail);
			model.addAttribute("fm",fm);
			model.addAttribute("fm_no",fm_no);
			model.addAttribute("pageNum",pageNum);
			
	      	model.addAttribute("fm_type",fm_type); /////글 유형 넘기기 
	      	model.addAttribute("fm_category",fm_category); /////글 종류1 넘기기 

			return ".main.fm_board.fm_detail";
			
		}//content() end 
	
//글 수정 폼
		@RequestMapping("fm_updateForm.do")
		public String updateForm(Model model,String fm_no,String pageNum,String fm_place)
		throws NamingException,IOException{
			System.out.println("fm_no:"+ fm_no);
			//System.out.println("fm_place:"+ fm_place);
			
			int fm_no1=Integer.parseInt(fm_no);
			FM_boardDTO dto=sqlSession.selectOne("fm_board.contentBoard",fm_no1);
			
			//ModelAndView mv=new ModelAndView();
			//mv.addObject("pageNum",pageNum);
			//mv.addObject("dto",dto);
			//mv.setViewName(".main.fm_board.fm_updateForm"); // 뷰 이름 
			
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("dto",dto);
			model.addAttribute("fm_no",fm_no);
			
			return ".main.fm_board.fm_updateForm"; // 뷰 이름 
						
			//return mv;
			
		}//updateForm() end 

//DB글 수정
		@RequestMapping(value="fm_updatePro.do",method=RequestMethod.POST)
		public String updatePro(Model model,FM_boardDTO fm_boardDTO,String pageNum)
		throws NamingException, IOException{
			System.out.println("fm_no:"+fm_boardDTO.getFm_no());
			System.out.println("fm_place:"+fm_boardDTO.getFm_place());
			

			sqlSession.update("fm_board.updateBoard",fm_boardDTO);

			//ModelAndView mv=new ModelAndView();
			//mv.addObject("pageNum",pageNum);
			//mv.setViewName("redirect:fm_list.do");

			model.addAttribute("pageNum",pageNum);
			return "redirect:fm_list.do";
			
			//return mv;
		}//updatePro() end 
		
//글 삭제
		@RequestMapping("fm_delete.do")
		public String delete(Model model, String fm_no, String pageNum) {
			int fm_no1=Integer.parseInt(fm_no);
			sqlSession.delete("fm_board.deleteBoard", fm_no1);
			
			return "redirect:fm_list.do";
		}//delete() end 



	//댓글 기능=========================================================================================================================
	
	//댓글 입력 기능
		@RequestMapping(value="fm_cmt_insert.do", method=RequestMethod.POST)
		@ResponseBody
		public String fbCmtInsert(Model model, FM_cmtDTO fm_cmtDTO, HttpServletRequest request) {
			
			int maxNum=0;
			if(sqlSession.selectOne("fm_board.cmtMaxNumber") != null) {
					maxNum=sqlSession.selectOne("fm_board.cmtMaxNumber",fm_cmtDTO.getFm_no());
			}
			
			if(maxNum != 0) { //최대글번호가 0이 아니면 
				maxNum=maxNum+1;			
			}else { //최대 글번호가 0이면, 첫 댓글
				maxNum=1;
			}
		
			String ip=request.getRemoteAddr(); // ip구하기 
			fm_cmtDTO.setCmt_ip(ip);
			System.out.println("cmtno"+fm_cmtDTO.getCmt_no());
			System.out.println("maxNum"+maxNum);
			if(fm_cmtDTO.getCmt_no() != 0) {//대댓글이면
					//대댓글 끼워넣을 위치 확보 
					sqlSession.update("fm_board.cmtReStep", fm_cmtDTO); //대댓글 위치확보 
					
					fm_cmtDTO.setCmt_step(fm_cmtDTO.getCmt_step()+1); //글 순서 
					fm_cmtDTO.setCmt_indent(fm_cmtDTO.getCmt_indent()+1); //글 순서 
			}else { //원글 이면
				System.out.println("fbCmtInsert error");
				fm_cmtDTO.setCmt_group(maxNum); //글 그룹번호, 즉 현재 글번호를 group에 위치
				fm_cmtDTO.setCmt_step(0);
				fm_cmtDTO.setCmt_indent(0);
			}
			
			sqlSession.insert("fm_board.insertCmt",fm_cmtDTO);
			
			HashMap<String,Integer>map=new HashMap<String,Integer>();
			map.put("fm_no",fm_cmtDTO.getFm_no());
			System.out.println("fbnotest:"+fm_cmtDTO.getFm_no());
			map.put("countState",1);
			System.out.println("countstateerre");
			sqlSession.update("fm_board.updateBoardCmtCnt", map);
			
			
			return "success";
		}
	
		
	//댓글 리스트	
		@RequestMapping(value="fm_cmt_list.do",method=RequestMethod.POST, produces="application/text; charset=utf8")
		public ResponseEntity fbCmtList(String fm_no, String page) {
		
			HttpHeaders responseHeaders = new HttpHeaders();
			
			int maxNum=0;
			int pageSize=10;
			int currentPage=Integer.parseInt(page);
			
			int startRow=(currentPage-1)*pageSize+1;
			int endRow=currentPage*pageSize;
			
			if(!page.equals("1")) {
				
				if(sqlSession.selectOne("fm_board.cmtMaxNumber",new Integer(fm_no)) != null) {
					maxNum=sqlSession.selectOne("fm_board.cmtMaxNumber",new Integer(fm_no));
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
			map.put("fm_no", new Integer(fm_no));
		
			List<FM_cmtDTO> list=sqlSession.selectList("fm_board.cmtList",map);
		
			JSONArray json = new JSONArray(list);
			return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
			
		}
		
	
	//댓글 갯수
		@RequestMapping(value="fm_cmt_cnt.do", method=RequestMethod.POST)
		@ResponseBody
		public String fbCmtCnt(String fm_no) {
			int maxNum=0;
			if(sqlSession.selectOne("fm_board.cmtMaxNumber", new Integer(fm_no)) != null) {
				maxNum=sqlSession.selectOne("fm_board.cmtMaxNumber",new Integer(fm_no));
			}
			return Integer.toString(maxNum);
		}
	
	//댓글 삭제	
		@RequestMapping(value="fm_cmt_delete.do", method=RequestMethod.POST)
		@ResponseBody
		public String fbCmtDelete(String fm_no, String cmt_no, String mem_id) {
			String result="";
			
			System.out.println("fmCmtDelete error");
			System.out.println(fm_no);
			System.out.println(cmt_no);
			
			HashMap<String,Integer> map=new HashMap<String,Integer>();
			map.put("fm_no",Integer.parseInt(fm_no));
			map.put("cmt_no",Integer.parseInt(cmt_no));
			
			System.out.println("fmCmtDelete result");
			result=sqlSession.selectOne("fm_board.cmtIdSearch",map);
			if(result.equals(mem_id)) {
				sqlSession.delete("fm_board.deleteCmt", map);
				HashMap<String,Integer>map2=new HashMap<String,Integer>();
				map2.put("fm_no",Integer.parseInt(fm_no));
				map2.put("countState",-1);
				
				sqlSession.update("fm_board.updateBoardCmtCnt", map2);
			
				result="success";
			}
			
			return result;
		}



//검색 기능=========================================================================================================================

		@RequestMapping("fm_search.do")
		public String searchList(String searchType, String searchValue, String fm_category, String pageNum, Model model) {
			
			if(pageNum==null) {
				pageNum="1";
			}
			
			int pageSize=10; //한 페이지에 10개씩 
			int currentPage=Integer.parseInt(pageNum);//현재 페이지
			
			int startRow=(currentPage-1)*pageSize+1; //한 페이지의 시작 행
			int endRow=currentPage*pageSize; //한 페이지의 마지막 행 
			
			int count=0; //글 전체 갯수 넣을변수 
			int pageBlock=10; //1블럭당 10페이지씩 표시 
			
	      	model.addAttribute("fm_category",fm_category); /////글 종류1 넘기기 
			
	      	HashMap <String,String> map1=new HashMap<String,String>();
	      	map1.put("searchType",searchType);
	      	map1.put("searchValue",searchValue);
			
	      	System.out.println(fm_category);
			if(fm_category==null||fm_category.equals("")) {
				count=sqlSession.selectOne("fm_board.searchCount",map1); //총 글 갯수 
			}else if(fm_category.equals("match")) {
				fm_category="경기매치";
				map1.put("fm_category",fm_category);
				count=sqlSession.selectOne("fm_board.searchCountCategory",map1);		
			}else if(fm_category.equals("result")) {
				fm_category="경기결과";
				map1.put("fb_category",fm_category);
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
			
			List<FM_boardDTO> list = null;
			if(fm_category==null||fm_category.equals("")) {
				list=sqlSession.selectList("fm_board.searchList",map);
			}else {
				map.put("fm_category",fm_category);
				list=sqlSession.selectList("fm_board.searchListCategory",map);	
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
	      	
			
			return ".main.fm_board.fm_list";		

		}
		
		
		
}//class end 
