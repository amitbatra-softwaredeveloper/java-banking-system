<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cb" class="aa.cbean" scope="request"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deletequestion.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form action="http://localhost:8080/bank/servlet/s1?type=deletefunds" method="post">
  <input type="hidden" name="ftype" value="<jsp:getProperty name="cb" property="add"/>">
  <input type="hidden" name="nof" value="<jsp:getProperty name="cb" property="age"/>">
  <input type="hidden" name="fdate" value="<jsp:getProperty name="cb" property="city"/>">
  <input type="hidden" name="accno" value="<jsp:getProperty name="cb" property="accno"/>">
  <input type="submit" value="delete">
  </form>
  </body>
</html>
