<%@page import="board.vo.FreeBoard"%>
<%@page import="board.dao.FreeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	String ip = request.getRemoteAddr();

	FreeBoardDao dao = FreeBoardDao.getInstance();
	FreeBoard vo 
	= new FreeBoard(0,writer,password,subject,content,0,null,ip,0);
//	= new Freeboard(0,"김땡땡","1212","글쓰기 테스트","잘되나요?",0,null,null,0);
	dao.insert(vo);
	response.sendRedirect("listAction.jsp");	// 페이지 수정
%>