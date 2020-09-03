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
	public void insertInnDo(UserVo user, PetVo pet, InnVo inn) {
		innDao.insertPet(pet);
		// pet에 관한 정보 추가 
		inn.setInn_petnum(pet.getPetnum());
		
		// user의 mail을 가져와서 Inn_user_mail로 설정해주겠다.
		inn.setInn_user_mail(user.getMail());

		// inn에 관한 내용 추가 
		innDao.insertInn(inn);
		
	}

	
	// 퍼블릭 보이드 ( 컨트롤러에서 만든 메서드 ) ~~ htt
	// 	dao.insert~~ 숙박정보 + 유저~~
	// 퍼블릭 보이드  ~~ htt 강아지 정보
	// dao.get~~ 숙박정보 ( 유저메일을 통해 숙박번호 받아오기 ) 
	// select max(num) from 숙박정보 where mail = 유저메일 ( 이렇게 설정해주는 이유는 제이 마지막 큰 숫자가 최근일이 되기 때문에! )
	// dao.insert 강아지정보 + 유저 + 숙박번호 ~~ 
}
