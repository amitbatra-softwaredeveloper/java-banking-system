<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<p align="right">
  <input type="image" src="../images/back.jpg" onclick="javascript:history.go(-1);"/>
 </p>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updates.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="4"><font color="#004080">****</font><font color="#400040">LATEST</font> <font size="5"><u><font color="#008000">TRADING</font></u></font> <font color="#400040">COSTS</font><font color="#004080">****</font></font><br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <table width="399" border="1" bgcolor="#9d9dff" align="center" height="207">
<tbody><tr>
<td>&nbsp;<strong><font size="4">Funds :</font></strong><br></td>
<td>&nbsp;<input type="text" name="text1" readonly="readonly" value="<%= request.getAttribute("p") %>"></td></tr>
<tr>
<td>&nbsp;<font size="4"><strong>Debentures :</strong></font><br></td>
<td>&nbsp;<input type="text" name="text2" readonly="readonly" value="<%= request.getAttribute("q") %>"></td></tr>
<tr>
<td>&nbsp;<font size="4"><strong>Shares :</strong></font><br></td>
<td>&nbsp;<input type="text" name="text3" readonly="readonly" value="<%= request.getAttribute("r") %>"></td></tr>
<tr>
<td>&nbsp;<font size="4"><strong>Bonds :</strong></font><br></td>
<td>&nbsp;<input type="text" name="text4" readonly="readonly" value="<%= request.getAttribute("s") %>"></td></tr>
</tbody></table>
  </body>
</html>
