package kr.green.project.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import kr.green.project.Vo.QnaBoardVo;
import kr.green.project.Vo.QnaReplyVo;
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
	
	public List<QnaReplyVo> readReply(int num) throws Exception;
	
	public void writeReply (QnaReplyVo qna) throws Exception;

	void deleteReply(Integer data);


}
