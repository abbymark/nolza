package co.kr.nolza;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SessionLogout implements HttpSessionListener{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("session logIN!! called!");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("session logout called!");
		String mem_id=(String) se.getSession().getAttribute("mem_id");
		HashMap map= new HashMap();
		map.put("mem_id", mem_id);
		//map.put("mem_login_state", 0);
		System.out.println(mem_id);
		sqlSession.update("member.updateLoginState",map);
		System.out.println(11123);
	}

}
