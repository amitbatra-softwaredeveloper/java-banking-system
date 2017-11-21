<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="back_n_logout.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'transaction.jsp' starting page</title>
    
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
  <br><br>
  <fieldset>
  <legend><font color="#800080" size="4">Make A Transaction..</font></legend><br> 
    <form action="http://localhost:8080/bank/servlet/s1?type=t" method="post"  onsubmit="return validate(this)"><table width="544" align="center" border=0" height="186">
      <tr style="background-color: rgb(184, 184, 114);">
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;"><font color="#0080c0">Client Transaction</font><br></td>
      </tr>

      <tr style="background-color: rgb(184, 184, 114);">
        <td align="center" colspan=2>&nbsp;</td>
      </tr>

      <tr>
        <td style="background-color: rgb(184, 184, 114);"><font size="3"><strong>Account number</strong></font> : </td>
        <td style="background-color: rgb(184, 184, 114);">
          <input type="text" name="accno">
        <td>
      </tr>
	 <tr>
        <td style="background-color: rgb(184, 184, 114);"><font size="3"><strong>Amount</strong></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </td>
        <td style="background-color: rgb(184, 184, 114);">
          <input type="text" name="pin">
        <td>
      </tr>
      
      <tr>
        <td style="background-color: rgb(184, 184, 114);"><input type="submit" value="Deposit" name="b1"></td>
        <td style="background-color: rgb(184, 184, 114);">
        <input type="submit" value="Withdrawn" name="b1">
        <td> 
      <br></tr>

    </table>
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
