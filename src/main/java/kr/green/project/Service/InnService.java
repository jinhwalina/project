package kr.green.project.Service;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;

public interface InnService {

	
	void insertInnDo(UserVo user, PetVo pet, InnVo inn);


}
