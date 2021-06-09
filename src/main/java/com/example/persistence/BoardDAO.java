package com.example.persistence;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardDAO {
	public List<BoardVO> list(Criteria cri) throws Exception;
	public BoardVO read(int bno) throws Exception;
	public void delete(int bno) throws Exception;
 }
