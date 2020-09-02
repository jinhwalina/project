package kr.green.project.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dao.InnDao;

@Service
public class InnServiceImp implements InnService {

	@Autowired
	InnDao innDao;
	
	@Override
	public void insertInnDo(HttpServletRequest request, InnVo inn) {
		UserVo user = (UserVo)request.getSession().getAttribute("user");
		// request 에 담긴 로그인 한 유저 정보 
		
		innDao.insertInnDo(user.getMail(),inn);
		// dao에 user의 메일과 숙박정보를 보내줌 
	}

	@Override
	public void insertPet(HttpServletRequest request, PetVo pet) {
		UserVo user = (UserVo)request.getSession().getAttribute("user");
		innDao.insertPet(user.getMail(), pet);
	}


	
	// 퍼블릭 보이드 ( 컨트롤러에서 만든 메서드 ) ~~ htt
	// 	dao.insert~~ 숙박정보 + 유저~~
	// 퍼블릭 보이드  ~~ htt 강아지 정보
	// dao.get~~ 숙박정보 ( 유저메일을 통해 숙박번호 받아오기 ) 
	// select max(num) from 숙박정보 where mail = 유저메일 ( 이렇게 설정해주는 이유는 제이 마지막 큰 숫자가 최근일이 되기 때문에! )
	// dao.insert 강아지정보 + 유저 + 숙박번호 ~~ 
}
