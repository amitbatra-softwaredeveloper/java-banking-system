<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<p align="right">
  <input type="image" src="./images/back.jpg" onclick="javascript:history.go(-1);"/>
 </p>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'terms.jsp' starting page</title>
    
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
  <table width="664" height="162">
  <tr style="background-color:appworkspace">
  <td><font size="4" face="Latha">Transaction Rules</font><br></td><td><strong>Rs.</strong></td></tr>
  <tr>
  <td style="background-color: rgb(128, 128, 255);"><strong><font size="3" face="Arial">Initial Amount Deposite (minimum)</font></strong> </td>
  <td style="background-color: rgb(128, 128, 255);"><strong>1000</strong></td>
  </tr><tr><td valign="top" style="background-color: rgb(128, 128, 255);"><strong><font face="Arial">Balance required after money withdrawn</font></strong><br></td><td valign="top" style="background-color: rgb(128, 128, 255);"><strong>1000</strong><br></td></tr><tr><td valign="top" style="background-color: rgb(128, 128, 255);"><strong><font face="Arial">Balance required after money Transfer<br></font></strong></td><td valign="top" style="background-color: rgb(128, 128, 255);"><strong>1000</strong><br></td></tr>
  </table>
  <br>
  
  <hr width="100%" size="2">
  
  
  <br><hr width="100%" size="2">
 
 <table width="670" border="0" align="left" height="1370">
<tbody>
<tr>
<td style="background-color: rgb(128, 128, 192);"><font face="Book Antiqua" color="#0000a0"><strong>Fixed Deposite Rules&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></font><br></td>
<td style="background-color: rgb(128, 128, 192);">&nbsp;Interest(%)</td>
</tr>

<tr style="background-color: rgb(255, 128, 0);">
<td><font size="3" face="Arial"><strong>Minimum Deposite - Rs. 1000/-</strong></font><br></td><td></td>
</tr>
<tr style="background-color: rgb(128, 255, 255);">
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="#0000ff"><strong>For Time &lt; 1-2 year</strong></font><br></td><td></td>
</tr>
<tr style="background-color: rgb(128, 255, 255);"><td valign="top"><br></td><td></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;100000/-</strong></td><td valign="top" align="center" style="background-color: rgb(128, 255, 128);"><strong>2<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;500000/-</strong></td><td valign="top" align="center" style="background-color: rgb(128, 255, 128);"><strong>5<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;5000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(128, 255, 128);"><strong>10<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;50000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(128, 255, 128);"><strong>12<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;500000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(128, 255, 128);"><strong>15<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &gt;5000000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(128, 255, 128);"><strong>20<br></strong></td></tr>


<tr><td></td><td></td></tr>
<tr style="background-color: rgb(128, 255, 255);"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="#0000ff"><strong>For Time &lt; 3-4 year</strong></font><br></td><td></td>
</tr>
<tr style="background-color: rgb(128, 255, 255);"><td valign="top"><br></td><td></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;80000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 255, 128);"><strong>2<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;300000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 255, 128);"><strong>5<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;3000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 255, 128);"><strong>10<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;35000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 255, 128);"><strong>12<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;386000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 255, 128);"><strong>15<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &gt;4100000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 255, 128);"><strong>20<br></strong></td></tr>

<tr><td><br></td><td></td></tr><tr style="background-color: rgb(128, 255, 255);"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="#0000ff"><strong>For Time - 5 year</strong></font><br></td><td></td>
</tr>
<tr style="background-color: rgb(128, 255, 255);"><td valign="top"><br></td><td></td></tr><tr><td valign="top" style="background-color: rgb(255, 128, 255);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;50000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 128, 255);"><strong>2<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 128, 255);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;100000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 128, 255);"><strong>5<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 128, 255);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;1500000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 128, 255);"><strong>10<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 128, 255);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;12000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 128, 255);"><strong>12<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 128, 255);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &lt;142000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 128, 255);"><strong>15<br></strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 128, 255);"><strong>Deposite From&nbsp;&nbsp;&nbsp;&nbsp; &gt;2000000000/-</strong></td><td valign="top" align="center" style="background-color: rgb(255, 128, 255);"><strong>20<br></strong></td></tr>

</tbody>

<tr><td valign="top"><br></td><td valign="top"><br></td></tr><tr><td valign="top"><br></td><td valign="top"><br></td></tr><tr>
<td style="background-color: rgb(255, 196, 225);">&nbsp;<font size="3" face="Arial" color="#0080ff"><strong>Loan&nbsp; borrow&nbsp; Rules</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></td>
<td style="background-color: rgb(255, 196, 225);"><font color="#8000ff"><strong>&nbsp;Interest(%)</strong></font></td>
</tr>

<tr>
<td style="background-color: rgb(128, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff0080"><strong> For Time &lt; 1 year</strong></font><br></td>
<td>&nbsp;</td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 255);"><br></td><td valign="top"><br></td></tr><tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 10000<br></strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;2</strong></td></tr>
<tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 100000</strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;5</strong></td></tr>
<tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 150000 <br></strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;7</strong></td></tr>
<tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 200000 <br></strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;10</strong></td></tr>
<tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 500000</strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;12</strong></td></tr>
<tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 1000000</strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;15</strong></td></tr>
<tr>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &gt; 1000000</strong></td>
<td style="background-color: rgb(128, 255, 128);"><strong>&nbsp;20</strong></td></tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>
<tr>
<td style="background-color: rgb(128, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#ff0080"><strong>For Time &lt; 2year</strong></font></td>

<td><br></td></tr>
<tr><td valign="top" style="background-color: rgb(128, 255, 255);"><br></td><td valign="top"><br></td></tr><tr>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 5000</strong></td>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;2</strong></td></tr>
<tr><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 50000</strong></td><td valign="top" style="background-color: rgb(255, 255, 128);"><strong>&nbsp;5<br></strong></td></tr><tr>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 100000 <br></strong></td>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;7</strong></td></tr>
<tr>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 150000 <br></strong></td>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;10</strong></td></tr>
<tr>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 350000</strong></td>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;12</strong></td></tr>
<tr>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &lt; 7000000</strong></td>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;15</strong></td></tr>
<tr>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;Loan Borrow&nbsp;&nbsp;&nbsp;&nbsp; &gt; 7000000</strong></td>
<td style="background-color: rgb(255, 255, 128);"><strong>&nbsp;20</strong></td>
<td>&nbsp;</td></tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>
</table></body>
</html>
