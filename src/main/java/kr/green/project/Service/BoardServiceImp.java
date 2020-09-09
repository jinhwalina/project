package kr.green.project.Service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.Vo.ReviewBoardVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dao.BoardReviewDao;
import kr.green.project.dao.UserDao;
import kr.green.project.dto.reviewDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

@Service
public class BoardServiceImp implements BoardService {
	
	@Autowired
	private BoardReviewDao boardReviewDao;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public PageMaker getPageMakerByBoard(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardReviewDao.getTotalCountByBoard(cri));
		return pm;
	}
	
	// 리뷰게시판 리스트
	@Override
	public ArrayList<ReviewBoardVo> getBoardList(Criteria cri) {
		return boardReviewDao.getBoardList(cri);
	}
	
	// 리뷰게시판 글 등록
	@Override
	public void insertBoard(ReviewBoardVo board, UserVo user) {
		board.setReview_u_mail(user.getMail());
		boardReviewDao.insertBoard(board);
		
	}
	
	// 게시판 가져오는
	@Override
	public ReviewBoardVo getBoard(Integer num) {
		if(num == null)
			return null;
		return boardReviewDao.getBoard(num);
	}
	
	// 조회수 증가를 위해 적어준 코드. board가 null값이 아니라면 조회수 증가를 1 시켜준다. 
	@Override
	public ReviewBoardVo view(Integer num) {
		ReviewBoardVo board = getBoard(num);
		if(board != null) {
			board.setReview_view(board.getReview_view()+1);
			boardReviewDao.updateBoard(board);
		}
		return board;
	}
	
	public void updateBoard(ReviewBoardVo board) {
		board.setReview_isDel('N');
		boardReviewDao.updateBoard(board);
	}
	
	
	@Override
	public reviewDto dto(Integer num) {
		return boardReviewDao.getDto(num);
	}
	

}
