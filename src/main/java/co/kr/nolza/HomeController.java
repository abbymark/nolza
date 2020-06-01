package co.kr.nolza;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.book.Book_boardDto;
import model.fb.FB_boardDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 * @throws NamingException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, String pageNum, String book_type,String fb_category) throws NamingException, IOException {



		//*****************************************************
		HashMap<String, Object> map =new HashMap<String,Object>();
		map.put("start",0);
		map.put("cnt",10);
		List<Book_boardDto> list=null;
	
		list=sqlSession.selectList("book_board.selectList", map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		
		//====================================================================================
		HashMap<String,Object> map2=new HashMap<String,Object>();
		map2.put("start",0);
		map2.put("cnt",10);
		List<FB_boardDTO> list2 = null;
		
		list2=sqlSession.selectList("fb_board.selectList",map2);
		
		model.addAttribute("list2",list2);
		model.addAttribute("pageNum",pageNum); ///////// 
		
		
		//====================================================================================
		HashMap<String , Object> map3=new HashMap<String,Object>();
		map3.put("start",0); // 0
		map3.put("cnt",10);  // 10
		
		List<HashMap<String, String>> mat_list3=null;
		mat_list3=sqlSession.selectList("matzip.mat_selectList",map2);
		model.addAttribute("mat_list3",mat_list3);
		
		
		return ".main.member.main";
	}
	
}
