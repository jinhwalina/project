package kr.green.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.project.Vo.QnaBoardVo;
import kr.green.project.Vo.QnaReplyVo;
import kr.green.project.dto.qnaDto;
import kr.green.project.pagination.Criteria;

public interface BoardQnaDao {

	int getTotalCountByBoard2(@Param("cri")Criteria cri);

	ArrayList<QnaBoardVo> getBoardList2(@Param("cri")Criteria cri);

	void insertBoard2(@Param("qna")QnaBoardVo qna);

	QnaBoardVo getBoard2(@Param("num")Integer num);

	void updateBoard2(@Param("qna")QnaBoardVo qna);

	qnaDto getDto2(@Param("num")Integer num);
	
	public List<QnaReplyVo> readReply(@Param("reply_num")int reply_num) throws Exception;
	
	public void writeReply (@Param("qna")QnaReplyVo qna) throws Exception;

	int getCount(@Param("reply_qna_num")int reply_qna_num);
}
