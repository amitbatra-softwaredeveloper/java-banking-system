<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="back_n_logout.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'returnloan.jsp' starting page</title>
    
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
   <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
  <br><br>&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br>
  <fieldset>
  <legend><font size="4" face="Comic Sans MS" color="#ff0000">Loan Return Form...</font></legend>
  <form action="http://localhost:8080/bank/servlet/s1?type=returnloan" method="post">
  <table width="495" border="0" bgcolor="#b0ffc5" align="center" height="197">
<tbody><tr>
<td>&nbsp;<strong>Account No. :</strong><br></td>
<td>&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td>&nbsp;<strong>Returned by :</strong><br></td>
<td>&nbsp;<select size="1" name="list1">
<option selected value="it">Itself</option>
<option value="vitness">Vitness</option>
</select>
</td></tr>
<tr>
<td>&nbsp;<strong>Amount Borrowed :</strong><br></td>
<td>&nbsp;<input type="text" name="text1"></td></tr>
<tr>
<td>&nbsp;<strong>Date of Return :</strong><br></td>
<td>&nbsp;<input type="text" size="2" name="text2" maxlength="2">&nbsp;<input type="text" size="2" maxlength="2" name="text3">&nbsp;<input type="text" size="4" name="text4" maxlength="4"></td></tr>
<tr>
<td>&nbsp;<strong>Returned On :</strong><br></td>
<td>&nbsp;<select size="1" name="list2">
<option selected value="on">On Date</option>
<option value="before">Before Date</option>
<option value="after">After Date</option>
</select></td></tr><tr><td valign="top"><br></td><td valign="top">&nbsp;<input type="submit" value="Deposite" name="button2"></td></tr>
</tbody></table></form></fieldset>
  </body>
  <% } else { %>
 <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <%} %>
</html>
