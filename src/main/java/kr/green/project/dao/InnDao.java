package kr.green.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;

public interface InnDao {

	public void insertPet(@Param("pet")PetVo pet) ;

	public void insertInn(@Param("inn")InnVo inn);
}
