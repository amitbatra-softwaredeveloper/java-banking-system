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
  
  <body>
  <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
  <br><br><br>
  <fieldset>
  <legend><font color="#ec4d00" size="4" face="Comic Sans MS">Update client's profile</font></legend>
  <form action="http://localhost:8080/bank/servlet/s1?type=edit" method="post" onsubmit="return validate(this)"> 
  <table width="494" border="0" align="center" style="background-color: #ff8040;" height="112"><tr><td align="center" colspan="2" style="font-weight: bold; font-size: 20pt;" bgcolor="#ffb66c">
  <font face="Comic Sans MS" size="4">Edit Client's Account...</font><br></td><td bgcolor="#ff8040"><font size="4"><strong>Account Number </strong></font>: </td><td> 
          <input type="text" name="accno"> 
        <input type="submit" value="Search" name="search"></td></tr>
        </table>&nbsp;
        </form></fieldset>
        <% } else {%>
 <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <%} %>
  </body>
 <script type="text/javascript">
  function validate(v)
  {
  if(v.accno.value=="")
  {
  alert("Enter account no.");
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
