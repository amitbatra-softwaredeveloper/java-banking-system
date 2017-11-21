<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<p align="right">
  <input type="image" src="./images/back.jpg" onclick="javascript:history.go(-1);"/>
  <input type="image" src="./images/logout.jpg" onclick="javascript:location.replace('http://localhost:8080/bank/index.jsp');"/>
  </p>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changepin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br><br>
  <fieldset>
  <legend><font size="4" face="Comic Sans MS" color="#804040">Change your Pin...</font></legend>
<form action="http://localhost:8080/bank/servlet/s1?type=cpin" method="post" onsubmit="return validate(this)">
<input type="hidden" value="<%= request.getParameter("accno") %>" name="accno"/>
<table width="453" border="0" bgcolor="#8080ff" align="center" height="134">
<tbody><tr>
<td>&nbsp;Enter Current Pin<br></td>
<td>&nbsp;<input type="password" name="pin"></td></tr>
<tr>
<td>&nbsp;Enter New Pin<br></td>
<td>&nbsp;<input type="password" name="text1"></td></tr>
<tr>
<td>&nbsp;ReEnter New Pin<br></td>
<td>&nbsp;<input type="password" name="text2"></td></tr>
<tr>
<td rowspan="2">&nbsp;</td>
<td>&nbsp;
<input type="submit" value="Change" name="button2"></td></tr>
</tbody></table></form></fieldset><br>
  </body>
  <script type="text/javascript">
  function validate(v)
  {
  if(v.pin.value=="")
  {
  alert("Pin can not be left blank");
  v.pin.focus();
  return false;
  }
  if((v.text1.value=="")||(v.text1.value!=v.text2.value))
  {
  alert("Confirm password doesn't match");
  v.text2.focus();
  return false;
  }
  }
  </script>
</html>
