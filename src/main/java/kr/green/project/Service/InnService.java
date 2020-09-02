package kr.green.project.Service;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;

public interface InnService {

	void insertInnDo(HttpServletRequest request, InnVo inn);

	void insertPet(HttpServletRequest request, PetVo pet);
	
}
