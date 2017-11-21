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
    
    <title>My JSP 'demanddraft.jsp' starting page</title>
    
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
  <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br>
  <fieldset>
  <legend><font size="4" face="Comic Sans MS" color="#ff8000">Demand Draft Details..</font> </legend>
  <form action="http://localhost:8080/bank/servlet/s1?type=dd" method="post" onsubmit="return validate(this)">
  <table width="485" border="0" bgcolor="#80ffff" align="center" height="241">
<tbody><tr>
<td>&nbsp;<strong>In Favour Of :</strong><br></td>
<td>&nbsp;<input type="text" name="text1"></td></tr>
<tr>
<td>&nbsp;<strong>Payable At :</strong><br></td>
<td>&nbsp;<input type="text" name="text2"></td></tr>
<tr>
<td>&nbsp;<strong>Amount : </strong><br></td>
<td>&nbsp;<input type="text" name="text3"></td></tr>
<tr>
<td>&nbsp;<strong>Money Received by :</strong> </td>
<td>&nbsp;<select size="1" name="list1">
<option selected value="cash">Cash</option>
<option value="account">Check</option>
</select>
</td></tr>
<tr><td>&nbsp;<strong>Account No .(if selected) :</strong><br></td><td valign="top">&nbsp;<input type="text" name="accno"></td></tr><tr>
<td>&nbsp;<strong>Agent Name :</strong> <br></td>
<td>&nbsp;<input type="text" name="text4"></td></tr><tr><td valign="top"><br></td><td valign="top">&nbsp;<input type="submit" value="Create" name="button1"></td></tr>
</tbody></table></form></fieldset>
 <%} else { %>
  <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <% } %>
</body>
 <script type="text/javascript">
  function validate(v)
  {
  if(v.text1.value=="")
  {
  alert("First field can not be left blank");
  v.text1.focus();
  return false;
  }
  var str=v.text1.value;
  if(str.charAt(0)>="0" && str.charAt(0)<="9")
  {
  alert("First Character must be alphabet.");
  v.text1.value="";
  v.text1.focus();
  return false;
  }
  var i;
  for(i=0;i<str.length;i++)
  {
  if(!((str.charAt(i)>="a" && str.charAt(i)<="z") || (str.charAt(i)>="A" && str.charAt(i)<="Z")))
  {
  alert("Name should be in alphabetic only.");
  v.text1.value="";
  v.text1.focus();
  return false;
  }
  }
  if(v.text2.value=="")
  {
  alert("Second field can not be left blank");
  v.text2.focus();
  return false;
  }
  if(v.text3.value=="")
  {
  alert("Enter Amount");
  v.text3.focus();
  return false;
  }
  var str=v.text3.value;
  var i = str.indexOf(" ");
  if(i != -1)
  {
  alert("Spaces are not allowed in amount");
  v.text3.value="";
  v.text3.focus();
  return false;
  }
    for(i=0;i<str.length;i++)
    {
        if(!(str.charAt(i)>="0" && str.charAt(i)<="9"))
        {
            alert("Amount must be in digits only.");
            v.text3.value="";
            v.text3.focus();
            return false;
        }
    }   
  if(v.text4.value=="")
  {
  alert("Enter issuer's name");
  v.text4.focus();
  return false;
  }
  var str=v.text4.value;
  for(i=0;i<str.length;i++)
  {
  if(!((str.charAt(i)>="a" && str.charAt(i)<="z") || (str.charAt(i)>="A" && str.charAt(i)<="Z")))
  {
  alert("State must be in alphabetic only.");
  v.text4.value="";
  v.text4.focus();
  return false;
  }
  }
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
