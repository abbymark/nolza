package co.kr.nolza;
import java.io.IOException;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		return ".main.member.main";
	}
	//로그아웃
	@RequestMapping("mem_logout.do")
	public String userOut(HttpSession session) {
		HashMap <String, Object>map = new HashMap<String, Object>();
		map.put("mem_id",session.getAttribute("mem_id"));
		map.put("mem_login_state",0);
		sqlSession.update("member.updateLoginState",map);
		
		session.invalidate();
		
		return ".main.member.main";
	}
	
	
	//회원정보 수정 폼
	@RequestMapping(value="/mem_editForm.do", method=RequestMethod.POST)
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
}





























