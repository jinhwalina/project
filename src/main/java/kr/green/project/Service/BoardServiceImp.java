package kr.green.project.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.Vo.ReviewBoardVo;
import kr.green.project.dao.BoardReviewDao;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

@Service
public class BoardServiceImp implements BoardService {
	
	@Autowired
	private BoardReviewDao boardReviewDao;
	/*
	@Override
	public PageMaker getPageMakerByBoard(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardReviewDao.getTotalCountByBoard(cri));
		return pm;
	}

	@Override
	public ArrayList<ReviewBoardVo> getBoardList(Criteria cri) {
		return boardReviewDao.getBoardList(cri);
	}*/

}
