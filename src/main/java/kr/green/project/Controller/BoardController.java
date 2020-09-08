package kr.green.project.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.Service.BoardService;
import kr.green.project.Service.InnService;
import kr.green.project.Service.UserService;
import kr.green.project.Vo.ReviewBoardVo;
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
	
	// 후기 게시판 리스트 get
	@RequestMapping(value = "/review_board/review_list", method = RequestMethod.GET)
	public ModelAndView reviewListGet(ModelAndView mv, Criteria cri) {
		mv.setViewName("/review_board/review_list");
		//PageMaker pm = boardService.getPageMakerByBoard(cri);
		//ArrayList<ReviewBoardVo> list = boardService.getBoardList(cri);
		//mv.addObject("list",list);
		//mv.addObject("pm",pm);
		return mv;
	}
	@RequestMapping(value = "/review_board/review_register", method = RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		mv.setViewName("/review_board/review_register"); 
		return mv;
	}
	
	
}
