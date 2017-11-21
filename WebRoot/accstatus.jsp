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
    
    <title>My JSP 'accstatus.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br><br><br>
  <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
  <form action="http://localhost:8080/bank/servlet/s1?type=clook" method="post" onsubmit="return validate(this)"> 
  <table width="555" border="0" align="center" style="background-color: lightgreen;" height="112"><tr><td align="center" colspan="2" style="font-weight: bold; font-size: 20pt; background-color: rgb(121, 121, 255);">
  <font face="Comic Sans MS" size="4">Client Account<br>Status</font><br></td><td style="background-color: rgb(121, 121, 255);"><strong><font size="4">Account Number</font> </strong>: </td><td style="background-color: rgb(121, 121, 255);"> 
          <input type="text" name="accno"> 
        <input type="submit" value="Search"></td></tr>
        </table>&nbsp;
        </form>
          <% } else {%>
 <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <%} %>
  </body>
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
  
  return true;
  }
  </script>
</html>
