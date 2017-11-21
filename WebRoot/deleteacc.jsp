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
    
    <title>My JSP 'deleteacc.jsp' starting page</title>
    
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
  <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br>
<fieldset>
<legend><font size="4" face="Comic Sans MS" color="#8080ff">Delete Account</font></legend>
<form action="http://localhost:8080/bank/servlet/s1?type=deleteacc" method="post" onsubmit="return validate(this)">  
<table width="418" border="0" bgcolor="#c9c9c9" align="center" height="75">
<tbody><tr>
<td>&nbsp;<font color="#004000"><strong><font size="4">Account No :</font></strong></font><br></td>
<td>&nbsp;<input type="text" name="accno"></td></tr>
<tr><td>&nbsp;</td>
<td>&nbsp;<input type="submit" value="Delete" name="button1"></td>
</tr>
</tbody></table></form></fieldset>
 <%} else { %>
  <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <% } %>
</body>
 <script type="text/javascript">
  function validate(v)
  {
  if(v.accno.value=="")
  {
  alert("Account no. can not be left blank");
  v.accno.focus();
  return false;
  }var str = v.accno.value;
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
  return true;
  }
  </script>
</html>
