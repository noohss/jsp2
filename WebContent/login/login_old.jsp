<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	// userid = "admin@gmail.com" 이고 비밀번호는 12345 라고 가정.
	// 임시 테스트
		out.print("<script>");
	if(userid.equals("admin@gmail.com") && password.equals("12345")){
		// 인증 성공 -> session 객체에 사용자 정보로 필요한 데이터를 애트리뷰트에 저장
		session.setAttribute("user", userid);
		session.setAttribute("sessionId", session.getId());
		out.print("alert('로그인 완료.');");
		out.print("location.href='home.jsp';");
	}else {
		// 인증 실패
		out.print("alert('로그인 계정 정보가 다릅니다.');");
		out.print("location.href='loginForm.jsp';");
	}
		out.print("</script>");
%>