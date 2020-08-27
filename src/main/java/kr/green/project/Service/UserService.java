package kr.green.project.Service;

import kr.green.project.Vo.UserVo;

public interface UserService {
	public String getUser(String mail);

	public UserVo isLogin(UserVo user);
}
