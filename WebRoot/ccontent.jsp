<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<input type="image" src="../images/logout.jpg" onclick="javascript:location.replace('http://localhost:8080/bank/index.jsp');" align="right"/>
<jsp:useBean id="cb" class="aa.cbean" scope="request"></jsp:useBean>
<%@ taglib uri="/header.tld" prefix="h" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ccontent.jsp' starting page</title>
    
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
   <% 
  	 String a=request.getParameter("accno");
  	 String p=request.getParameter("pin");
   %>
  <h:header></h:header>
  <font size="4" face="Comic Sans MS" color="#8000ff">
  Account No : <jsp:getProperty name="cb" property="accno"/> 
  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
   Name : <jsp:getProperty name="cb" property="fname"/>&nbsp;<jsp:getProperty name="cb" property="lname"/>  </font><br>&nbsp;<br>
   <hr noshade="noshade" style="font-weight: lighter; background-color: #FF0000" />
<img src="../images/clientservices.jpg"> 
<table border="0" width="530" height="154">
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=clook" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="a" value="a">
<input type="hidden" name="b" value="b">
<input type="image" src="../images/transfer.jpg" align="left"></form></td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=clook" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="a" value="a">
<input type="image" src="../images/balance.jpg" align="right"></form>
</td></tr>
<tr><td>
<form action="http://localhost:8080/bank/changepin.jsp" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="image" src="../images/cpin.jpg" align="left"></form></td>
<td></td>
</tr></table>
<br><br>



<img src="../images/cstatus.jpg"> 
<table border="0" width="534" height="158">
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=loanstatus" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="image" src="../images/lstatus.jpg" align="left"></form></td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=fdstatus" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="image" src="../images/fdstatus.jpg" align="right"></form>
</td>
</tr>
<tr>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=clook" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="image" src="../images/tstatus.jpg" align="left"></form>
</td>
<td></td>
</tr></table>
<br><br>

<img src="../images/minvest.jpg">
<table width="535" height="95">
<tr>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=share" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="image" src="../images/share1.jpg" align="left"></form>
</td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=cshare" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="image" src="../images/cshare.jpg" align="right"></form>
</td>
</tr>
</table>
<br><br>

<img src="../images/help1.jpg"> 
<table width="534" height="159">
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=c" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="g" value="a">
<input type="image" src="../images/prob1.jpg" align="left"></form></td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=response" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="image" src="../images/response1.jpg" align="right"></form>
</td>
</tr>
<tr><td>
<form action="http://localhost:8080/bank/terms.jsp" method="post">
<input type="image" src="../images/terms1.jpg" align="left"></form>
</td></tr></table>

  </body>
</html>
