package kr.green.project.Service;

import java.util.ArrayList;

import kr.green.project.Vo.ReviewBoardVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dto.reviewDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

public interface BoardService {


	void insertBoard(ReviewBoardVo board, UserVo user);
	
	PageMaker getPageMakerByBoard(Criteria cri);

	ArrayList<ReviewBoardVo> getBoardList(Criteria cri); // 후기 게시판 목록 다 가져오는,,

	ReviewBoardVo view(Integer num);

	ReviewBoardVo getBoard(Integer num);

	reviewDto dto(Integer num);

	void deleteBoard(Integer num, UserVo user);

	int updateUp(int num, String mail);

}
