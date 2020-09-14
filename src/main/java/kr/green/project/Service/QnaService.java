package kr.green.project.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import kr.green.project.Vo.QnaBoardVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dto.qnaDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

public interface QnaService {

	
	PageMaker getPageMakerByBoard2(Criteria cri);

	ArrayList<QnaBoardVo> getBoardList2(Criteria cri);

	void insertBoard2(QnaBoardVo qna, UserVo user);

	QnaBoardVo view2(Integer num);

	qnaDto dto(Integer num);

	void deleteBoard2(Integer num, UserVo user);

	QnaBoardVo getBoard2(Integer num);

	void updateBoard2(QnaBoardVo qna);

}
