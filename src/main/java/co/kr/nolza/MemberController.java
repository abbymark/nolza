package co.kr.nolza;
import java.io.IOException;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
import java.util.HashMap;
import java.util.List;

import model.member.MemberDto;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main.do")
	public String main() {
		return ".main.member.main";
	}
	
	//회원가입폼으로
	@RequestMapping("/mem_insertForm.do")
	public String insertForm() {
		return ".main.member.mem_insertForm";
	}
	
	//id,nick중복 체크
	@RequestMapping(value="/mem_idNickCheck.do", method=RequestMethod.POST)
	public String idCheck(String mem_id, String mem_nick, Model model) {
		//id 중복체크
		int idCheck=-1;
		String idNickCheck=mem_id;
		MemberDto memberDto=sqlSession.selectOne("member.idNickCheck",idNickCheck);
		
		if(memberDto==null) {
			idCheck=1;//사용 가능한 id
		}
		
		model.addAttribute("idCheck", idCheck);
		
		//nick 중복체크
		int nickCheck=-1;
		idNickCheck=mem_nick;
		memberDto=sqlSession.selectOne("member.idNickCheck",idNickCheck);
		
		if(memberDto==null) {
			nickCheck=1;//사용 가능한 nick
		}
		
		model.addAttribute("nickCheck", nickCheck);
		return "member/mem_idNickCheck";
	}
	
	//회원가입
	@RequestMapping(value="/mem_insertPro.do", method=RequestMethod.POST)
	public String insertMember(MemberDto memberDto)
	throws NamingException, IOException{
		sqlSession.insert("member.insertMember", memberDto);
		
		return ".main.member.mem_login";
	}
	
	//로그인 폼
	@RequestMapping("/mem_login.do")
	public String loginForm() {
		return ".main.member.mem_login";
	}
	
	//로그인
	@RequestMapping(value="/mem_loginPro.do", method=RequestMethod.POST)
	public String userLogin(String mem_id, String mem_pw, Model model, HttpSession session)
	throws NamingException, IOException{
		HashMap <String, Object>map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("mem_pw", mem_pw);
		
		MemberDto memberDto = sqlSession.selectOne("member.selectLogin", map);
		if(memberDto==null || memberDto.getMem_login_state().equals("1")) {//로그인 실패
			model.addAttribute("msg", "로그인 실패");
			return ".main.member.mem_login";
		}
		model.addAttribute("memberDto", memberDto);
		
		session.setAttribute("mem_id", memberDto.getMem_id());
		session.setAttribute("mem_nick", memberDto.getMem_nick());
		session.setAttribute("mem_grade", memberDto.getMem_grade());
		
		map.put("mem_login_state",1);
		sqlSession.update("member.updateLoginState",map);
		return "redirect:.main.member.main";
	}
	//로그아웃
	@RequestMapping("mem_logout.do")
	public String userOut(HttpSession session) {
		HashMap <String, Object>map = new HashMap<String, Object>();
		map.put("mem_id",session.getAttribute("mem_id"));
		map.put("mem_login_state",0);
		sqlSession.update("member.updateLoginState",map);
		
		session.invalidate();
		
		return "redirect:.main.member.main";
	}
	
	
	//회원정보 수정 폼
	@RequestMapping(value="/mem_editForm.do", method=RequestMethod.GET)
	public String editForm(String mem_id, Model model)
	throws NamingException, IOException{
		MemberDto memberDto=sqlSession.selectOne("member.selectOne", mem_id);
		model.addAttribute("memberDto", memberDto);
		
		return ".main.member.mem_editForm";
	}
	
	//회원정보 수정
	@RequestMapping(value="/mem_editPro.do", method=RequestMethod.POST)
	public String editPro(MemberDto memberDto)
	throws NamingException, IOException{
		sqlSession.update("member.updateMember", memberDto);
		
		return ".main.member.main";
	}
	
	//회원 탈퇴
	@RequestMapping(value="/mem_delete.do", method=RequestMethod.POST)
	public String userDelete(String mem_id) throws NamingException, IOException{
		sqlSession.update("member.deleteMember", mem_id);
		
		return ".main.member.main";
	}

	
	//=========================================== 관리자========================================
	//관리리스트
	@RequestMapping("/admin_list")
	public String admin_listForm(Model model,String pageNum)
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
		
		count=sqlSession.selectOne("member.selectCount");//총 글 갯수 
		
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
		
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1); // 0
		map.put("cnt",pageSize);  // 10
		
		List<HashMap<String, String>> t=sqlSession.selectList("member.selectList",map);
		
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
		model.addAttribute("selectList",t);
		
		
		return ".main.admin.admin_list";
	}
	
	//admin_update
	//관리자 수정 폼
	@RequestMapping(value="admin_updateForm", method=RequestMethod.GET)
	public ModelAndView admin_updateForm(Model model,String mem_id) {
		
		MemberDto t=(MemberDto)sqlSession.selectOne("member.selectOne",mem_id);
	
		model.addAttribute("dto",t);
		//System.out.println(t);
		
		return new ModelAndView(".main.admin.admin_updateForm","memberDto",t);
	}//updateForm end
	
	//DB 글 수정
	@RequestMapping(value="admin_updatePro", method=RequestMethod.POST)
	public String admin_updateForm(@ModelAttribute("memberDto") MemberDto memberDto) throws NamingException, IOException {
		
		sqlSession.update("member.admin_memberUpdate",memberDto);
		
		//System.out.println(3);
		
		return "redirect:admin_list"; 
	}

	//회원 삭제
	@RequestMapping(value="/admin_deletePro", method=RequestMethod.GET)
	public String admin_deletePro(String mem_id) throws NamingException, IOException {
		
		sqlSession.update("member.deleteMember",mem_id);
		
		return "redirect:admin_list"; //뷰이름
	}
}





























