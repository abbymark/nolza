package co.kr.nolza;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.kr.utils.UploadFileUtils;
import model.song.Song_albumDTO;
import model.song.Song_boardDTO;
import model.song.Song_noticeDTO;
import model.song.Song_singerDTO;

@Controller
public class SongController {

	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//����Ʈ
	@RequestMapping("/list.do")
	public String list(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.selectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.selectList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.list";
	}//list() end
	
	//�Ϲݸ���Ʈ
	@RequestMapping("/noList.do")
	public String noList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.noselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.noList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.noList";
	}//list() end
	
	//��������Ʈ
	@RequestMapping("/songList.do")
	public String songList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.songselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.songList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.songList";
	}//list() end
	
	//���ݸ���Ʈ
	@RequestMapping("/cdList.do")
	public String cdList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.cdselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.cdList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.cdList";
	}//list() end
	
	//��Ʈ����Ʈ
	@RequestMapping("/chartList.do")
	public String chartList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.chartselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.chartList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.chartList";
	}//list() end
	
	//�Ĺ鸮��Ʈ
	@RequestMapping("/comeList.do")
	public String comeList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.comeselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.comeList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.comeList";
	}//list() end
	
	//��Ÿ����Ʈ
	@RequestMapping("/etcList.do")
	public String etcList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("board.etcselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_boardDTO> list=sqlSession.selectList("board.etcList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_board.etcList";
	}//list() end
			
	//�۾��� ��,��۾���
	@RequestMapping("/writeForm.do")
	public String writeForm(Model model,String no,String s_group,String s_step,String s_indent ,String pageNum){
		if(no==null) {//ó�� �۾���
			no="0";
			s_group="1";
			s_step="0";
			s_indent="0";
		}//if
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("no",no);
		model.addAttribute("s_group",s_group);
		model.addAttribute("s_step",s_step);
		model.addAttribute("s_indent",s_indent);

		return ".main.song_board.writeForm";
	}//writeForm()) end

	//DB�� �۾���
	@RequestMapping(value="writePro.do",method=RequestMethod.POST)
	public String writePro(@ModelAttribute("Song_boardDTO") Song_boardDTO boardDTO,HttpServletRequest request)
			throws NamingException,IOException{

		int maxNum=0;//����
		if(sqlSession.selectOne("board.maxNumber") != null) {
			maxNum=sqlSession.selectOne("board.maxNumber");
		}

		if(maxNum != 0) {//�ִ�۹�ȣ�� 0�� �ƴϸ�
			maxNum=maxNum+1;
		}else{//�ִ� �۹�ȣ�� 0 �̸�, ó�� �۾���
			maxNum=1;
		}

		String ip=request.getRemoteAddr();//ip���ϱ�
		boardDTO.setIp(ip);//dto�� setter �۾�

		if(boardDTO.getNo() != 0) {//����̸�

			sqlSession.update("board.songStep",boardDTO);//��� �����ֱ� ��ġ Ȯ��

			boardDTO.setS_step(boardDTO.getS_step()+1);//�� ����
			boardDTO.setS_indent(boardDTO.getS_indent()+1);//�� ���� 
		}else {//����
			boardDTO.setS_group(new Integer(maxNum));//�� �׷��ȣ , �� ���� �۹�ȣ�� ref�� �־��ش�
			boardDTO.setS_step(new Integer(0));//�� ����
			boardDTO.setS_indent(new Integer(0));//�� ���� 
		}

		sqlSession.insert("board.insertBoard",boardDTO);
		return "redirect:list.do";///response.sendRedirect("List.jsp")
	}//writePro() end

	//�۳��뺸�� 
	@RequestMapping("/content.do")
	public String content(Model model,String no,String pageNum) throws NamingException,IOException{

		int num1=Integer.parseInt(no);
		sqlSession.update("board.readCount",num1);//��Ƚ�� ���� 

		Song_boardDTO dto=sqlSession.selectOne("board.contentBoard",num1);

		String content=dto.getContent();

		model.addAttribute("content",content);
		model.addAttribute("dto",dto);
		model.addAttribute("no",no);
		model.addAttribute("pageNum",pageNum);

		return ".main.song_board.content";
	}//content() end

	//�� ���� ��
	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(String no,String pageNum) throws NamingException,IOException{

		int num1=Integer.parseInt(no);
		Song_boardDTO dto=sqlSession.selectOne("board.contentBoard",num1);

		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.addObject("dto",dto);
		mv.setViewName(".main.song_board.updateForm");//���̸�
		return mv;
	}//updateForm() end

	//DB�ۼ���
	@RequestMapping(value="updatePro.do",method=RequestMethod.POST)
	public ModelAndView updatePro(Song_boardDTO boardDTO,String pageNum) throws NamingException,IOException{
		sqlSession.update("board.updateBoard",boardDTO);
		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("redirect:list.do");
		return mv;
	}
	//�ۻ���
	@RequestMapping("/delete.do")
	public String delete(Model model , String no , String pageNum) {
		int num1=Integer.parseInt(no);
		sqlSession.delete("board.deleteBoard",num1);
		return "redirect:list.do";
	}//delete() end
	
	//--------------------------------------------
	//------------song_board_end------------------
	//--------------------------------------------	
	
	
	
	
	
	
	
	//--------------��������-------------------------
	
	//�۾��� ��,��۾���
	@RequestMapping("/noticeWriteForm.do")
	public String noticeWriteForm(Model model,String n_no,String pageNum){
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("n_no",n_no);

		return ".main.song_notice.noticeWriteForm";
	}//writeForm()) end

	//DB�� �۾���
	@RequestMapping(value="noticeWritePro.do",method=RequestMethod.POST)
	public String noticeWritePro(@ModelAttribute("Song_noticeDTO") Song_noticeDTO noticeDTO,HttpServletRequest request)
			throws NamingException,IOException{

		int maxNum=0;//����
		if(sqlSession.selectOne("notice.maxNumber") != null) {
			maxNum=sqlSession.selectOne("notice.maxNumber");
		}

		if(maxNum != 0) {//�ִ�۹�ȣ�� 0�� �ƴϸ�
			maxNum=maxNum+1;
		}else{//�ִ� �۹�ȣ�� 0 �̸�, ó�� �۾���
			maxNum=1;
		}

		sqlSession.insert("notice.insertNotice",noticeDTO);
		return "redirect:nmainList.do";
	}//writePro() end

	//������ü����Ʈ
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("notice.noticeSelectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_noticeDTO> list=sqlSession.selectList("notice.noticeList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_notice.noticeList";
	}//list() end
	
	//��������Ʈ
	@RequestMapping("/nmainList.do")
	public String nmainList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("notice.nmainselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_noticeDTO> list=sqlSession.selectList("notice.nmainList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_notice.nmainList";
	}//list() end
	
	//�̺�Ʈ����Ʈ
	@RequestMapping("/neventList.do")
	public String neventList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("notice.neventselectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_noticeDTO> list=sqlSession.selectList("notice.neventList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_notice.neventList";
	}//list() end
	
	//�۳��뺸�� 
	@RequestMapping("/noticeContent.do")
	public String noticeContent(Model model,String n_no,String pageNum) throws NamingException,IOException{

		int num1=Integer.parseInt(n_no);
		sqlSession.update("notice.readCount",num1);//��Ƚ�� ���� 

		Song_noticeDTO dto=sqlSession.selectOne("notice.contentNotice",num1);

		String content=dto.getN_content();

		model.addAttribute("content",content);
		model.addAttribute("dto",dto);
		model.addAttribute("n_no",n_no);
		model.addAttribute("pageNum",pageNum);

		return ".main.song_notice.noticeContent";
	}//content() end

	//�� ���� ��
	@RequestMapping("/noticeUpdateForm.do")
	public ModelAndView noticeUpdateForm(String n_no,String pageNum) throws NamingException,IOException{

		int num1=Integer.parseInt(n_no);
		Song_noticeDTO dto=sqlSession.selectOne("notice.contentNotice",num1);

		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.addObject("dto",dto);
		mv.setViewName(".main.song_notice.noticeUpdateForm");//���̸�
		return mv;
	}//updateForm() end

	//DB�ۼ���
	@RequestMapping(value="noticeUpdatePro.do",method=RequestMethod.POST)
	public ModelAndView noticeUpdatePro(Song_noticeDTO noticeDTO,String pageNum) throws NamingException,IOException{
		sqlSession.update("notice.updateNotice",noticeDTO);
		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("redirect:noticeList.do");
		return mv;
	}
	//�ۻ���
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(Model model , String n_no , String pageNum) {
		int num1=Integer.parseInt(n_no);
		sqlSession.delete("notice.deleteNotice",num1);
		return "redirect:noticeList.do";
	}//delete() end
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-------------�ٹ��Խ���--------------------------
	//���θ���Ʈ
	@RequestMapping("/albumMainList.do")
	public String albumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.albumMainList";
	}//list() end
	
	//���丮��Ʈ
	@RequestMapping("/SalbumList.do")
	public String SalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectSCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectSalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.SalbumList";
	}//list() end
	
	//POP����Ʈ
	@RequestMapping("/PalbumList.do")
	public String PalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectPCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectPalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.PalbumList";
	}//list() end
	
	//OST����Ʈ
	@RequestMapping("/OalbumList.do")
	public String OalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectOCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectOalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.OalbumList";
	}//list() end
	
	//Ʈ�Ը���Ʈ
	@RequestMapping("/TalbumList.do")
	public String TalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectTCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectTalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.TalbumList";
	}//list() end
	
	//JAZZ����Ʈ
	@RequestMapping("/JalbumList.do")
	public String JalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectJCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectJalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.JalbumList";
	}//list() end
	
	//CLASSIC����Ʈ
	@RequestMapping("/CalbumList.do")
	public String CalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectCCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectCalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.CalbumList";
	}//list() end
	
	//EDM����Ʈ
	@RequestMapping("/EalbumList.do")
	public String EalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectECount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectEalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.EalbumList";
	}//list() end
	
	//��Ÿ����Ʈ
	@RequestMapping("/ETCalbumList.do")
	public String ETCalbumList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("album.selectETCCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_albumDTO> list=sqlSession.selectList("album.selectETCalbumList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_album.ETCalbumList";
	}//list() end
	
	//�۾��� ��,��۾���
	@RequestMapping("/albumWriteForm.do")
	public String albumWriteForm(Model model,String a_no,String pageNum){
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("a_no",a_no);

		return ".main.song_album.albumWriteForm";
	}//writeForm()) end
	
	//DB�� �۾���
	@RequestMapping(value="albumWritePro.do",method=RequestMethod.POST)
	public String albumWritePro(@ModelAttribute("Song_albumDTO") Song_albumDTO albumDTO, MultipartFile file, HttpServletRequest request)
			throws NamingException,IOException,Exception{
				
		int maxNum=0;//����
		if(sqlSession.selectOne("album.maxNumber") != null) {
			maxNum=sqlSession.selectOne("album.maxNumber");
		}

		if(maxNum != 0) {//�ִ�۹�ȣ�� 0�� �ƴϸ�
			maxNum=maxNum+1;
		}else{//�ִ� �۹�ȣ�� 0 �̸�, ó�� �۾���
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

		albumDTO.setA_picture(fileName);
		
		sqlSession.insert("album.insertalbum",albumDTO);
		
		return "redirect:albumMainList.do";
	}//writePro() end

	//�۳��뺸�� 
	@RequestMapping("/albumContent.do")
	public String albumContent(Model model,String pageNum, HttpServletRequest request) throws NamingException,IOException{

		int a_no=Integer.parseInt(request.getParameter("a_no"));
				
		int num1=Integer.parseInt(request.getParameter("a_no"));
		
		sqlSession.update("album.readCount",num1);//��Ƚ�� ���� 

		Song_albumDTO dto=sqlSession.selectOne("album.contentalbum",num1);

		String content=dto.getA_content();

		model.addAttribute("content",content);
		model.addAttribute("dto",dto);
		model.addAttribute("a_no",a_no);
		model.addAttribute("pageNum",pageNum);

		return ".main.song_album.albumContent";
	}//content() end

	//�� ���� ��
	@RequestMapping("/albumUpdateForm.do")
	public ModelAndView albumUpdateForm(String a_no,String pageNum, HttpServletRequest request) throws NamingException,IOException{
				
		int num1=Integer.parseInt(request.getParameter("a_no"));
		Song_albumDTO dto=sqlSession.selectOne("album.contentalbum",num1);

		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.addObject("dto",dto);
		mv.setViewName(".main.song_album.albumUpdateForm");//���̸�
		return mv;
	}//updateForm() end

	//DB�ۼ���
	@RequestMapping(value="albumUpdatePro.do",method=RequestMethod.POST)
	public ModelAndView albumUpdatePro(Song_albumDTO albumDTO,String pageNum, MultipartFile file,HttpServletRequest request) throws NamingException,IOException,Exception{
		String realPath=request.getServletContext().getRealPath("/");
		String imgUploadPath = realPath+"\\resources\\" + File.separator + "imgUpload";
		String fileName = null;
		
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		}else {
			fileName = realPath+"\\resources\\" + File.separator + "images" + File.separator + "none.png";			
		}

		albumDTO.setA_picture(fileName);
		
		sqlSession.update("album.updatealbum",albumDTO);
		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("redirect:albumMainList.do");
		return mv;
	}
	
	//�ۻ���
	@RequestMapping("/deletealbum.do")
	public String deletealbum(Model model , String a_no , String pageNum) {
		int num1=Integer.parseInt(a_no);
		sqlSession.delete("album.deletealbum",num1);
		return "redirect:albumMainList.do";
	}//delete() end
	

	
	
	
	
	
	
	
	
	//-------------�����Խ���--------------------------
	//���θ���Ʈ
	@RequestMapping("/singerMainList.do")
	public String singerMainList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectsingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectsingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.singerMainList";
	}//list() end
	
	@RequestMapping("/FivesingerList.do")
	public String FivesingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectFivesingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectFivesingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.FivesingerList";
	}//list() end
	
	@RequestMapping("/SixsingerList.do")
	public String SixsingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectSixsingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectSixsingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.SixsingerList";
	}//list() end
	
	@RequestMapping("/SevensingerList.do")
	public String SevensingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectSevensingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectSevensingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.SevensingerList";
	}//list() end
	
	@RequestMapping("/EightsingerList.do")
	public String EightsingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectEightsingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectEightsingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.EightsingerList";
	}//list() end
	
	@RequestMapping("/NinesingerList.do")
	public String NinesingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectNinesingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectNinesingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.NinesingerList";
	}//list() end
	
	@RequestMapping("/SzerosingerList.do")
	public String SzerosingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectSzerosingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectSzerosingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.SzerosingerList";
	}//list() end
	
	@RequestMapping("/SonesingerList.do")
	public String SonesingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectSonesingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectSonesingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.SonesingerList";
	}//list() end
	
	@RequestMapping("/StwosingerList.do")
	public String StwosingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectStwosingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectStwosingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.StwosingerList";
	}//list() end
	
	@RequestMapping("/ETCsingerList.do")
	public String ETCsingerList(Model model,String pageNum) throws NamingException,IOException{

		if(pageNum==null) {
			pageNum="1";
		}

		int pageSize=10;//�� �������� 10����
		int currentPage=Integer.parseInt(pageNum);//���� ������

		int startRow=(currentPage-1)*pageSize+1;//�� �������� ���� ��
		int endRow=currentPage*pageSize;//�� �������� ������ ��

		int count=0;//�� ��ü ���� ���� ����
		int pageBlock=10;//1���� 10�������� ǥ���Ϸ���

		count=sqlSession.selectOne("singer.selectETCsingerCount");//�� �� ���� 

		int number=count-(currentPage-1)*pageSize;//�۹�ȣ 
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//�� ������ ����

		int result = currentPage/10; // 5/10=0  15/10=1 25/10=2
		int startPage=result*10+1;
		//              0*10+1= 1������       11������     21������
		int endPage=startPage + pageBlock - 1;
		//               1+10-1= 10 ������   20������     30������

		if(endPage>pageCount) {//���� ���� 
			endPage=pageCount;
		}

		//*********************************************
		HashMap<String , Integer> map=new HashMap<String,Integer>();
		map.put("start",startRow-1);
		map.put("cnt",pageSize);
		List<Song_singerDTO> list=sqlSession.selectList("singer.selectETCsingerList",map);
		//*********************************************

		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);

		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);

		model.addAttribute("startPage",startPage);////
		model.addAttribute("endPage",endPage);////

		model.addAttribute("number",number);
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);////////

		return ".main.song_singer.ETCsingerList";
	}//list() end
	
	//�۾��� ��
	@RequestMapping("/singerWriteForm.do")
	public String singerWriteForm(Model model,String ss_no,String pageNum){
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("ss_no",ss_no);

		return ".main.song_singer.singerWriteForm";
	}//writeForm()) end
	
	//DB�� �۾���
	@RequestMapping(value="singerWritePro.do",method=RequestMethod.POST)
	public String albumWritePro(@ModelAttribute("Song_singerDTO") Song_singerDTO singerDTO, MultipartFile file, HttpServletRequest request)
			throws NamingException,IOException,Exception{
				
		int maxNum=0;//����
		if(sqlSession.selectOne("album.maxNumber") != null) {
			maxNum=sqlSession.selectOne("album.maxNumber");
		}

		if(maxNum != 0) {//�ִ�۹�ȣ�� 0�� �ƴϸ�
			maxNum=maxNum+1;
		}else{//�ִ� �۹�ȣ�� 0 �̸�, ó�� �۾���
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
		

		singerDTO.setSs_picture(fileName);

		sqlSession.insert("singer.insertsinger",singerDTO);
		
		return "redirect:singerMainList.do";
	}//writePro() end

	//�۳��뺸�� 
	@RequestMapping("/singerContent.do")
	public String singerContent(Model model,String pageNum, HttpServletRequest request) throws NamingException,IOException{
		
		int ss_no=Integer.parseInt(request.getParameter("ss_no"));
		
		int num1=Integer.parseInt(request.getParameter("ss_no"));
		
		sqlSession.update("singer.readCount",num1);//��Ƚ�� ���� 

		Song_singerDTO dto=sqlSession.selectOne("singer.contentsinger",num1);

		String content=dto.getSs_content();

		model.addAttribute("content",content);
		model.addAttribute("dto",dto);
		model.addAttribute("ss_no",ss_no);
		model.addAttribute("pageNum",pageNum);

		return ".main.song_singer.singerContent";
	}//content() end
	
	//�� ���� ��
	@RequestMapping("/singerUpdateForm.do")
	public ModelAndView singerUpdateForm(String ss_no,String pageNum, HttpServletRequest request) throws NamingException,IOException{

		int num1=Integer.parseInt(request.getParameter("ss_no"));
		Song_singerDTO dto=sqlSession.selectOne("singer.contentsinger",num1);

		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.addObject("dto",dto);
		mv.setViewName(".main.song_singer.singerUpdateForm");//���̸�
		return mv;
	}//updateForm() end
			
	//DB�ۼ���
	@RequestMapping(value="singerUpdatePro.do",method=RequestMethod.POST)
	public ModelAndView singerUpdatePro(Song_singerDTO singerDTO,String pageNum, MultipartFile file,HttpServletRequest request) throws NamingException,IOException,Exception{
		
		String realPath=request.getServletContext().getRealPath("/");
		String imgUploadPath = realPath+"\\resources\\" + File.separator + "imgUpload";
		String fileName = null;
		
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
		}else {
			fileName = realPath+"\\resources\\" + File.separator + "images" + File.separator + "none.png";			
		}

		singerDTO.setSs_picture(fileName);
		
		sqlSession.update("singer.updatesinger",singerDTO);
		ModelAndView mv=new ModelAndView();
		mv.addObject("pageNum",pageNum);
		mv.setViewName("redirect:singerMainList.do");
		return mv;
	}
	
	
	
	//�ۻ���
	@RequestMapping("/deletesinger.do")
	public String deletesinger(Model model , String ss_no , String pageNum) {
		int num1=Integer.parseInt(ss_no);
		sqlSession.delete("singer.deletesinger",num1);
		return "redirect:singerMainList.do";
	}//delete() end

}//class end
