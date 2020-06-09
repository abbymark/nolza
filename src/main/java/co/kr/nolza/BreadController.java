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

import model.matzip.BreadDto;
import model.matzip.MatzipDto;
import model.matzip.ReviewDto;

@Controller
public class BreadController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//map===============================================================================
	@RequestMapping("/map_content") //뷰
	public String map_content(Model model, String bread_name,String mem_id) throws NamingException, IOException{
		
	//System.out.println("content_right(bread_name)="+bread_name);  //쟝블랑제리
		
		BreadDto dto = sqlSession.selectOne("matzip.contentBread", bread_name); //빵집 내용
		
		model.addAttribute("dto",dto); //빵집 내용
		//System.out.println(dto);
		
		
		// 평균 점수 , 좋아요 총합
		//ReviewDto dto1 = sqlSession.selectOne("matzip.summaryReview", bread_name);
		// 평균 점수 , 좋아요 총합
		List<ReviewDto> summaryReview=sqlSession.selectList("matzip.summaryReview",bread_name);
		
		//summaryReview =[{sum_like=0, avg_score=60.0000}]
		
		//내용 뽑기
		List<ReviewDto> contentReview=sqlSession.selectList("matzip.contentReview",bread_name);
		
		//list =[{rev_date=2020-05-25 09:30:38, rev_content=정말 맛있고 좋습니다}]
		
		//String mat_content=dto.getContent();
		//content=content.replaceAll("\n", "<br>");
		
		model.addAttribute("bread_name",bread_name);
		model.addAttribute("summaryReview",summaryReview); //글 요약
		model.addAttribute("contentReview",contentReview); //리뷰 내용
		model.addAttribute("mem_id",mem_id); //리뷰 내용
		//System.out.println(contentReview);
		
		return ".main.bread.map_content";//뷰 리턴 
	}//list() end
	
	@RequestMapping("/map_content2") //뷰
	public String map_content2(Model model, String bread_name) throws NamingException, IOException{
		
	//System.out.println("content_right(bread_name)="+bread_name);  //쟝블랑제리
		
		BreadDto dto = sqlSession.selectOne("matzip.contentBread", bread_name); //빵집 내용
		
		model.addAttribute("dto",dto); //빵집 내용
		//System.out.println(dto);
		
		
		// 평균 점수 , 좋아요 총합
		//ReviewDto dto1 = sqlSession.selectOne("matzip.summaryReview", bread_name);
		// 평균 점수 , 좋아요 총합
		List<ReviewDto> summaryReview=sqlSession.selectList("matzip.summaryReview",bread_name);
		
		//summaryReview =[{sum_like=0, avg_score=60.0000}]
		
		//내용 뽑기
		List<ReviewDto> contentReview=sqlSession.selectList("matzip.contentReview",bread_name);
		
		//list =[{rev_date=2020-05-25 09:30:38, rev_content=정말 맛있고 좋습니다}]
		
		//String mat_content=dto.getContent();
		//content=content.replaceAll("\n", "<br>");
		
		model.addAttribute("bread_name",bread_name);
		model.addAttribute("summaryReview",summaryReview); //글 요약
		model.addAttribute("contentReview",contentReview); //리뷰 내용
		//System.out.println(contentReview);
		
		return ".main.bread.map_content2";//뷰 리턴 
	}//list() end
	
	//내용 왼쪽
	@RequestMapping("/location1") // 태극당 설명
	public String location1(Model model,String pageNum)
			throws NamingException,IOException{
		
		return ".main.bread.location1";//뷰 리턴 
	}//list() end
	
	@RequestMapping("/location2")
	public String location2(Model model,String pageNum)
			throws NamingException,IOException{
		
		return ".main.bread.location2";//뷰 리턴 
	}//list() end

	@RequestMapping("/location3")
	public String location3(Model model,String pageNum)
			throws NamingException,IOException{
		
		return ".main.bread.location3";//뷰 리턴 
	}//list() end

	@RequestMapping("/location4")
	public String location4(Model model,String pageNum)
			throws NamingException,IOException{
		
		return ".main.bread.location4";//뷰 리턴 
	}//list() end
	
	@RequestMapping("/location5")
	public String location5(Model model,String title)
			throws NamingException,IOException{
		
		//System.out.println(title); //어글리베이커리
		
		return ".main.bread.location5";//뷰 리턴 
	}//list() end
	
	
	//view main            =============================================================
	@RequestMapping("/map_main")
	public String map_main(Model model)
			throws NamingException,IOException{

		List<HashMap<String, String>> t = sqlSession.selectList("matzip.selectOne");

		// request.setAttribute(key,value)
		model.addAttribute("list", t);
		// key, value
		
		return ".main.bread.map_main";//뷰 리턴 
	}//list() end

	

	@RequestMapping("/lololololol")
	public String lololololol(Model model,String pageNum)
			throws NamingException,IOException{
		
		return ".main.bread.lololololol";//뷰 리턴 
	}//list() end
	
	 
// 테이블 설계 잘못 한듯 다시 확인 해야됨, 내용 상세 내용이랑, 리뷰 테이블이랑 따로 나눠서 둬야
//	//DB 글 수정, 상세화면에서 평균 점수, 좋아요 개수, 별점 수정하기
//	@RequestMapping(value="updatePro", method=RequestMethod.POST)
//	public String modify(@ModelAttribute("breadDTO") BreadDto breadDTO) {
//		sqlSession.update("matzip.update_like", breadDTO);
//		
//		return "redirect:content_right"; //response.sendredirect("list.jsp");
//	}
	
	
	
	//=============================== admin 관리자===========================================
	//내용 오른쪽 보기
 	@RequestMapping("/admin_review")
	//글 내용=======================================================================
	//글 내용보기
	public String admin_review(Model model, String bread_name) throws NamingException, IOException{
		
		BreadDto dto = sqlSession.selectOne("matzip.contentBread", bread_name); //빵집 내용
		
		List<ReviewDto> summaryReview=sqlSession.selectList("matzip.summaryReview",bread_name);
		
		//내용 뽑기
		List<ReviewDto> contentReview=sqlSession.selectList("matzip.contentReview",bread_name);
		
		model.addAttribute("dto",dto); //빵집 내용
		model.addAttribute("bread_name",bread_name);
		model.addAttribute("summaryReview",summaryReview); //글 요약
		model.addAttribute("contentReview",contentReview); //리뷰 내용
		
	return ".main.admin.admin_review"; //뷰 리턴
	}//content end
	
 	
	//글 삭제
	@RequestMapping("mngResDelPro")
	public String deleteReview(Model model, int rev_no) {
		
		//int rev_no1=Integer.parseInt(rev_no);
		
		sqlSession.update("matzip.deleteReview", rev_no);
		
		return "redirect:content_right?bread_name=어글리베이커리";
	}
 	
	
	@RequestMapping("form")
	public String form() {
		
		//int rev_no1=Integer.parseInt(rev_no);
		
		return ".main.admin.form";
	}
	
	@RequestMapping("tt")
	public String tt() {
		
		//int rev_no1=Integer.parseInt(rev_no);
		
		return ".main.bread.tt";
	
	}

	@RequestMapping(value="/rev_UpdatePro",method=RequestMethod.POST)
	public String rev_UpdatePro(@ModelAttribute("reviewDto") ReviewDto reviewDto,HttpServletRequest request)
			throws NamingException,IOException{
		sqlSession.insert("matzip.updateReview",reviewDto);
		
		return ".main.bread.rev_UpdatePro";
	
	}
	
	

	
	
}//class end
