package kr.green.project.Service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.Vo.QnaBoardVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dao.BoardQnaDao;
import kr.green.project.dao.UserDao;
import kr.green.project.dto.qnaDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

@Service

public class QnaServiceImp implements QnaService {

	@Autowired
	private BoardQnaDao boardQnaDao;
	
	@Autowired
	private UserDao userDao;
	
	// 질문게시판 페이지네이션을 위한 
	@Override
	public PageMaker getPageMakerByBoard2(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardQnaDao.getTotalCountByBoard2(cri));
		return pm;
	}
	
	// 질문 게시판 글 목록
	@Override
	public ArrayList<QnaBoardVo> getBoardList2(Criteria cri) {
		return boardQnaDao.getBoardList2(cri);
	}
	
	// 질문게시판 글 등록 
	@Override
	public void insertBoard2(QnaBoardVo qna, UserVo user) {
		qna.setQna_u_mail(user.getMail());
		boardQnaDao.insertBoard2(qna);
	}
	
	// 질문게시판 조회수
	@Override
	public QnaBoardVo view2(Integer num) {
		QnaBoardVo qna = getBoard2(num);
		if(qna != null) {
			qna.setQna_view(qna.getQna_view()+1);
			boardQnaDao.updateBoard2(qna);
		}
		return qna;
	}
	
	// 질문 게시판 불러오는
	public QnaBoardVo getBoard2(Integer num) {
		if(num == null)
			return null;
		return boardQnaDao.getBoard2(num);
	}
	
	// dto 라는 새로운 클래스를 통해 메서드를 만들었음. 
	@Override
	public qnaDto dto(Integer num) {
		return boardQnaDao.getDto2(num);
	}
	
	// 질문 게시판 게시글 삭제 
	@Override
	public void deleteBoard2(Integer num, UserVo user) {
		QnaBoardVo qna = boardQnaDao.getBoard2(num);
		if(qna == null)
			return;
		if(qna.getQna_u_mail().equals(user.getMail())) {
			qna.setQna_isDel('Y');
			qna.setQna_del(new Date());
			boardQnaDao.updateBoard2(qna);
		} 
	}
	
	// 질문 게시판 수정 했을 때 업데이트 해주는
	@Override
	public void updateBoard2(QnaBoardVo qna) {
		qna.setQna_isDel('N');
		boardQnaDao.updateBoard2(qna);
	}

}
