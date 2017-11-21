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
<fieldset>
<legend><font size="4" face="Comic Sans MS" color="#004080">Bonds Purchase Form...</font></legend>
<form action="http://localhost:8080/bank/servlet/s1?type=funds&a=bonds" method="post" onsubmit="return validate(this)">
 <table width="529" border="1" bgcolor="#c5cd1d" align="center" height="228" bordercolor="blue">
<tbody><tr>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<strong>Enter Account No .:</strong><br></td>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<strong>Type of Bond :</strong><br></td>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<select size="1" name="list1">
<option selected value="---Select---">---Select---</option>
<option value="Mutual">Mutual Bond</option>
<option value="providential">Providential Bond</option>
<option value="equity">Equity Bond</option>
</select>
</td></tr>
<tr>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<strong>No. of Bonds :</strong><br></td>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<input type="text" name="text2"></td></tr>
<tr>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<strong>Price of each Bond :</strong><br></td>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<input type="text" name="text3" value="<%= request.getAttribute("p") %>" readonly="readonly"></td></tr>
<tr>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<strong>Interest (in %) :</strong><br></td>
<td style="background-color: rgb(231, 198, 67);">&nbsp;<select size="1" name="list2">
<option selected value="select">---Select---</option>
<option value="1">2%</option>
<option value="2">5%</option>
<option value="3">7%</option>
<option value="4">9%</option>
<option value="5">11%</option>
<option value="7">12%</option>
</select>
</td></tr><tr><td style="background-color: rgb(231, 198, 67);">&nbsp;<strong>Time Period :</strong><br></td><td valign="top" style="background-color: rgb(231, 198, 67);">&nbsp;<select size="1" name="list3">
<option selected value="select">---Select---</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select><strong> years</strong> 
</td></tr><tr><td style="background-color: rgb(231, 198, 67);">&nbsp;<br></td><td style="background-color: rgb(231, 198, 67);">&nbsp;<input type="submit" value="Purchase" name="button1"></td></tr>
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
 if(v.text2.value=="")
  {
  alert("Please enter no of bonds");
  v.text2.focus();
  return false;
  }  
  var str2 = v.text2.value;
    for(i=0;i<str2.length;i++)
    {
        if(!(str2.charAt(i)>="0" && str2.charAt(i)<="9"))
        {
            alert("Bonds should be in digits only.");
            v.text2.value="";
            v.text2.focus();
            return false;
        }
    }  
  
  return true;
  }
  </script>
</html>
