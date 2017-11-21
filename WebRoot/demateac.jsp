<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demateac.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br><br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br>
 <fieldset>
 <legend><font size="4" face="Courier New" color="#008000">Create Demate Account...</font></legend>
 <form action="" method="post">
  <table width="438" border="1" bgcolor="#d200d2" align="center" height="188" bordercolor="yellow">
<tbody><tr>
<td>&nbsp;<strong>Enter Name :</strong><br></td>
<td>&nbsp;<input type="text" name="text1"></td></tr>
<tr>
<td>&nbsp;<strong>Father's Name :</strong><br></td>
<td>&nbsp;<input type="text" name="text2"></td></tr>
<tr>
<td>&nbsp;<strong>Amount Deposited :</strong><br></td>
<td>&nbsp;<input type="text" name="text3"></td></tr>
<tr>
<td>&nbsp;<strong>Form No. :</strong><br></td>
<td>&nbsp;<input type="text" name="text4"></td></tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;<input type="submit" value="Create" name="button1"></td></tr>

</tbody></table></form></fieldset><br></body>
</html>
