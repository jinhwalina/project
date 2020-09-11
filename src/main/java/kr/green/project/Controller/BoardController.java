package kr.green.project.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.Controller.utils.UploadFileUtils;
import kr.green.project.Service.BoardService;
import kr.green.project.Service.InnService;
import kr.green.project.Service.UserService;
import kr.green.project.Vo.ReviewBoardVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	private String uploadPath = "D:\\이진화\\UploadFiles"; // 업로드 된 파일 저장되는 경로
	
	// 후기 게시판 리스트 get
	@RequestMapping(value = "/review_board/review_list", method = RequestMethod.GET)
	public ModelAndView reviewListGet(ModelAndView mv, Criteria cri) {
		mv.setViewName("/review_board/review_list");
		// 페이지네이션, 게시판 목록 불러오는거 ( 아직 게시물이 없기때문에 나중으로 )
		PageMaker pm = boardService.getPageMakerByBoard(cri);
		ArrayList<ReviewBoardVo> list = boardService.getBoardList(cri);
		mv.addObject("list",list);
		mv.addObject("pm",pm);
		return mv;
	}
	// 후기 게시판 글쓰기 get, post
	@RequestMapping(value = "/review_board/review_register", method = RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		mv.setViewName("/review_board/review_register"); 
		return mv;
	}
	@RequestMapping(value = "/review_board/review_register", method = RequestMethod.POST)
	public ModelAndView boardRegisterPost(ModelAndView mv, ReviewBoardVo board, HttpServletRequest r, MultipartFile file2) throws IOException, Exception {
		mv.setViewName("redirect:/review_board/review_list"); // 등록하면 리스트로 보냄
		UserVo user = userService.getUser(r);
		board.setReview_u_mail(userService.getUser(r).getMail());
		// 조건문 없이 첨부파일이 없는 상태에서 등록을 하게되면 기본값(?)이 저장되어 들어왔었지만, 이렇게 조건문을 추가해주게되면 공백으로 처리되어 null값이 들어오게된다.
		if(file2!=null && file2.getOriginalFilename().length() != 0) {
			String file = UploadFileUtils.uploadFile(uploadPath, file2.getOriginalFilename(),file2.getBytes());
			board.setReview_file(file);
		}
		boardService.insertBoard(board,user);
		return mv;
	}
	// 후기 게시판 디테일 get
	// dto 패키지를 새로 만들어서 조인이 필요한 정보들을 담아줬다. 이후 매퍼에서 조인해준 후 사용했음! 
	@RequestMapping(value = "/review_board/review_detail", method = RequestMethod.GET)
	public ModelAndView boardDetailGet(ModelAndView mv, Integer num, Criteria cri) {
		mv.setViewName("/review_board/review_detail"); 
		ReviewBoardVo board = boardService.view(num); // 조회수 증가 시켜주기 위해서 쓰는 코드
		// 새로만든 dto메서드를 활용한 방법.
		mv.addObject("review_board", boardService.dto(num));
		mv.addObject("cri",cri);
		return mv;
	}
	
	// 후기 게시판 삭제! 
	@RequestMapping(value = "/review_board/review_delete", method = RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv, HttpServletRequest r, Integer num) {
		mv.setViewName("redirect:/review_board/review_list"); 
		boardService.deleteBoard(num,userService.getUser(r));
		return mv;
	}
	
	// 업로드 한 파일 다운로드 관련 코드
	@ResponseBody
	@RequestMapping(value="review_board/review_download") // 다운로드는 복붙 후 경로 지정해주면 된다.
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	    	// HttpHeaders 객체 생성
	        HttpHeaders headers = new HttpHeaders();
	        // 다운로드 할 파일을 읽어옴
	        in = new FileInputStream(uploadPath+fileName);
	        // 다운로드시 저장 할 때 파일명 ! =을 통해서 덮어씀
	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        // 헤더에 컨텐츠 타입을 설정
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        // 헤더 정보를 추가
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        // ResponseEntity 객체 생성, 전송할 파일, 헤더정보, 헤더 상태
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); // 파일을 못읽어 왔을 때 
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	// 추천 기능
	@RequestMapping(value ="/review_board/review_up", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> boardUp(@RequestBody int num, HttpServletRequest r){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    // 현재 로그인 중인 유저 정보
	    UserVo user = userService.getUser(r);
	    if(user == null) {
	    	map.put("isUser",false);
	    }else {
	    	map.put("isUser",true);
	    	int up = boardService.updateUp(num, user.getMail());
	    	map.put("up",up);
	    }

	    return map;
	}
	// 후기 게시판 수정 get,post
	@RequestMapping(value = "/review_board/review_modify", method = RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, Integer num, HttpServletRequest r, Criteria cri) { 
    // jsp 정보를 넘겨줄때, list 같은 경우 페이지 넘버와 등등 정보들을 보내줘야하지만, cri 설정을 안해주게되면 보내주는 정보가 없어서 오류가 생기게 된다
		mv.setViewName("/review_board/review_modify"); 
		ReviewBoardVo board = boardService.getBoard(num);
		System.out.println(board);
		UserVo user = userService.getUser(r);
		if(board==null || !user.getMail().equals(board.getReview_u_mail()))
			mv.setViewName("redirect:/review_board/review_list");
		mv.addObject("review_board", boardService.dto(num));
		mv.addObject("cri", cri);
		return mv;
	}
	@RequestMapping(value = "/review_board/review_modify", method = RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv, HttpServletRequest r, ReviewBoardVo board, MultipartFile file2) throws IOException, Exception {
		mv.setViewName("redirect:/review_board/review_list");
		board.setReview_u_mail(userService.getUser(r).getMail());
		// 수정 페이지에서 기존 파일을 삭제하고 새로운 첨부파일이 추가가 되면, 
		if(!file2.getOriginalFilename().contentEquals("")) {
			String fileName = UploadFileUtils.uploadFile(uploadPath, file2.getOriginalFilename(), file2.getBytes());
			board.setReview_file(fileName);
		}else if(board.getReview_file() == null || board.getReview_file().equals("")) {
			board.setReview_file(null);
		}
		
		boardService.updateBoard(board);
		System.out.println(board);
		return mv;
		
	}
	
	
}



















