package kr.green.project.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;

public interface InnService {

	
	void insertInnDo(UserVo user, PetVo pet, InnVo inn);
	
	// 예약하는 날짜들을 모아주는 리스트 ! 여기서 imp로 보내주기
	ArrayList<String> getDateList(Calendar cal, int max);

	InnVo getMyInn(String mail);

	PetVo getMyPet(int inn_petnum);



}
