package com.example.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	String namespace="com.example.mapper.BoardMapper";
	@Autowired
	SqlSession session;
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return session.selectList(namespace + ".list",cri);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
