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
    
    <title>My JSP 'collectfd.jsp' starting page</title>
    
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
  <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br>
 <fieldset>
 <legend><font size="4" face="Comic Sans MS" color="#0080c0">Collect Fixed Deposite Form</font></legend>
 <form action="http://localhost:8080/bank/servlet/s1?type=collectfd" method="post" onsubmit="return validate(this)">
  <table width="524" border="0" bgcolor="#ff5555" align="center" height="219">
<tbody><tr>
<td>&nbsp;<strong>Account No :</strong><br></td>
<td>&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td>&nbsp;<strong>Received by :</strong><br></td>
<td>&nbsp;<select size="1" name="list1">
<option selected value="itself">Itself</option>
<option value="nominee">Nominee</option>
</select>
</td></tr>
<tr>
<td>&nbsp;<strong>Amount Deposited :</strong><br></td>
<td>&nbsp;<input type="text" name="text2"></td></tr>
<tr>
<td>&nbsp;<strong>Date of Maturity -(D/M/Y):</strong><br></td>
<td>&nbsp;<input type="text" size="2" name="text3" maxlength="2">&nbsp;<input type="text" size="2" maxlength="2" name="text4">&nbsp;<input type="text" size="4" name="text5" maxlength="4"></td></tr>
<tr>
<td>&nbsp;<strong>Received On :</strong><br></td>
<td>&nbsp;<select size="1" name="list2">
<option selected value="on">On/After Date</option>
<option value="before">Before Date</option>
</select>
</td></tr><tr><td></td><td valign="top">&nbsp;<strong><input type="submit" value="Collect" name="button1"></strong></td></tr>
</tbody></table></form></fieldset>
  </body>
   <%} else { %>
  <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <% } %>
  <script type="text/javascript">
  function validate(v)
  {
  if(v.accno.value=="")
  {
  alert("Account no. can not be left blank");
  v.accno.focus();
  return false;
  }
  var str = v.accno.value;
        for(i=0;i<str.length;i++)
        {
            if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
            {
                alert("Account number should be in digits only.");
                v.accno.value="";
                v.accno.focus();
                return false;
            }
        }
  if(v.text2.value=="")
  {
  alert("Enter Valid Ammount");
  v.text2.focus();
  return false;
  }
  var str = v.text2.value;
        for(i=0;i<str.length;i++)
        {
            if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
            {
                alert("Amount should be in digits only.");
                v.text2.value="";
                v.text2.focus();
                return false;
            }
        }
  if(v.text3.value=="")
  {
  alert("Enter date");
  v.text3.focus();
  return false;
  }
  var str = v.text3.value;
        for(i=0;i<str.length;i++)
        {
            if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
            {
                alert("Date should be in digits only.");
                v.text3.value="";
                v.text3.focus();
                return false;
            }
        }
  if(v.text4.value=="")
  {
  alert("Enter Month");
  v.text4.focus();
  return false;
  }  
  if(v.text5.value=="")
  {
  alert("Enter year");
  v.text5.focus();
  return false;
  }
  var str = v.text5.value;
        for(i=0;i<str.length;i++)
        {
            if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
            {
                alert("Year should be in digits only.");
                v.text5.value="";
                v.text5.focus();
                return false;
            }
        }
        return true;
  }
  </script>
</html>
