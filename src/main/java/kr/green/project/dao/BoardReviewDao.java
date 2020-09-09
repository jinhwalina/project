package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.Vo.ReviewBoardVo;
import kr.green.project.dto.reviewDto;
import kr.green.project.pagination.Criteria;

public interface BoardReviewDao {

	void insertBoard(@Param("review_board")ReviewBoardVo board); // param의 이름과 mapper에 쓰이는 이름과 동일해야한다.
	
	int getTotalCountByBoard(@Param("cri")Criteria cri);

	ArrayList<ReviewBoardVo> getBoardList(@Param("cri")Criteria cri);

	ReviewBoardVo getBoard(@Param("num")Integer num); // param 안에 있는 num 같은 이름은 mapper에서도 똑같이 맞춰서 써야한다 ! 

	void updateBoard(@Param("board")ReviewBoardVo board);

	reviewDto getDto(@Param("num")Integer num);
	

}
