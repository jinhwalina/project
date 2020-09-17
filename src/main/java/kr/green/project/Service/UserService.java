package kr.green.project.Service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.UserVo;

public interface UserService {
	
	// 로그인
	public UserVo isLogin(UserVo user);
	
	// 회원가입
	public boolean signup(UserVo user);
	
	// user 정보 받아오기 
	public UserVo getUser(HttpServletRequest request);

	public void updateUser(UserVo user, UserVo mypageUser);

}
