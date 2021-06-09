<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <h1>게시판 목록</h1>
    <c:forEach items="${list}" var="vo">
    	<div class="panel panel-default">
         <div class="panel-heading" style="cursor:pointer" onClick="location.href='/board/update?bno=${vo.bno}'">${vo.title}</div>
         <div class="panel-body">${vo.content}</div>
      </div>
    </c:forEach>
    