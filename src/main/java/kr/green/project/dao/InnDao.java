package kr.green.project.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import kr.green.project.Vo.DateVo;
import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.dto.mypageDto;

public interface InnDao {

	public void insertPet(@Param("pet")PetVo pet) ;

	public void insertInn(@Param("inn")InnVo inn);

	public ArrayList<DateVo> getDates(@Param("strdate")String strdate);



	public InnVo getMyInninfo(@Param("num")int num);

	public PetVo getMyPet(@Param("inn_petnum")int inn_petnum);

	public ArrayList<mypageDto> getMyInn(@Param("mail")String mail, @Param("today")String today);
}
