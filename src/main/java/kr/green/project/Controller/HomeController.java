package kr.green.project.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.Service.InnService;
import kr.green.project.Service.UserService;
import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dto.mypageDto;

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
	
	// get, post 처리의 차이점> get 같은 경우는 중요하지 않고 짧은 정보들을 봉여줄때 사용해주고.
	// post 같은 경우> 비밀번호가 들어가는 중요한 정보들이나 전송해야 할 정보들이 길 경우에 사용해준다.
	
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
		// 이 밑에 있는 코드같은 경우, 등록되어지는 날짜들을 취합해주기 위한 코드.
		// 하루 최대 이용 가능한 max 값. 원래는 imp에 적혀있었지만, 번거롭기 때문에 컨트롤러에서 지정해줘서 작동시키는게 편하다.
		int max = 2;
		ArrayList<String> list = innService.getDateList(Calendar.getInstance(),max); //arraylist에 담아서 innService로 getDateList를 보내줌
		//ArrayList<String> list2 = innService.getDateList2(list); //arraylist에 담아서 innService로 getDateList를 보내줌
		// 현재로는 9월달에 해당하는 값들만 작동시키지만, Calendar.getInstance()부분은 ( 현재 오늘에 해당하는 날임 ) 부분을 수정해서 10, 11, 12월 등 다른 달도 적용시킬수있어햐한다. > ajax 이용하기.
		//list에 list를 넣어주는 코드 
		mv.addObject("list",list);
		System.out.println(list);
		
		return mv;
	}
	
	@RequestMapping(value = "/reservation/innDo", method = RequestMethod.POST)
	public ModelAndView innDoPost(ModelAndView mv, InnVo inn, PetVo pet, HttpServletRequest request) {
		mv.setViewName("/reservation/innDo"); 
		UserVo user = userService.getUser(request);
		// sys로 로그인 한 유저 정보가 찍히는지.. (세션에 저장된 정보를 가져오는지 확인하기 )
		 innService.insertInnDo(user, pet, inn); // 괄호 안에는 정보를 보내주려는 변수(?) 속성(?)
		// insertInnDo에 차례대로 user, pet, inn 정보 넘겨주기. 
		mv.setViewName("/reservation/innDoCom"); // 로그인 성공 시 보여줄 페이지 정보
		return mv;
	} 
	/* 선생님이 예제로 알려주신 코드 ( 해당 날짜에 예약 인원이 얼마나 있는지 확인 )*/
	
	
	// 예약완료 떴을 경우 보여지는 페이지 
	@RequestMapping(value = "/reservation/innDoCom", method = RequestMethod.GET)
	public ModelAndView innDoCom(ModelAndView mv) {
		mv.setViewName("/reservation/innDoCom");
		return mv;
	}
	
	// 예약확인 링크 > 마이페이지로
	@RequestMapping(value = "/user/mypage", method = RequestMethod.GET)
	public ModelAndView readMypage(ModelAndView mv, HttpServletRequest r) {
		mv.setViewName("/user/mypage");
		UserVo myUser = userService.getUser(r); 
		ArrayList<mypageDto> myInn = innService.getMyInn(myUser.getMail());
		for(mypageDto tmp : myInn) {
			System.out.println(tmp);
		}
		mv.addObject("myInn", myInn);
		
		return mv;
		
	}
	
	// 관리자 페이지 get
	@RequestMapping(value = "/admin/admin", method = RequestMethod.GET)
	public ModelAndView adminGet(ModelAndView mv, HttpServletRequest r) {
		mv.setViewName("/admin/admin"); 
		return mv;
	}
	
	// 회원정보 수정	
	@RequestMapping(value = "/mypageModi", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> mypageModiGet(@RequestBody UserVo user, HttpServletRequest r ) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		UserVo mypageUser = userService.getUser(r);
		userService.updateUser(user, mypageUser);
		// 세션에 있는 유저 정보도 덮어쓰기.
		r.getSession().setAttribute("user", user);
		return map;

	}
	
	// 예약취소
	@RequestMapping(value = "/deleteInn", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteInnPost(@RequestBody InnVo inn, HttpServletRequest r ) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
	
		return map;
		
		
	}


	
}
