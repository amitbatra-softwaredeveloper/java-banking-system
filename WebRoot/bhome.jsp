<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="ISO-8859-1"%>
 <p><input type="image" src="../images/logout.jpg" onclick="javascript:location.replace('http://localhost:8080/bank/index.jsp');" align="right"></p>
 <br>
<jsp:useBean id="bb" class="aa.bbean" scope="request"></jsp:useBean>
<%@ taglib uri="/header.tld"  prefix="h"%>
 <html>
  <head>
  
    <title></title>
    
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
  <h:header></h:header>
<table align="center" bgcolor="#9900FF" border="0" cellpadding="1" 
        cellspacing="2" dir="ltr" frame="above" 
        style="padding: inherit; width: 91%; height: 46px; font-style: normal; color: #000000; font-weight: normal; font-family: Arial;">
        <tr style="font-family: 'Comic Sans MS'; color: #000000; font-weight: bold">
            <td class="style1" style="color: #000000; font-family: 'Comic Sans MS'"> 
                Branch Name</td>
            <td class="style2">
                State</td>
            <td class="style3">
                City</td>
            <td class="style4">
                Level</td>
            <td class="style5">
                S.no.</td>
        </tr>
        <tr>
            <td class="style1"><jsp:getProperty name="bb" property="bname" />
                &nbsp;</td>
            <td class="style2"><jsp:getProperty name="bb" property="bstate" />
                &nbsp;</td>
            <td class="style3"><jsp:getProperty name="bb" property="bcity" />
                &nbsp;</td>
            <td class="style4"><jsp:getProperty name="bb" property="blevel" />
                &nbsp;</td>
            <td class="style5"><jsp:getProperty name="bb" property="bsno" />
                &nbsp;</td>
        </tr>
    </table>
  </body>
</html>
