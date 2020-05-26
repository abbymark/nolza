package co.kr.nolza;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;

import model.book.Book_boardDto;
import model.book.Book_cmtDto;

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
		
		return ".main.book.book_writeForm";//뷰이름
	}//writeForm() end
	
	//Db에 글쓰기
	@RequestMapping(value="/book_writePro.do",method=RequestMethod.POST)
	public String writePro(@ModelAttribute("book_boardDto") Book_boardDto book_boardDto, HttpServletRequest request,
			RedirectAttributes redirectAttr, @RequestParam("img_title")MultipartFile multi[])
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
		
		
		//이미지 저장====================================================
		for(MultipartFile multi2:multi) {
			//파일명
			String originalFile = multi2.getOriginalFilename();
			
			//랜덤생성
			UUID uuid=UUID.randomUUID();
			String random=uuid.toString();
			
			//날짜
			String fileName = "";
			
			Calendar calendar = Calendar.getInstance();
			fileName += calendar.get(Calendar.YEAR);
			fileName += calendar.get(Calendar.MONTH);
			fileName += calendar.get(Calendar.DATE);
			fileName += calendar.get(Calendar.HOUR);
			fileName += calendar.get(Calendar.MINUTE);
			fileName += calendar.get(Calendar.SECOND);
			fileName += calendar.get(Calendar.MILLISECOND);
			fileName += random;
			
			//최종 파일명
			fileName +=originalFile;
			
			
			//파일 확장자 추출
			//String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
			
			System.out.println(book_boardDto.getBook_title());
			String realPath=request.getServletContext().getRealPath("/");
			String savePath=realPath+"/resources/book_imgs/"+fileName;
			System.out.println(multi);
			
			//저장 위치
			multi2.transferTo(new File(savePath));
			System.out.println(213123);
			
			
			HashMap<String,Object> map=new HashMap<String,Object>();
			map.put("book_no", maxNum);
			System.out.println(maxNum);
			map.put("img_title", fileName);
			sqlSession.insert("book_board.insertImgs", map);
		}
		//이미지 끝==========================================================
		
		
		String type="";
		if(book_boardDto.getBook_type().equals("자유게시판")){
			type="free";
		}else if(book_boardDto.getBook_type().equals("비소설 추천")){
			type="recommendNonFiction";
		}else if(book_boardDto.getBook_type().equals("소설 추천")){
			type="recommendFiction";
		}else if(book_boardDto.getBook_type().equals("독서 모임")){
			type="readingGroup";
		}else if(book_boardDto.getBook_type().equals("토론")){
			type="debate";
		}
		
		
		redirectAttr.addAttribute("book_type",type);
		return "redirect:book_list.do";
	}//writePro() end
	
	//리스트
	@RequestMapping("book_list.do")
	public String list(Model model, String pageNum, String book_type)throws NamingException, IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize = 10;//한페이지에 10개
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행
		
		int count=0;//글 전체
		int pageBlock=10;//1블럭당 10페이지씩 표시하려고
		
		String book_type_eng=book_type;
		model.addAttribute("book_type",book_type);//글 종류 넘기기
		
		if(book_type==null||book_type.equals("")) {
			count=sqlSession.selectOne("book_board.selectCount");//총 글 갯수
		}else if(book_type.equals("free")){
			book_type="자유게시판";
			count=sqlSession.selectOne("book_board.selectCountCategory", book_type);
		}else if(book_type.equals("recommendNonFiction")){
			book_type="비소설 추천";
			count=sqlSession.selectOne("book_board.selectCountCategory", book_type);
		}else if(book_type.equals("recommendFiction")){
			book_type="소설 추천";
			count=sqlSession.selectOne("book_board.selectCountCategory", book_type);
		}else if(book_type.equals("readingGroup")){
			book_type="독서 모임";
			count=sqlSession.selectOne("book_board.selectCountCategory", book_type);
		}else if(book_type.equals("debate")){
			book_type="토론";
			count=sqlSession.selectOne("book_board.selectCountCategory", book_type);
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
		List<Book_boardDto> list=null;
		if(book_type==null||book_type.equals("")) {
			list=sqlSession.selectList("book_board.selectList", map);
		}else {
			map.put("book_type",book_type);
			list=sqlSession.selectList("book_board.selectListCategory", map);			
		}
		
		
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
		
		model.addAttribute("book_type_eng",book_type_eng);
		return ".main.book.book_list";//뷰 리턴
	}//list() end
	
	
	//글내용보기
	@RequestMapping("book_content.do")
	public String content(Model model, String book_no, String pageNum, HttpSession session)
	throws NamingException, IOException{
		
		int book_no1=Integer.parseInt(book_no);
		
		sqlSession.update("book_board.readCount", book_no1);//조횟수 증가
		Book_boardDto book_dto = sqlSession.selectOne("book_board.contentBoard", book_no1);
		
		String book_content=book_dto.getBook_content();
		//book_content=book_content.replaceAll("\n", "<br>");
		
		//이미지 불러오기
		List<String> imgs=sqlSession.selectList("book_board.selectImgs", book_no1);
		model.addAttribute("book_imgs",imgs);
		for(String img:imgs) {
			System.out.println(img);
		}
		
		String mem_id=(String)session.getAttribute("mem_id");
		HashMap<String,Object> map=new HashMap<String,Object>();
		if(mem_id!=null) {
			map.put("book_no", book_no1);
			map.put("mem_id", mem_id);
			String book_likeState= sqlSession.selectOne("book_board.likeStateCheck", map);
			model.addAttribute("book_likeState", book_likeState);
		}
		
		model.addAttribute("book_content", book_content);
		model.addAttribute("book_dto", book_dto);
		model.addAttribute("book_no", book_no);
		model.addAttribute("pageNum", pageNum);
		
		return ".main.book.book_content";
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
		System.out.println(111);
		mv.setViewName(".main.book.book_updateForm");//뷰이름
		
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
	public String delete(Model model, String book_no, String pageNum, String mem_id, HttpSession session) {
		System.out.println(mem_id);
		System.out.println(session.getAttribute("mem_id"));
		String mem_id2=(String)session.getAttribute("mem_id");
		if(mem_id2 == null) {
			return "redirect:book_list.do";
		}
		
		
		
		System.out.println(111);
		int book_no1=Integer.parseInt(book_no);
		sqlSession.delete("book_board.deleteBoard", book_no1);
		
		return "redirect:book_list.do";
	}// delete() end
	
	//좋아요, 싫어요 기능 book_like update
	@RequestMapping(value="book_likeCheck.do", method=RequestMethod.POST)
	public String insertLike(Model model, String book_no, String book_likeState, String mem_id) {
		
		HashMap<String,Object>map =new HashMap<String,Object>();
		
		map.put("mem_id", mem_id);
		map.put("book_no", new Integer(book_no));
		map.put("book_likeState", new Integer(book_likeState));
		
		sqlSession.insert("book_board.insertLike", map);
		
		sqlSession.update("book_board.likeUpdateBoard", map);
		
		if(book_likeState.equals("1")) {
			sqlSession.update("book_board.likeCntUpdate", book_no);
		}else {
			sqlSession.update("book_board.dislikeCntUpdate", book_no);
		}
		
		Book_boardDto book_like = sqlSession.selectOne("book_board.likeSelect", new Integer(book_no));
		model.addAttribute("book_like",book_like);
		return "book/book_likeCheck";
	}
	
	//좋아요 기능=========================================================================================================================
	
	//좋아요, 싫어요 취소 기능
	@RequestMapping(value="book_likeCancel.do", method=RequestMethod.POST)
	public String deleteLike(Model model, String book_no, String book_likeState, String mem_id) {
		
		HashMap<String,Object>map =new HashMap<String,Object>();
		
		map.put("mem_id", mem_id);
		map.put("book_no", new Integer(book_no));
		map.put("book_likeState", new Integer(book_likeState));
		
		sqlSession.insert("book_board.deleteLike", map);
		
		sqlSession.update("book_board.likeCancelUpdate", map);
		
		if(book_likeState.equals("1")) {
			sqlSession.update("book_board.likeCntCancel", book_no);
		}else {
			sqlSession.update("book_board.dislikeCntCancel", book_no);
		}
		
		Book_boardDto book_like = sqlSession.selectOne("book_board.likeSelect", new Integer(book_no));
		model.addAttribute("book_like",book_like);
		return "book/book_likeCheck";
	}
	
	
	//댓글 기능=========================================================================================================================
	
	//댓글 입력 기능
	@RequestMapping(value="book_cmt_insert.do", method=RequestMethod.POST)
	@ResponseBody
	public String bookCmtInsert(Model model, Book_cmtDto book_cmtDto, HttpServletRequest request) {
		
		int maxNum=0;
		if(sqlSession.selectOne("book_board.cmtMaxNumber") !=null) {
			maxNum=sqlSession.selectOne("book_board.cmtMaxNumber", book_cmtDto.getBook_no());
		}
		
		if(maxNum != 0) {//최대글번호가 0이 아니면
			maxNum=maxNum+1;
		}else {//최대 글번호가 0이면, 처음 글쓰기
			maxNum=1;
		}
		
		String ip=request.getRemoteAddr();//ip구하기
		book_cmtDto.setCmt_ip(ip);
		//System.out.println("cmtno"+book_cmtDto.getCmt_no());
		//System.out.println("maxNum"+maxNum);
		if(book_cmtDto.getCmt_no() != 0) {//답글이면
			//답글 끼워넣을 위치 확보
			sqlSession.update("book_board.cmtReStep", book_cmtDto);//답글 위치 확보
			
			book_cmtDto.setCmt_step(book_cmtDto.getCmt_step()+1);//글 순서
			book_cmtDto.setCmt_indent(book_cmtDto.getCmt_indent()+1);//글 순서
		}else {//원글 이면
			System.out.println(1212);
			book_cmtDto.setCmt_group(maxNum);//글 그룹번호, 즉 현재 글번호를 group에 넣어준다
			book_cmtDto.setCmt_step(0);
			book_cmtDto.setCmt_indent(0);
		}
		
		sqlSession.insert("book_board.insertCmt", book_cmtDto);
		
		HashMap<String,Integer>map=new HashMap<String,Integer>();
		map.put("book_no",book_cmtDto.getBook_no());
		map.put("countState",1);
		sqlSession.update("book_board.updateBoardCmtCnt", map);
		
		return "success";
	}
	
	//댓글 리스트
	@RequestMapping(value="book_cmt_list.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity bookCmtList(String book_no, String page) {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		
		
		int maxNum=0;
		int pageSize=10;
		int currentPage=Integer.parseInt(page);
		
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		
		if(!page.equals("1")) {
			
			if(sqlSession.selectOne("book_board.cmtMaxNumber", new Integer(book_no)) !=null) {
				maxNum=sqlSession.selectOne("book_board.cmtMaxNumber",new Integer(book_no));
			}
			startRow=maxNum%10+10*(Integer.parseInt(page)-2);
			System.out.println(startRow);
		}
		//System.out.println(page);
		//System.out.println(startRow);
		
		if(!page.equals("1")&&maxNum%10==0) {
			startRow=(Integer.parseInt(page)-1)*10;
		}
		//System.out.println(startRow);
		HashMap<String, Integer>map = new HashMap<String, Integer>();
		map.put("start", startRow-1);
		if(!page.equals("1")) {
			map.put("start", startRow);
		}
		map.put("cnt", pageSize);
		map.put("book_no", new Integer(book_no));
		
		List<Book_cmtDto> list=sqlSession.selectList("book_board.cmtList",map);
		
		JSONArray json = new JSONArray(list);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		
	}
	
	//댓글 갯수
	@RequestMapping(value="book_cmt_cnt.do", method=RequestMethod.POST)
	@ResponseBody
	public String bookCmtCnt(String book_no) {
		int maxNum=0;
		if(sqlSession.selectOne("book_board.cmtMaxNumber", new Integer(book_no)) !=null) {
			maxNum=sqlSession.selectOne("book_board.cmtMaxNumber",new Integer(book_no));
		}
		return Integer.toString(maxNum);
	}
	
	//댓글 삭제
	@RequestMapping(value="book_cmt_delete.do", method=RequestMethod.POST)
	@ResponseBody
	public String bookCmtDelete(String book_no, String cmt_no, String mem_id) {
		String result="";
		
		//System.out.println(1111);
		//System.out.println(book_no);
		//System.out.println(cmt_no);
		
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("book_no",Integer.parseInt(book_no));
		map.put("cmt_no",Integer.parseInt(cmt_no));
		
		//System.out.println(2222);
		result=sqlSession.selectOne("book_board.cmtIdSearch",map);
		if(result.equals(mem_id)) {
			sqlSession.delete("deleteCmt", map);
			HashMap<String,Integer>map2=new HashMap<String,Integer>();
			map2.put("book_no",Integer.parseInt(book_no));
			map2.put("countState",-1);
			
			sqlSession.update("book_board.updateBoardCmtCnt", map2);
			
			result="success";
		}
		
		return result;
	}
}



























