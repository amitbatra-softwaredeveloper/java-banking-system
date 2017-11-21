<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@ include file="bhome.jsp"%>
<jsp:useBean id="b" class="aa.bbean" scope="request"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'bcontent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>&nbsp;<br>
  <% 
  	 String a=request.getParameter("accno");
  	 String p=request.getParameter("pin");
   %>
   <hr noshade="noshade" style="font-weight: lighter; background-color: #FF0000" />
<table border="0">
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;  <br></td>
<td colspan="2" align="right">
<form action="http://localhost:8080/bank/servlet/s1?type=search" method="post" onsubmit="return validate(this)"><font face="Comic Sans MS" size="5" color="#ff0000"> 
Search</font>&nbsp; :&nbsp;  <input type="text" name="accno" size="10"> <font size="4" face="Comic Sans MS" color="#00ff40">by </font>
<select size="1" name="list1">
<option selected value="accno">Account No.</option>
<option value="name">Name</option> 
</select>  
<input type="image" src="../images/search.jpg" align="left"></form>
</td></tr></table>
<br>


<img src="../images/accmgmt.jpg">
<table border="0" width="523" height="187">
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="a" value="a">
<input type="image" src="../images/transaction.jpg" align="left"></form></td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="h" value="a">
<input type="image" src="../images/status.jpg" align="right"></form>
</td>
</tr>
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="c" value="a">
<input type="image" src="../images/create.jpg" align="left"></form></td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="l" value="a">
<input type="image" src="../images/deleteacc.jpg" align="right"></form></td>
<td></tr>
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="d" value="a">
<input type="image" src="../images/edit.jpg" align="left"></form></td>
<td></td></table>
<br><br>



<img src="../images/bankservices.jpg">
<table border="0" width="523" height="186">
<tr>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="e" value="a">
<input type="image" src="../images/fd.jpg" align="left"></form>
</td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="j" value="a">
<input type="image" src="../images/collectfd.jpg" align="right"></form></td>
</tr>
<tr>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="f" value="a">
<input type="image" src="../images/loan.jpg" align="left"></form>
</td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="k" value="a">
<input type="image" src="../images/returnloan.jpg" align="right"></form></td>
</tr>
<tr>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="i" value="a">
<input type="image" src="../images/dd.jpg" align="left"></form>
</td>
<td></td></tr></table>
<br><br>




<img src="../images/invest.jpg">
<table border="0" width="525" height="172">
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="m" value="a">
<input type="image" src="../images/funds.jpg" align="left"></form>
</td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="n" value="a">
<input type="image" src="../images/shares.jpg" align="right"></form></td></tr>
<tr><td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="p" value="a">
<input type="image" src="../images/debentures.jpg" align="left"></form>
</td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="o" value="a">
<input type="image" src="../images/bonds.jpg" align="right"></form></td>
</tr>
<tr>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="q" value="a">
<input type="image" src="../images/cmi.jpg" align="left"></form>
</td>
<td></td></tr>
</table>
<br><br>



<img src="../images/help.jpg">
<table border="0" width="528" height="123">
<tr><td> 
<form action="http://localhost:8080/bank/servlet/s1?type=b" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="hidden" name="g" value="a">
<input type="image" src="../images/prob.jpg" align="left"></form></td>
<td>
<form action="http://localhost:8080/bank/servlet/s1?type=response" method="post">
<input type="hidden" name="accno" value="<%= a %>">
<input type="hidden" name="pin" value="<%= p %>">
<input type="image" src="../images/response.jpg" align="right"></form>
</td>
</tr>
<tr><td>
<form action="../terms.jsp" method="post">
<input type="image" src="../images/terms.jpg" align="left"></form></td>
<td></td></tr></table>
<br>
</body>
<script type="text/javascript">
  function validate(v)
  {
  if(v.accno.value=="")
  {
  alert("Account no./Name can not be left blank");
  v.accno.focus();
  return false;
  }
  return true;
  }
  </script>
</html>
