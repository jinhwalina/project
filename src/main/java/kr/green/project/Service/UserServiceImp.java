package kr.green.project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.project.Vo.UserVo;
import kr.green.project.dao.UserDao;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	UserDao userDao;
	
	@Autowired 
	BCryptPasswordEncoder passwordEncoder; 
	
	@Override
	public String getUser(String mail) {
		return userDao.getNickname(mail);
	}
	
	// 로그인 할 당시 
	@Override
	public UserVo isLogin(UserVo user) {
		UserVo dbUser = userDao.getUser(user.getMail());
		// userDao에 getUser라는 메서드를 만들어서 작업해라 > getMail()의 값을 전달해줄테니!
		if(dbUser != null && passwordEncoder.matches(user.getPw(),dbUser.getPw())) {
		// 윗줄에 바로 주석처리 한 부분은 암호화 한 패스워드와 내가 입력한 패스워드가 같은지의 여부를 비교하는 코드.
		//if(dbUser != null && user.getPw().equals(dbUser.getPw())) {
			// 이 윗줄같은 경우는 내가 입력한 정보와 디비에 있는 정보가 문자열!로 같은지를 비교해서 리턴값을 알려주는 코드.
			return dbUser;
		}
		return null;	
	}
	
	@Override
	public boolean signup(UserVo user) {
		if(user == null) return false;
		if(user.getMail() == null || user.getMail().length() == 0) return false;
		if(user.getPw() == null || user.getMail().length() == 0) return false;
		if(user.getNickname() == null || user.getMail().length() == 0) return false;
		if(user.getName() == null || user.getMail().length() == 0)return false;
		if(user.getName() == null || user.getMail().length() == 0)return false;
		
		// 아이디 (메일)이 있는 경우
		if(userDao.getUser(user.getMail()) != null)
		return false;
		
		// 비밀번호 암호화
		String encodePw = passwordEncoder.encode(user.getPw());
		user.setPw(encodePw);
		
		// 회원가입진행
		userDao.insertUser(user);
		
		return true;
	}
	
}
