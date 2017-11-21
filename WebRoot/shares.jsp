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
    
    <title>My JSP 'funds.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>&nbsp;
  
  <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
  <br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br>
<fieldset>&nbsp; 
<legend><font size="4" face="Comic Sans MS" color="#004080">Shares Purchase Form...</font></legend>
<form action="http://localhost:8080/bank/servlet/s1?type=shares" method="post" onsubmit="return validate(this)">
 <table width="529" border="1" bgcolor="#c5cd1d" align="center" height="168" bordercolor="green">
<tbody><tr>
<td style="background-color: rgb(212, 212, 212);">&nbsp;<strong>Enter Account No .:</strong><br></td>
<td style="background-color: rgb(212, 212, 212);">&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td style="background-color: rgb(212, 212, 212);">&nbsp;<strong>No. of Shares :</strong><br></td>
<td style="background-color: rgb(212, 212, 212);">&nbsp;<input type="text" name="text1"></td></tr>
<tr>
<td style="background-color: rgb(212, 212, 212);">&nbsp;<strong>Price of each Share :</strong><br></td>
<td style="background-color: rgb(212, 212, 212);">&nbsp;<input type="text" name="text2" value="<%= request.getAttribute("p") %>" readonly="readonly"></td></tr>
<tr><td style="background-color: rgb(212, 212, 212);">&nbsp;<br></td><td style="background-color: rgb(212, 212, 212);">&nbsp;<input type="submit" value="Purchase" name="button1"></td></tr>
</tbody></table></form></fieldset>
<% } else { %>
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
        if(v.text1.value=="")
  {
  alert("Please enter no of shares");
  v.text1.focus();
  return false;
  }  
  var str1 = v.text1.value;
    for(i=0;i<str1.length;i++)
    {
        if(!(str1.charAt(i)>="0" && str1.charAt(i)<="9"))
        {
            alert("Shares should be in digits only.");
            v.text1.value="";
            v.text1.focus();
            return false;
        }
    }  
  
  return true;
  }
  </script>
</html>
