package kr.green.project.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.Service.UserService;
import kr.green.project.Vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/")
	public ModelAndView main(ModelAndView mv) throws Exception{
	    mv.setViewName("/main/home");
	    mv.addObject("setHeader", "타일즈");
	    System.out.println(userService.getUser("abc123@naver.com"));
	    return mv;
	}
	
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
	
}
