<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="item-left" style="width:150px">
   <a href="/board/list">게시판</a>
</div>

<div class="item-left" style="width:150px">
   <a href="/board/insert">글쓰기</a>
</div>

<div class="item-left" style="width:150px">
   <a href="/board/update?bno=100">글수정</a>
</div>

<div class="item-right">
   <c:if test="${uid !=null}">
   <span style="margin-right:20px;">${uid}님</span>
   <a href="/user/logout">로그아웃</a>
   </c:if>
   <c:if test="${uid ==null}">
   <a href="/user/login">로그인</a>
   </c:if>
   
</div>