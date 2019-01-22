<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.absence.model.vo.*,java.util.*" %>
    <%
    	List<Absence> list=(List)request.getAttribute("list");
    %>
<%@ include file="/views/common/adminheader.jsp"%>








<%@include file="/views/common/footer.jsp"%>