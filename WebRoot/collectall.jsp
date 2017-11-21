<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<input type="image" src="../images/back.jpg" onclick="javascript:history.go(-1);" align="right"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'collectall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
  <fieldset>
  <legend><font size="4" face="Comic Sans MS" color="#ff0080">Collect Your Money</font></legend>
  <form action="http://localhost:8080/bank/servlet/s1?type=collectall" method="post" onsubmit="return validate(this)">
  <table width="437" border="1" bgcolor="#cb9898" align="center" height="117" bordercolor="blue">
<tbody><tr>
<td>&nbsp;<font size="4">Account No. :</font><br></td>
<td>&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td>&nbsp;<font size="4">Collect :</font><br></td>
<td>&nbsp;<select size="1" name="list1">
<option selected value="select">---Select---</option>
<option value="funds">Funds</option>
<option value="shares">Shares</option>
<option value="debentures">Debentures</option>
<option value="bonds">Bonds</option>
</select>
</td></tr>
<tr>
<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  
<input type="submit" value="Collect" name="button1"></td>
</tr>
</tbody></table></form></fieldset>
  </body>
  <script type="text/javascript">
  function validate(v)
  {
  if(v.accno.value=="")
  {
  alert("Account no./Name can not be left blank");
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
