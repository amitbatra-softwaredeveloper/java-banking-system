<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="back_n_logout.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="cb" class="aa.cbean" scope="request"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editaccount.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><font face="Arial Black" style="background-color: rgb(0, 255, 0);" size="5">
  <marquee behavior="alternate"><font color="#8000ff">Welcome To SBI Online Banking....</font><br></marquee></font><font size="4"> 
  <font color="#8080ff">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <strong>Account No : </strong></font></font><strong><font color="#8080ff"><%= request.getParameter("accno") %></font></strong>
  
  <form action="http://localhost:8080/bank/servlet/s1?type=cr&b=a" method="post"><table width="422" align="center" border=0 style="background-color: lightgreen;" height="422">
      <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;">Edit Client's Account<br></td>
      </tr>

      <tr>
        <td align="center" colspan=2></td>
        
      </tr>
		<tr><td>  
          <input type="hidden" name="accno" value="<%=request.getParameter("accno") %>">
        </td>
      </tr>
      <tr>
        <td>First Name : </td>
        <td>
          <input type="text" name="text0" value="<jsp:getProperty name="cb" property="fname"/>">
        <td>
      </tr>
	 <tr>
        <td>Last Name : </td>
        <td>
          <input type="text" name="text1" value="<jsp:getProperty name="cb" property="lname"/>">
        <td>
      </tr>
      
      <tr><td valign="top">Address&nbsp;&nbsp;&nbsp;&nbsp; :<br></td><td valign="top">
      <input type="text" name="text2" value="<jsp:getProperty name="cb" property="add"/>"></td><td valign="top"><br></td></tr><tr><td valign="top">State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<br></td><td valign="top">
      <input type="text" name="text3" value="<jsp:getProperty name="cb" property="state"/>"></td><td valign="top"><br></td></tr><tr><td valign="top">City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :<br></td><td valign="top">
      <input type="text" name="text4" value="<jsp:getProperty name="cb" property="city"/>"></td><td valign="top"><br></td></tr><tr><td valign="top">Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :<br></td><td valign="top">
      <input type="text" name="text5" value="<jsp:getProperty name="cb" property="age"/>"></td><td valign="top"><br></td></tr><tr><td valign="top">Father's Name :<br></td><td valign="top">
      <input type="text" name="text6" value="<jsp:getProperty name="cb" property="fthname"/>"></td><td valign="top"><br></td></tr><tr><td valign="top">Occupation&nbsp; :<br></td><td valign="top">
      <input type="text" name="text7" value="<jsp:getProperty name="cb" property="occ"/>"></td><td valign="top"><br></td></tr><tr><td valign="top">Phone No.&nbsp; : <br></td><td valign="top">
      <input type="text" name="text9" value="<jsp:getProperty name="cb" property="pno"/>"></td><td valign="top"><br></td></tr><tr>
        <td><input type="submit" value="Update"></td>  
        
      </tr>

    </table>
  
  </body>
</html>
