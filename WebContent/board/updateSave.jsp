<%@page import="board.vo.FreeBoard"%>
<%@page import="board.dao.FreeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");		
	String ip = request.getRemoteAddr();
	
	String pageNo = request.getParameter("page");
	FreeBoardDao freedao = FreeBoardDao.getInstance();

	FreeBoard vo 
	= new FreeBoard(idx,null,null,subject,content,0,null,ip,0);

	freedao.update(vo);
	response.sendRedirect("detailAction.jsp?idx="+idx +"&page="+pageNo);   //글목록 화면으로 url 재요청
%>