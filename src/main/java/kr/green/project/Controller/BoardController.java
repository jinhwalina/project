package kr.green.project.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "/review_board/review_detail", method = RequestMethod.GET)
	public ModelAndView boardDetailGet(ModelAndView mv, Integer num, Criteria cri) {
		mv.setViewName("/review_board/review_detail"); 
		ReviewBoardVo board = boardService.view(num); // 조회수 증가 시켜주기 위해서 쓰는 코드
		// 새로만든 dto메서드를 활용한 방법.
		mv.addObject("review_board", boardService.dto(num));
		mv.addObject("cri",cri);
		return mv;
	}
}






























