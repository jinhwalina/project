package kr.green.project.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import kr.green.project.Vo.DateVo;
import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dto.mypageDto;
import kr.green.project.pagination.Criteria;

public interface InnDao {

	public void insertPet(@Param("pet")PetVo pet) ;

	public void insertInn(@Param("inn")InnVo inn);

	public ArrayList<DateVo> getDates(@Param("strdate")String strdate);



	public InnVo getMyInninfo(@Param("num")int num);

	public PetVo getMyPet(@Param("inn_petnum")int inn_petnum);

	public ArrayList<mypageDto> getMyInn(@Param("mail")String mail, @Param("today")String today,  @Param("cri")Criteria cri);

	public int getTotalCountByMypage(@Param("cri")Criteria cri, @Param("mail")String mail, @Param("today")String today);

	public void deleteInn(@Param("inn")InnVo inn);

	public ArrayList<mypageDto> getAdminInn(@Param("today")String today, @Param("cri")Criteria cri);

	public int getTotalCountByAdmin(@Param("cri")Criteria cri, @Param("today")String today);

	public void getUpdatePay(@Param("inn")InnVo inn);

	public int getTotalCountByRefund(@Param("cri")Criteria cri, @Param("today")String today, @Param("user")UserVo user);

	public ArrayList<InnVo> getRefund(@Param("cri")Criteria cri, @Param("today")String today);

	public ArrayList<InnVo> getRefund2(@Param("inn")InnVo inn);

	public void insertRefund(@Param("data")InnVo data);

	public void updateRefund(@Param("data")InnVo data);

	public InnVo getRefund3(@Param("inn_num")String inn_num);

	public void updateRefund2(@Param("data")int data);



}
