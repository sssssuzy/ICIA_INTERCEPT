package com.example.persistence;

import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO login(String uid) throws Exception;
	public void insert(UserVO vo) throws Exception;
}
