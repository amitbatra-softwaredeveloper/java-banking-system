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
    
    <title>My JSP 'createacc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
  <br> 
  <fieldset>
  <legend><font size="4" color="#8080c0"><strong>Enter Client's Information</strong></font></legend>
    <form action="http://localhost:8080/bank/servlet/s1?type=cr" method="post" onsubmit="return validate(this)">
    <table width="422" align="center" border=0 style="background-color: lightgreen;" height="422">
      <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;">Create Client Account<br></td>
      </tr>

      <tr>
        <td align="center" colspan=2><font size="4"><strong>*</strong></font>-<font color="#0000ff">Mandatory Fields</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></td>
      </tr>

      <tr>
        <td><strong>First Name</strong> :* </td>
        <td>
          <input type="text" name="text0">
        <td>
      </tr>
	 <tr>
        <td><strong>Last Name</strong> : </td>
        <td>
          <input type="text" name="text1">
        <td>
      </tr>
      
      <tr><td valign="top"><strong>Address</strong>&nbsp;&nbsp;&nbsp;&nbsp; :<br></td><td valign="top"><input type="text" name="text2"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>State&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<br></td><td valign="top"><input type="text" name="text3"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>City</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :<br></td><td valign="top"><input type="text" name="text4"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Age&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp; * &nbsp; :<br></td><td valign="top"><input type="text" name="text5"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Father's Name</strong> :<br></td><td valign="top"><input type="text" name="text6"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Occupation&nbsp;</strong> :<br></td><td valign="top"><input type="text" name="text7"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Initial Deposite</strong> :*<br></td><td valign="top"><input type="text" name="text8"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Phone No.</strong>&nbsp; : *<br></td><td valign="top"><input type="text" name="text9"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Form No. </strong>:*<br></td><td valign="top"><input type="text" name="text10"></td><td valign="top"><br></td></tr><tr><td valign="top"><strong>Identification by</strong> :*<br></td><td valign="top"><input type="text" name="text11"></td><td valign="top"><br></td></tr><tr>
        <td><input type="submit" value="Create"></td>
        <td>
        <input type="submit" value="Reset">
        <td>
      </tr>

    </table>
  </form></fieldset>
  <%} else { %>
  <% getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response); %>
  <% } %>
  </body>
   <script type="text/javascript">
  function validate(v)
  {
  
  if(v.text0.value=="")
  {
  alert("First name is mandatory");
  v.text0.focus();
  return false;
  }  
  var str=v.text0.value;
  if(str.charAt(0)>="0" && str.charAt(0)<="9")
  {
  alert("First Character must be alphabet.");
  v.text0.value="";
  v.text0.focus();
  return false;
  }
  var i;
  for(i=0;i<str.length;i++)
  {
  if(!((str.charAt(i)>="a" && str.charAt(i)<="z") || (str.charAt(i)>="A" && str.charAt(i)<="Z")))
  {
  alert("First name should be in alphabetic only.");
  v.text0.value="";
  v.text0.focus();
  return false;
  }
  }

  if(v.text5.value=="")
  {
  alert("Please enter age!!");
  v.text5.focus();
  return false;
  }
  var strage = v.text5.value;
    for(i=0;i<strage.length;i++)
    {
        if(!(strage.charAt(i)>="0" && strage.charAt(i)<="9"))
        {
            alert("Age should be in digits only.");
            v.text5.value="";
            v.text5.focus();
            return false;
        }
    }     
     if(strage.charAt(0)=="0")
  {
  alert("Age must be greater than zero");
  v.text5.value="";
  v.text5.focus();
  return false;
  }
   if(!(strage.length =="1" || strage.length =="2"))
  {
  alert("Age must be in one or two digits.");
  v.text5.value="";
  v.text5.focus();
  return false;
  }
  if(v.text8.value=="")
  {
  alert("Enter Initial deposite");
  v.text8.focus();
  return false;
  }
  var str8=v.text8.value;
  if(str8.length < 4 || str8.length > 9)
    {
        alert("Minimum Initial deposite must be 1000");
		v.text8.value="";
        v.text8.focus();
        return false;
    }
     for(i=0;i<str8.length;i++)
  {
  if(((str8.charAt(i)>="a" && str8.charAt(i)<="z") || (str8.charAt(i)>="A" && str8.charAt(i)<="Z")))
  {
  alert("Initial must be in numeric only.");
  v.text8.value="";
  v.text8.focus();
  return false;
  }
  } 
        
  if(v.text9.value=="")
  {
  alert("Enter phone no.");
  v.text9.focus();
  return false;
  }
  var strPhone = v.text9.value;
    for(i=0;i<strPhone.length;i++)
    {
        if(!(strPhone.charAt(i)>="0" && strPhone.charAt(i)<="9"))
        {
            alert("Phone number should be in digits only.");
            v.text9.value="";
            v.text9.focus();
            return false;
        }
    }         
      if(strPhone.length < 10 || strPhone.length > 16)
    {
         alert("Phone number should be between 10 to 16 digits.");
         v.text9.value="";
         v.text9.focus();
         return false;
    }
 
  if(v.text10.value=="")
  {
  alert("Enter form no.");
  v.text10.focus();
  return false;
  }
  var stra=v.text10.value;  
  var i = stra.indexOf(" ");
  if(i != -1)
  {
  alert("Spaces are not allowed in form no.");
  v.text10.value="";
  v.text10.focus();
  return false;
  }
  
    for(i=0;i<stra.length;i++)
    {
        if(!(stra.charAt(i)>="0" && stra.charAt(i)<="9"))
        {
            alert("Form no should be in digits only.");
            v.text10.value="";
            v.text10.focus();
            return false;
        }
    }
 
  if(v.text11.value=="")
  {
  alert("Enter issuer's identification");
  v.text11.focus();
  return false;
  }
  var str11=v.text11.value;
  for(i=0;i<str11.length;i++)
  {
  if(!((str11.charAt(i)>="a" && str11.charAt(i)<="z") || (str11.charAt(i)>="A" && str11.charAt(i)<="Z")))
  {
  alert("Identification must be in alphabetic only.");
  v.text11.value="";
  v.text11.focus();
  return false;
  }
  }
  }
  </script>
</html>
