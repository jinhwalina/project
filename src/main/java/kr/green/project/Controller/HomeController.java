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
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

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
	
	// 메인화면 이용안내 
	@RequestMapping(value = "/main/info", method = RequestMethod.GET)
	public ModelAndView info(ModelAndView mv) {
		mv.setViewName("/main/info"); 
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
		return mv;
	}
	
	// 예약하기 GET, POST
	@RequestMapping(value = "/reservation/innDo", method = RequestMethod.GET)
	public ModelAndView innDoGet(ModelAndView mv) {
		mv.setViewName("/reservation/innDo"); 
		// 이 밑에 있는 코드같은 경우, 등록되어지는 날짜들을 취합해주기 위한 코드.
		// 하루 최대 이용 가능한 max 값. 원래는 imp에 적혀있었지만, 번거롭기 때문에 컨트롤러에서 지정해줘서 작동시키는게 편하다.
		//int max = 10;
		//ArrayList<String> list = innService.getDateList(Calendar.getInstance(),max); //arraylist에 담아서 innService로 getDateList를 보내줌
		//ArrayList<String> list2 = innService.getDateList2(list); //arraylist에 담아서 innService로 getDateList를 보내줌
		// 현재로는 9월달에 해당하는 값들만 작동시키지만, Calendar.getInstance()부분은 ( 현재 오늘에 해당하는 날임 ) 부분을 수정해서 10, 11, 12월 등 다른 달도 적용시킬수있어햐한다. > ajax 이용하기.
		//list에 list를 넣어주는 코드 
		//mv.addObject("list",list);	
		return mv;
	}
	
	@RequestMapping(value = "/reservation/innDo", method = RequestMethod.POST)
	public ModelAndView innDoPost(ModelAndView mv, InnVo inn, PetVo pet, HttpServletRequest request) { 
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
	
	// 예약확인 링크 > 마이페이지
	@RequestMapping(value = "/user/mypage", method = RequestMethod.GET)
	public ModelAndView readMypage(ModelAndView mv, HttpServletRequest r, Criteria cri) {
		mv.setViewName("/user/mypage");
		UserVo myUser = userService.getUser(r); 
		cri.setPerPageNum(2); // 페이지에 보여질 예약 내역 갯수 지정 ! 2개로 지정함
		ArrayList<mypageDto> myInn = innService.getMyInn(myUser.getMail(),cri);
		for(mypageDto tmp : myInn) {
			System.out.println(tmp); // 향상된 for문으로 오늘날짜 기준 이후 list 불러옴 
		}
		PageMaker pm = innService.getPageMakerByMypage(cri,myUser.getMail());
		
		mv.addObject("myInn", myInn);
		mv.addObject("pm", pm);
		return mv;
		
	}
	// 결제유무 변경
	@RequestMapping(value = "/updatePay", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updatePayPost(@RequestBody InnVo inn, HttpServletRequest r ) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		innService.getUpdatePay(inn);
		return map;
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
		System.out.println(inn);
		Map<String, Object> map = new HashMap<String, Object>();
		innService.deleteInn(inn);
		return map;

	}

	// 관리자 페이지 get
		@RequestMapping(value = "/admin/admin", method = RequestMethod.GET)
		public ModelAndView adminGet(ModelAndView mv, HttpServletRequest r, Criteria cri) {
			mv.setViewName("/admin/admin"); 
			cri.setPerPageNum(4);
			ArrayList<mypageDto> adminInn = innService.getAdminInn(cri);
			if(adminInn != null)
				for(mypageDto tmp:adminInn) {
					
				}
			PageMaker pm = innService.getPageMakerByAdmin(cri);
			mv.addObject("adminInn",adminInn);
			mv.addObject("pm", pm);
			return mv;
		}
		
	// 사용자 환불 요청에 관한 관리자와 사용자만 접근 가능한 페이지 
		@RequestMapping(value = "/admin/refund", method = RequestMethod.GET)
		public ModelAndView refund(ModelAndView mv, HttpServletRequest r, InnVo inn, Criteria cri) {
			mv.setViewName("/admin/refund");
			cri.setPerPageNum(2);
			UserVo user = userService.getUser(r);
			
			ArrayList<InnVo> refund = null;
			
			if(user == null) {
				mv.setViewName("redirect:/");
			}
			// 관리자인 경우 
			if(user.getAuth().equals("ADMIN") ) {
				refund = innService.getRefund(cri); // 관리자인 경우에는 리스트 목록을 전체 다 불러오기때문에 페이지네이션이 필요하다.
			}
			// 관리자가 아닌경우 
			else{
				// inn의 기본키로 검색을 하고 
				// null 이면 ( 잘못된 접근이기때문에 다른 화면으로 ) 
				if( inn.getInn_num() == null || !user.getMail().equals(innService.getinn(inn).getInn_user_mail())) {
					// null이 아니면 user.mail 과 refund.inn_user_mail 이 일치하지 않으면 잘못된 접근 
					mv.setViewName("redirect:/");
				} else {
					// 일치하는 경우 
					refund = innService.getRefund(inn); // 사용자는 환불요청건 자체가 페이지에서 하나만 보여지기때문에 페이지네이션은 필요가 없다. 
				}
			}
			PageMaker pm = innService.getPageMakerByRefund(cri,user);
			mv.addObject("refund", refund);
			mv.addObject("pm",pm);
			return mv;
		}
		
		// 환불정보 입력 
		@RequestMapping(value = "/insertRefund", method = RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> insertRefund(@RequestBody InnVo data, HttpServletRequest r ) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();

			if(data.getRefund_name() == null) {//예금주이름이 null값이면 > 요청 여부만 바꾸고, 
				innService.updateRefund(data);
			} else {//예금주이름이 null값이 아니면 > 위에 두개 다 보내주기 
				innService.insertRefund(data); 
				innService.updateRefund(data);
			}
			return map;

		}
		
		@RequestMapping(value = "/updateRefund2", method = RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> updateRefund2(@RequestBody int data, HttpServletRequest r ) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			innService.updateRefund2(data);
			return map;

		}
		
		// 관리자 페이숙박 정보 수정 
		@RequestMapping(value = "/adminInnUpdate", method = RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> adminInnUpdate(@RequestBody mypageDto data, HttpServletRequest r ) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			innService.adminInnUpdate(data);
			return map;

		}
		
}
