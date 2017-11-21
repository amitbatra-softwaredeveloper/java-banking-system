<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>

<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="475" id="AutoNumber1" height="565">
    <tr bgcolor="orange">
      <td width="493" height="97" colspan="6">
      <img border="0" src="./images/sbilogo.jpg" width="750" height="110"></td>
    </tr>
    <tr>
      <td width="207" height="31">&nbsp;</td>
      <td width="212" height="31">&nbsp;</td>
      <td width="98" height="31">
      <form action="" method="post">
      <input type="image" src="./images/home1.jpg" width="100" height="33"></form></td>
      <td width="98" height="31" align="center" valign="bottom">
      <form action="http://localhost:8080/bank/servlet/s1?type=updates" method="post">
      <input type="image" src="./images/updates.jpg" width="100" height="33"></form></td>
      <td width="98" height="31">
      <form action="terms.jsp">
      <input type="image" src="./images/services.jpg" width="100" height="33"></form></td>
      <td width="99" height="31">
      <form action="contact.jsp" method="post">
      <input type="image" src="./images/help2.jpg" width="100" height="33"></form></td>
    </tr>
    <tr>
      <td width="175" height="121">
      <img border="0" src="./images/pic2.jpg" width="217" height="199"></td>
      <td width="337" height="408" colspan="5" rowspan="3">
      &nbsp;<b><font face="cursive" size="6" color="#FF00FF"> </font>
      <font face="cursive" color="#FF00FF" size="5"><marquee>......For 24*7 Hours.....</marquee>
      </font></b>&nbsp;<img src="./images/dialog.jpg" width="423" height="50"/><br>
       <form action="http://localhost:8080/bank/servlet/s1?type=c" method="post" onsubmit="return validate(this)"> 
    <fieldset><legend style="background-color: rgb(255, 255, 255);"><strong><font size="4">For Client Use</font></strong></legend>
    <table width="417" align="center" border=0 style="background-color: rgb(255, 238, 255);" height="155">
      <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;" width="466">Client's Details</td>
		    
      </tr>

      <tr>
        <td align="center" colspan=2 width="466">&nbsp;</td>
        <td width="13"></td>
      </tr>

      <tr>
        <td width="217"><font size="4">Account Number</font> : </td>
        <td width="245">
          <input type="text" name="accno" size="20">
        <td width="13">
        <td width="2"></td>
      </tr>
	 <tr>
        <td width="217"><font size="4">Pin /Password&nbsp;</font>&nbsp;&nbsp; : </td>
        <td width="245">
          <input type="password" name="pin" size="20">
        <td width="13">
        <td width="2"></td>
      </tr>
      <tr>
        <td width="217"></td>
        <td width="245">
        <input type="submit" name="c" value="Submit" style="background-color: #FFEEFF"></td>
        <td width="13"></td>
      </tr>
      <tr>
        <td colspan="2" width="466">&nbsp;</td>
        <td width="13"></td>
      </tr>

    </table></fieldset>
  </form>
  <br>
  <form action="http://localhost:8080/bank/servlet/s1?type=b" method="post" onsubmit="return validate(this)">
     <fieldset><legend style="background-color: rgb(255, 255, 255);"><strong><font size="4">For Bank Use</font></strong></legend>
     <table width="417" align="center" border=0 style="background-color: rgb(255, 238, 255);" height="156">
      <tr>
        <td align="center" colspan=2 style="font-weight:bold;font-size:20pt;" width="466">Bank's Details</td>
      
      </tr>

      <tr>
        <td align="center" colspan=2 width="466">&nbsp;</td>
        <td width="13"></td> 
      </tr>

      <tr>
        <td width="210"><font size="4">Branch code</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </td>
        <td width="252">
          <input type="text" name="accno" size="20">
        <td width="13">
        <td width="2"></td>
      </tr>
	 <tr>
        <td width="210"><font size="4">Pin /Password</font>&nbsp;&nbsp;&nbsp; : </td>
        <td width="252">
          <input type="password" name="pin" size="20">
        <td width="13">
        <td width="2"></td>
      </tr>
      <tr>
        <td width="210"></td>
        <td width="252">
        <input type="submit" name="b" value="Submit" style="background-color: #FFEEFF"></td>
       <td width="13"></td>
      </tr>
      <tr>
        <td colspan="2" width="466">&nbsp;</td>
        <td width="13"></td>
      </tr>

    </table></fieldset>
  </form>
      </td>
    </tr>
    <tr>
      <td width="175" height="135">
      <img border="0" src="./images/OnlineBankingAA046836_002.jpg" width="217" height="176"></td>
    </tr>
    <tr>
      <td width="175" height="152">
      <img border="0" src="./images/pic1.JPG" width="215" height="190"></td>
    </tr>
    <tr>
      <td width="493" height="29" colspan="6">&nbsp;</td>
    </tr>
  </table>
  </center>
</div>

</body>
<script language="javascript">
function validate(v)
{
if(v.accno.value=="")
{
alert("Enter Account Number");
return false;
}
if(v.pin.value=="")
{
alert("Enter pin/password");
return false;
}
return true;
}
  </script>
</html>