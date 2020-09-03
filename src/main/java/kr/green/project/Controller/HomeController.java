package kr.green.project.Controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.Service.InnService;
import kr.green.project.Service.UserService;
import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	InnService innService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 메인화면
	@RequestMapping(value = "/")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("/main/home"); 
		return mv;
	}
	
	// 로그인 get
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/user/login"); 
		return mv;
	}
	
	// 로그인 post
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public ModelAndView homePost(ModelAndView mv, UserVo user) {
		mv.setViewName("/main/home"); 
		UserVo dbUser = userService.isLogin(user);
		
		// 밑에 이렇게 두 줄 추가해줄 경우 콘솔 창에는 login: 로그인 한 사람의 디비 정보를 다 불러오게되고, user는 비밀번호와 메일만 불러오게된다. 
		System.out.println("login:" + dbUser);
		System.out.println(user);
		if(dbUser != null) {
			mv.setViewName("redirect:/"); //성공
			mv.addObject("user",dbUser);
		} else
			mv.setViewName("/user/login"); //실패
		return mv;
	}
	
	// 로그아웃 
	@RequestMapping(value = "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("redirect:/");
		request.getSession().removeAttribute("user");
		return mv;
	}
	
	// 회원가입 GET , POST
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("/user/signup"); 
		return mv;
	}
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, UserVo user) {
		mv.setViewName("/user/signup"); 
		if(userService.signup(user)) {
			mv.setViewName("redirect:/");
		} else
			mv.setViewName("redirect:user/signup");
		System.out.println(user);
		return mv;
	}
	
	// 예약하기 GET, POST
	@RequestMapping(value = "/reservation/innDo", method = RequestMethod.GET)
	public ModelAndView innDoGet(ModelAndView mv) {
		mv.setViewName("/reservation/innDo"); 
		return mv;
	}
	
	@RequestMapping(value = "/reservation/innDo", method = RequestMethod.POST)
	public ModelAndView innDoPost(ModelAndView mv, InnVo inn, PetVo pet, HttpServletRequest request) {
		mv.setViewName("/reservation/innDo"); 
		UserVo user = userService.getUser(request);
		// sys로 로그인 한 유저 정보가 찍히는지.. (세션에 저장된 정보를 가져오는지 확인하기 )
		innService.insertInnDo(user, pet, inn); // 괄호 안에는 정보를 보내주려는 변수(?) 속성(?)
		// insertInnDo에 차례대로 user, pet, inn 정보 넘겨주기. 
		
		
		// 어떤 경우에 실패하게 될지 결정 후, 조건을 넣어서 연결해주기
		mv.setViewName("/reservation/innDoCom"); // 로그인 성공 시 보여줄 페이지 정보
		
		return mv;
	}
	
	
	// 예약완료 떴을 경우 보여지는 페이지 
	@RequestMapping(value = "/reservation/innDoCom", method = RequestMethod.GET)
	public ModelAndView innDoCom(ModelAndView mv) {
		mv.setViewName("/reservation/innDoCom");
		return mv;
	}
	
	/*	@RequestMapping(value = "/reservation/innDo", method = RequestMethod.POST)
			public ModelAndView innDoPost(ModelAndView mv) {
			mv.setViewName("/reservation/innDo"); 
			Date date = new Date();
			ArrayList<String> list = userService.getList(date);
			return mv;
		} 
		선생님이 예제로 알려주신 코드 ( 해당 날짜에 예약 인원이 얼마나 있는지 확인 )*/

	
}
