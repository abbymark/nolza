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
import org.springframework.web.servlet.ModelAndView;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import javax.naming.NamingException;
import java.io.IOException;

import model.matzip.MatzipDto;

@Controller
public class MatzipController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체게시판 리스트
	@RequestMapping("/mat_list")
	public String mat_list(Model model,String pageNum,String keyField,String keyWord)
			throws NamingException,IOException{
		
		//String t="서울 정돈 ";
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10;//한 페이지에 10개씩
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행
		int count=0;
		int pageBlock=10;//1블럭당 10페이지씩 표시하려고
		
		//String keyField=null;
		//String keyWord=null;
		
		count=sqlSession.selectOne("matzip.mat_selectCount");//총 글 갯수 
		
		int number=count-(currentPage-1)*pageSize;//글번호 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		int result = currentPage/10;
		int startPage=result*10+1;
		//              0*10+1=1
		int endPage=startPage + pageBlock - 1;
		//               1+10-1=10
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		HashMap<String , Object> map=new HashMap<String,Object>();
		map.put("start",startRow-1); // 0
		map.put("cnt",pageSize);  // 10
		
		HashMap<String , Object> map2=new HashMap<String,Object>();
		map2.put("start",startRow-1); // 0
		map2.put("cnt",pageSize);  // 10
		map2.put("keyField",keyField);  // 10
		map2.put("keyWord",keyWord);  // 10
		
		//map.put("keyField",keyField);  // no
		//map.put("keyWord",keyWord);  // 2
		
		List<HashMap<String, String>> mat_list3=null;
		
		//전체 리스트
		if( keyWord==null || keyWord.equals("") ) {
		    mat_list3=sqlSession.selectList("matzip.mat_selectList",map);
		}else {
			mat_list3=sqlSession.selectList("matzip.mat_serchList",map2);
 		}
		
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
		model.addAttribute("pageNum",pageNum);
		//model.addAttribute("t",t);
		//System.out.println(pageNum);
		
		model.addAttribute("keyField",keyField);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("mat_list3",mat_list3); //전체 게시판 리스트
		
		return ".main.matzip.mat_list";//뷰 리턴 
	}//list() end

	//자유게시판 리스트
	@RequestMapping("/mat_list2")
	public String mat_list2(Model model,String pageNum,String keyField,String keyWord)
			throws NamingException,IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10;//한 페이지에 10개씩
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행
		int count=0;
		int pageBlock=10;//1블럭당 10페이지씩 표시하려고
		
		//String keyField=null;
		//String keyWord=null;
		
		count=sqlSession.selectOne("matzip.mat_selectCount");//총 글 갯수 
		
		int number=count-(currentPage-1)*pageSize;//글번호 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		int result = currentPage/10;
		int startPage=result*10+1;
		//              0*10+1=1
		int endPage=startPage + pageBlock - 1;
		//               1+10-1=10
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		HashMap<String , Object> map=new HashMap<String,Object>();
		map.put("start",startRow-1); // 0
		map.put("cnt",pageSize);  // 10
		
		HashMap<String , Object> map2=new HashMap<String,Object>();
		map2.put("start",startRow-1); // 0
		map2.put("cnt",pageSize);  // 10
		map2.put("keyField",keyField);  // 10
		map2.put("keyWord",keyWord);  // 10
		
		//map.put("keyField",keyField);  // no
		//map.put("keyWord",keyWord);  // 2
		
		List<HashMap<String, String>> mat_list3=null;
		
		//전체 리스트
		if( keyWord==null || keyWord.equals("") ) {
		    mat_list3=sqlSession.selectList("matzip.mat_freeselect",map);
		}else {
			mat_list3=sqlSession.selectList("matzip.mat_freeselect",map2);
 		}
		
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
		model.addAttribute("pageNum",pageNum);
		//model.addAttribute("t",t);
		//System.out.println(pageNum);
		
		model.addAttribute("keyField",keyField);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("mat_list3",mat_list3); //전체 게시판 리스트
		
		return ".main.matzip.mat_list2";//뷰 리턴 
	}//list() end
	
	//맛집 추천 게시판 리스트
	@RequestMapping("/mat_list3")
	public String mat_list3(Model model,String pageNum,String keyField,String keyWord)
			throws NamingException,IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10;//한 페이지에 10개씩
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행
		int count=0;
		int pageBlock=10;//1블럭당 10페이지씩 표시하려고
		
		//String keyField=null;
		//String keyWord=null;
		
		count=sqlSession.selectOne("matzip.mat_selectCount");//총 글 갯수 
		
		int number=count-(currentPage-1)*pageSize;//글번호 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		int result = currentPage/10;
		int startPage=result*10+1;
		//              0*10+1=1
		int endPage=startPage + pageBlock - 1;
		//               1+10-1=10
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		HashMap<String , Object> map=new HashMap<String,Object>();
		map.put("start",startRow-1); // 0
		map.put("cnt",pageSize);  // 10
		
		HashMap<String , Object> map2=new HashMap<String,Object>();
		map2.put("start",startRow-1); // 0
		map2.put("cnt",pageSize);  // 10
		map2.put("keyField",keyField);  // 10
		map2.put("keyWord",keyWord);  // 10
		
		//map.put("keyField",keyField);  // no
		//map.put("keyWord",keyWord);  // 2
		
		List<HashMap<String, String>> mat_list3=null;
		
		//전체 리스트
		if( keyWord==null || keyWord.equals("") ) {
		    mat_list3=sqlSession.selectList("matzip.mat_reselect",map);
		}else {
			mat_list3=sqlSession.selectList("matzip.mat_reselect",map2);
 		}
		
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
		model.addAttribute("pageNum",pageNum);
		//model.addAttribute("t",t);
		//System.out.println(pageNum);
		
		model.addAttribute("keyField",keyField);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("mat_list3",mat_list3); //전체 게시판 리스트
		
		return ".main.matzip.mat_list3";//뷰 리턴 
	}//list() end
	
	//개념글 리스트
	@RequestMapping("/mat_list4")
	public String mat_list4(Model model,String pageNum,String keyField,String keyWord)
			throws NamingException,IOException{
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		int pageSize=10;//한 페이지에 10개씩
		int currentPage=Integer.parseInt(pageNum);//현재 페이지
		
		int startRow=(currentPage-1)*pageSize+1;//한 페이지의 시작 행
		int endRow=currentPage*pageSize;//한 페이지의 마지막 행
		int count=0;
		int pageBlock=10;//1블럭당 10페이지씩 표시하려고
		
		//String keyField=null;
		//String keyWord=null;
		
		count=sqlSession.selectOne("matzip.mat_selectCount");//총 글 갯수 
		
		int number=count-(currentPage-1)*pageSize;//글번호 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		int result = currentPage/10;
		int startPage=result*10+1;
		//              0*10+1=1
		int endPage=startPage + pageBlock - 1;
		//               1+10-1=10
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		HashMap<String , Object> map=new HashMap<String,Object>();
		map.put("start",startRow-1); // 0
		map.put("cnt",pageSize);  // 10
		
		HashMap<String , Object> map2=new HashMap<String,Object>();
		map2.put("start",startRow-1); // 0
		map2.put("cnt",pageSize);  // 10
		map2.put("keyField",keyField);  // 10
		map2.put("keyWord",keyWord);  // 10
		
		//map.put("keyField",keyField);  // no
		//map.put("keyWord",keyWord);  // 2
		
		List<HashMap<String, String>> mat_list3=null;
		
		//전체 리스트
		if( keyWord==null || keyWord.equals("") ) {
		    mat_list3=sqlSession.selectList("matzip.mat_readselect",map);
		}else {
			mat_list3=sqlSession.selectList("matzip.mat_readselect",map2);
 		}
		
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
		model.addAttribute("pageNum",pageNum);
		//model.addAttribute("t",t);
		//System.out.println(pageNum);
		
		model.addAttribute("keyField",keyField);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("mat_list3",mat_list3); //전체 게시판 리스트
		
		return ".main.matzip.mat_list4";//뷰 리턴 
	}//list() end
	
	
	//글 내용=======================================================================
	//글 내용보기
	@RequestMapping("/mat_content")
	public String mat_content(Model model, String no, String pageNum) throws NamingException, IOException{
		
		int no1=Integer.parseInt(no);
		sqlSession.update("matzip.mat_readCount", no1); // 조회수 증가
		
		MatzipDto dto = sqlSession.selectOne("matzip.mat_contentBoard", no1);
		
		//int ggroup1=Integer.parseInt(ggroup);
		//int step1=Integer.parseInt(step);
		//int indent1=Integer.parseInt(indent);
		
		String mat_content=dto.getContent();
		
		model.addAttribute("mat_content", mat_content);
		model.addAttribute("dto",dto);
		
		model.addAttribute("no",no1);
		model.addAttribute("pageNum",pageNum);
		
		//model.addAttribute("ggroup",ggroup1);
		//model.addAttribute("step",step1);
		//model.addAttribute("indent",indent1);
		
		return ".main.matzip.mat_content"; //뷰 리턴
	}//content end
		
		
	//글쓰기==========================================================
	
	//글쓰기 폼
	@RequestMapping("mat_writeForm")
	public String writeForm(Model model,String no,String ggroup,String step,String indent ,String pageNum, String type)
	{
		if(no==null) {//처음 글쓰기
			no="0";
			ggroup="1";
			step="0";
			indent="0";
		}//if
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("no",no);
		model.addAttribute("ggroup",ggroup);
		model.addAttribute("step",step);
		model.addAttribute("indent",indent);
		model.addAttribute("type",type);
		
		return ".main.matzip.mat_writeForm";//뷰이름
	}//writeForm()) end
	
	//Db에 글쓰기
	@RequestMapping(value="/writePro",method=RequestMethod.POST)
	public String writePro(@ModelAttribute("matzipDTO") MatzipDto matzipDTO,HttpServletRequest request)
	throws NamingException,IOException{
		
		int maxNum=0;//변수
		if(sqlSession.selectOne("matzip.mat_maxNumber") != null) {
		maxNum=sqlSession.selectOne("matzip.mat_maxNumber");
		}
		
		if(maxNum != 0) {//최대글번호가 0이 아니면
			maxNum=maxNum+1;
		}else{//최대 글번호가 0 이면
			maxNum=1;
		}
		
		System.out.println("type:"+matzipDTO.getType());
		
		
		
		String ip=request.getRemoteAddr();//ip구하기
		matzipDTO.setIp(ip);//dto에 setter 작업
		
		if(matzipDTO.getNo() != 0) {//답글이면
			//답글 끼워넣기 위치 확보
			sqlSession.update("matzip.mat_reStep",matzipDTO);
			
			matzipDTO.setStep(matzipDTO.getStep()+1);//글 순서
			matzipDTO.setIndent(matzipDTO.getIndent()+1);//글 깊이 
		}else {//첫뻔재글
			matzipDTO.setGgroup(new Integer(maxNum));//글 그룹번호 , 즉 현재 글번호를 ref에 넣어준다
			matzipDTO.setStep(new Integer(0));//글 순서
			matzipDTO.setIndent(new Integer(0));//글 깊이 
		}
		
		sqlSession.insert("matzip.mat_insertBoard",matzipDTO);
		
		return "redirect:mat_list";//response.sendRedirect("List.jsp")
	}//writePro() end
	

	//글 수정 폼
	@RequestMapping("/mat_updateForm")
	public ModelAndView updateForm(String no, String pageNum) 
		throws NamingException, IOException {
		
		int num1=Integer.parseInt(no);
		MatzipDto dto = sqlSession.selectOne("matzip.mat_contentBoard", num1);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.addObject("dto", dto);
		mv.setViewName(".main.matzip.mat_updateForm"); //뷰 이름
		
		return mv;
	}//updateForm end
	
	//DB 글 수정
	@RequestMapping(value="updatePro", method=RequestMethod.POST)
	public ModelAndView updatePro(MatzipDto matzipDTO, String pageNum)
		throws NamingException, IOException {
		
		sqlSession.update("matzip.mat_updateBoard", matzipDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageNum", pageNum);
		mv.setViewName("redirect:mat_list"); //뷰 이름
		
		return mv;
	}
		
	//글 삭제
	@RequestMapping("delete")
	public String delete(Model model, String no, String pageNum) {
		
		int no1=Integer.parseInt(no);
		sqlSession.update("matzip.mat_deleteBoard", no1);
		
		return "redirect:mat_list";
	}

}//class end
