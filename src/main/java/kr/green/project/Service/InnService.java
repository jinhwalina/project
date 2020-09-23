package kr.green.project.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dto.mypageDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

public interface InnService {

	
	void insertInnDo(UserVo user, PetVo pet, InnVo inn);
	
	// 예약하는 날짜들을 모아주는 리스트 ! 여기서 imp로 보내주기
	ArrayList<String> getDateList(Calendar cal, int max);

	PetVo getMyPet(int inn_petnum);

	ArrayList<mypageDto> getMyInn(String mail, Criteria cri);

	PageMaker getPageMakerByMypage(Criteria cri,String mail);

	void deleteInn(InnVo inn);

	ArrayList<mypageDto> getAdminInn(Criteria cri);

	PageMaker getPageMakerByAdmin(Criteria cri);

	void getUpdatePay(InnVo inn);

	ArrayList<InnVo> getRefund(Criteria cri);
	ArrayList<InnVo> getRefund(InnVo inn);

	PageMaker getPageMakerByRefund(Criteria cri, UserVo user);

	InnVo getinn(InnVo inn);

	void insertRefund(InnVo data);

	void updateRefund(InnVo data);

	void updateRefund2(int data);


}
