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
    
    <title>My JSP 'cdeposite.jsp' starting page</title>
    
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
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
  <form action="http://localhost:8080/bank/servlet/s1?type=transfer" method="post" onsubmit="return validate(this)">
  <fieldset>
  <legend><font size="4" color="#400040">Transfer Money</font></legend> 
  <input type="hidden" value="<%= request.getParameter("accno") %>" name="accno">
  <input type="hidden" value="<%= request.getAttribute("s") %>" name="money">
  <table width="453" border="0" bgcolor="#ffff00" align="center" height="74">
<tbody><tr>
<td>&nbsp;<strong>Enter Account No</strong> .:</td>
<td><input type="text" name="accno1"> <br></td></tr>
<tr>
<td>&nbsp;<strong>Enter Amount (in Rs.) </strong>:<br></td>
<td><input type="text" name="money1"></td></tr><tr><td valign="top" rowspan="2"><br></td><td valign="top"><input type="submit" value="Transfer" name="button1"></td></tr>
</tbody></table></fieldset></form>
  </body>
  <script type="text/javascript">
  function validate(v)
  {
  if(v.accno1.value=="")
  {
  alert("Account no. can not be left blank");
  v.accno1.focus();
  return false;
  }
  if(v.money1.value=="")
  {
  alert("Enter some money please");
  v.money1.focus();
  return false;
  }
  var str = v.accno1.value;
        for(i=0;i<str.length;i++)
        {
            if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
            {
                alert("Account number should be in digits only.");
                v.accno1.value="";
                v.accno1.focus();
                return false;
            }
        }
        var str = v.money1.value;
        for(i=0;i<str.length;i++)
        {
            if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
            {
                alert("Money should be in digits only.");
                v.money1.value="";
                v.money1.focus();
                return false;
            }
        }
  
  return true;
  }
  </script>
</html>
