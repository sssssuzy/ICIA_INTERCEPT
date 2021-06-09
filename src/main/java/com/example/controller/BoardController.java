package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Criteria;
import com.example.persistence.BoardDAO;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	BoardDAO dao;
	@RequestMapping("list")
	public String list(Model model,Criteria cri)throws Exception{
		cri.setPerPageNum(5);
		model.addAttribute("list",dao.list(cri));
		model.addAttribute("pageName","board/list.jsp");
		return "index";
	}
	@RequestMapping("insert")
	public String insert(Model model){
		model.addAttribute("pageName","board/insert.jsp");
		return "index";
	}
	@RequestMapping("update")
	public String update(Model model,int bno){
		model.addAttribute("bno",bno);
		model.addAttribute("pageName","board/update.jsp");
		return "index";
	}
}
