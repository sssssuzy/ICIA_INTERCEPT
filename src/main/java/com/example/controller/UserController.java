package com.example.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.domain.UserVO;
import com.example.persistence.UserDAO;

@Controller
@RequestMapping("/user/")
public class UserController {
   
   @Autowired
   UserDAO dao;
   
   @Autowired
   BCryptPasswordEncoder passEncoder;
   
   @RequestMapping(value="insert", method=RequestMethod.POST)
   public String insert(UserVO vo)throws Exception{
	   String password = passEncoder.encode(vo.getUpw());
	   vo.setUpw(password);
	   dao.insert(vo);
	   return "redirect:login";
   }
   
   @RequestMapping("insert")
   public String insert(Model model){
      model.addAttribute("pageName","user/insert.jsp");
         return "/index";
   }
   
   @RequestMapping("login")
   public String login(Model model){
      model.addAttribute("pageName","user/login.jsp");
      return "/index";
   }
   
   @RequestMapping(value="login", method=RequestMethod.POST)
   @ResponseBody
   public HashMap<String,Object> loginPost(String uid,String upw, HttpSession session,boolean chkLogin,HttpServletResponse response)throws Exception{
      HashMap<String,Object> map = new HashMap<String,Object>();
      int result=0; //아이디가 존재하지않는경우
      UserVO vo = dao.login(uid);
      if(vo!=null){
	      if(passEncoder.matches(upw, vo.getUpw())){
	    	  result=1; //로그인성공
	    	  if(chkLogin){
	    	         Cookie cookie = new Cookie("uid",vo.getUid()); //쿠키생성
	    	         cookie.setPath("/");
	    	         cookie.setMaxAge(60*60*24*7);  //7일간 보관
	    	         response.addCookie(cookie);
	    	      }
	    	      session.setAttribute("uid", vo.getUid());
	    	      String path=(String)session.getAttribute("path");   
	    	      if(path==null) path="/";  
	    	      map.put("path", path);
	      }else{
	    	  result=2; //비밀번호 불일치
	      }
      }     
      map.put("result", result);      
      return map;
   }
   @RequestMapping("logout")
   public String logout(Model model,HttpSession session,HttpServletResponse response, HttpServletRequest request){
      model.addAttribute("pageName","home.jsp");
      session.invalidate(); //세션 정보 지우기
      Cookie cookie = WebUtils.getCookie(request, "uid");
      if(cookie != null){
         cookie.setPath("/");
         cookie.setMaxAge(0);
         response.addCookie(cookie);
      }
      return "/index";
   }
}