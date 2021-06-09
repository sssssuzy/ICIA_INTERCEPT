package com.example.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	String namespace="com.example.mapper.UserMapper";
	@Autowired
	SqlSession session;

	@Override
	public UserVO login(String uid) throws Exception {
		return session.selectOne(namespace+".login",uid);
	}

	@Override
	public void insert(UserVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
		
	}
}
