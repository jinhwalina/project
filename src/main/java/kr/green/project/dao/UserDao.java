package kr.green.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.project.Vo.UserVo;
 
public interface UserDao {

	public String getNickname(@Param("mail")String mail);

	public UserVo getUser(@Param("mail")String mail);

	public void insertUser(@Param("user")UserVo user);

	public void updateUser(@Param("user")UserVo user);
}
