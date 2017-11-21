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
    
    <title>My JSP 'problem.jsp' starting page</title>
    
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
  <br><br><br>
  <fieldset>
  <legend><font size="4" face="Estrangelo Edessa" color="#8080ff">Submit Your Problem</font></legend>
  <form action="http://localhost:8080/bank/servlet/s1?type=problem" method="post" onsubmit="return validate(this)">
  <input type="hidden" name="accno" value="<%= request.getParameter("accno") %>">
  <textarea rows="5" cols="60" name="t1" style="background-color: rgb(255, 255, 0);"></textarea>
  <input type="submit" value="Submit"><input type="reset" value="Reset">
  </form>
 
  </fieldset>
 <% } else { %>
 <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <%} %>
  
</body>
 <script type="text/javascript">
  function validate(v)
  {
  if(v.t1.value=="")
  {
  alert("Problem can not be left blank");
  v.t1.focus();
  return false;
  }
  return true;
  }
  </script>
</html>
