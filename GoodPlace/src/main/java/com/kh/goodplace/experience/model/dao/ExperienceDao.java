package com.kh.goodplace.experience.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.common.model.vo.Attachment;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.experience.model.vo.ExpPay;
import com.kh.goodplace.experience.model.vo.Experience;
import com.kh.goodplace.member.model.vo.Member;
import com.kh.goodplace.room.model.vo.Room;

@Repository("expDao")
public class ExperienceDao {

	public int selectExpListCount(SqlSessionTemplate sqlSession, int usNo) {
		return sqlSession.selectOne("expMapper.selectExpListCount", usNo);
	}

	public ArrayList<Experience> selectExpList(SqlSessionTemplate sqlSession, PageInfo pi, int usNo) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("expMapper.selectExpList", usNo, rowBounds);
	}

	public int insertExp(SqlSessionTemplate sqlSession, Experience e) {
		return sqlSession.insert("expMapper.insertExp", e);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("expMapper.insertAttachment", at);
	}

	public ArrayList<Experience> selectExp(SqlSessionTemplate sqlSession, int exNo) {
		return (ArrayList)sqlSession.selectList("expMapper.selectExp", exNo);
	}

	public Experience selectExpOne(SqlSessionTemplate sqlSession, int exNo) {
		return sqlSession.selectOne("expMapper.selectExpOne", exNo);
	}

	public ArrayList<Attachment> selectAt(SqlSessionTemplate sqlSession, int exNo) {
		return (ArrayList)sqlSession.selectList("expMapper.selectAt", exNo);
	}

	public int updateExp(SqlSessionTemplate sqlSession, Experience e) {
		return sqlSession.update("expMapper.updateExp", e);
	}

	public int updateAt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("expMapper.updateAt", at);
	}
	
	public int updateReExp(SqlSessionTemplate sqlSession, Experience e) {
		return sqlSession.update("expMapper.updateReExp", e);
	}

	public int restExp(SqlSessionTemplate sqlSession, int exNo) {
		return sqlSession.update("expMapper.restExp", exNo);
	}

	public int deleteExp(SqlSessionTemplate sqlSession, int exNo) {
		return sqlSession.update("expMapper.deleteExp", exNo);
	}

	public int endRestExp(SqlSessionTemplate sqlSession, int exNo) {
		return sqlSession.update("expMapper.endRestExp", exNo);
	}
	
	public int deleteAt(SqlSessionTemplate sqlSession, String deList) {
		return sqlSession.delete("expMapper.deleteAt", deList);
	}
	
	
	
	// --------- 체험관리 시작 -----------------
	
	public int selectListExpWaitCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("expMapper.selectListExpWaitCount");
		
	}
	
	public ArrayList<Experience> selectExpWaitList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("expMapper.selectExpWaitList", null, rowBounds);
		
	}
	
	public int selectListExpOkayCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("expMapper.selectListExpOkayCount");
		
	}
	
	public ArrayList<Experience> selectExpOkayList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("expMapper.selectExpOkayList", null, rowBounds);
		
	}
	

	public Experience selectExpmWaitDetail(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.selectOne("expMapper.selectExpmWaitDetail", eno);
		
	}
	
	public int updateOkay(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.update("expMapper.updateOkay", eno);
		
	}
	
	public int updateReject(SqlSessionTemplate sqlSession, Experience e) {
		
		return sqlSession.update("expMapper.updateReject", e);
		
	}
	
	public int expSearchCount(SqlSessionTemplate sqlSession, Experience e) {
		
		return sqlSession.selectOne("expMapper.expSearchCount", e);
		
	}
	
	public ArrayList<Experience> expSearchList(SqlSessionTemplate sqlSession, PageInfo pi, Experience e){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("expMapper.expSearchList", e, rowBounds);
		
	}

	
	// --------- 체험관리 시작 -----------------
	
	
	// ---------- [예약관리 시작] ------------
	
	public int selectRvExpListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("expMapper.selectRvExpListCount", userNo);
	}
	//확정 후
	public int selectRvExpConfirmListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("expMapper.selectRvExpConfirmListCount", userNo);
	}
	
	//취소
	public int selectRvExpCancelListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("expMapper.selectRvExpCancelListCount", userNo);
	}
	
	public ArrayList<Experience> selectRvExpList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return  (ArrayList)sqlSession.selectList("expMapper.selectRvExpList", userNo, rowBounds);
	}
	
	//확정
		public ArrayList<Experience> selectRvExpConfirmList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
			int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return  (ArrayList)sqlSession.selectList("expMapper.selectRvExpConfirmList", userNo, rowBounds);
		}

		//취소=
		public ArrayList<Experience> selectRvExpCancelList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo){
			int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return  (ArrayList)sqlSession.selectList("expMapper.selectRvExpCancelList", userNo, rowBounds);
		}

		public Experience reservationExpDetailView(SqlSessionTemplate sqlSession, int epno) {
			return sqlSession.selectOne("expMapper.reservationExpDetailView", epno);
		}
		
		public Experience reservationExpDetailView2(SqlSessionTemplate sqlSession, int epno) {
			System.out.println("dao에서 epno : " + epno);
			Experience e = sqlSession.selectOne("expMapper.reservationExpDetailView2", epno);
			System.out.println("dao에서 : " + e);
			return e;
		}
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	// --------- 체험관리 시작 -----------------
	
		//------------[체험조회 시작]------------
		public ArrayList<Experience> selectExpListUser(SqlSessionTemplate sqlSession, Experience exp){
			return (ArrayList)sqlSession.selectList("expMapper.selectExpListUser", exp);
		}
		
		public int selectExpCountUser(SqlSessionTemplate sqlSession, int expCategory){
			return sqlSession.selectOne("expMapper.selectExpCountUser", expCategory);
		}
		
		public Experience selectExpUser(SqlSessionTemplate sqlSession, int exNo){
			return sqlSession.selectOne("expMapper.selectExpUser", exNo);
		}
		
		public ArrayList<Experience> getAcceptedPeople(SqlSessionTemplate sqlSession, int exNo, int expClassNo, String expDateString) {
			Experience exp = new Experience();
			exp.setExNo(exNo);
			exp.setExpClassNo(expClassNo);
			exp.setExpDateString(expDateString);
			return (ArrayList)sqlSession.selectList("expMapper.selectAcceptedPeople", exp);
		}
		
		public ArrayList<Attachment> getDetailImages(SqlSessionTemplate sqlSession, int exNo){
			return (ArrayList)sqlSession.selectList("expMapper.selectDetailImages", exNo);
		}
		
		public Member getPartner(SqlSessionTemplate sqlSession, int usNo) {
			return sqlSession.selectOne("memberMapper.selectPartner", usNo);
		}
		
		public int payExp(SqlSessionTemplate sqlSession, ExpPay expPay) {
			return sqlSession.update("expMapper.updateExpPay", expPay);
		}
		
		public Experience getPayInfo(SqlSessionTemplate sqlSession, int epNo) {
			return sqlSession.selectOne("expMapper.selectExpPayInfo", epNo);
		}
		
		public ArrayList<Integer> getEpNo(SqlSessionTemplate sqlSession){
			return (ArrayList)sqlSession.selectList("expMapper.selectEpNoList");
		}
		
		//------------[체험조회 끝]------------
		
	// 마이페이지
	public ArrayList<ExpPay> selectExpPayList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("expMapper.selectExpPayList", m);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
