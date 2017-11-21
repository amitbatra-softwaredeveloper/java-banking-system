<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%> 
<%@ include file="back_n_logout.jsp" %>
 <html>
 <head></head>
 <body><br><br>
  <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
<form action="http://localhost:8080/bank/servlet/s1?type=fd&a=a" method="post" onsubmit="return validate(this)"> 
<fieldset><legend><strong><font size="4" color="#00d5d5">Loan Form Details</font></strong></legend>
<table width="478"  height="343" border="0" bgcolor="skyblue" align="center">
<tbody><tr>
<td>&nbsp;<strong>Account No</strong>:</td>
<td>&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td><strong>&nbsp;Time Period</strong> :</td>
<td>&nbsp;<select size="1" name="list1">
<option selected value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
</select><strong>Years</strong> &nbsp; &nbsp;<select size="1" name="list2">
<option selected value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
</select> 
<strong>Months</strong>  
</td></tr>
<tr>
<td>&nbsp;<strong>Money Required</strong> :</td>
<td>&nbsp;<input type="text" name="text1"></td></tr>
<tr>
<td>&nbsp;<strong>Interest Applied</strong> :</td>
<td>&nbsp;<select size="1" name="list3">
<option value="2">2%</option>
<option value="5">5%</option>
<option value="7">7%</option>
<option value="10">10%</option>
<option value="12">12%</option>
<option value="15">15%</option>
<option value="20">20%</option>
<option selected value="0">Unknown</option>
</select>
</td></tr>
<tr><td>&nbsp;<strong>Purpose</strong> : <br></td><td valign="top">&nbsp;
<select size="1" name="list4">
<option value="Home">Home Loan</option>
<option value="Car">Car Loan</option>
<option value="Business">Business Loan</option>
<option value="Education">Education Loan</option>
<option value="Medical">Medical Loan</option>
<option selected value="Others">Others</option>
</select>
</td></tr><tr>
<td>&nbsp;<strong>Witness Name</strong>: <br></td>
<td>&nbsp;<input type="text" name="text2"></td></tr>
<tr><td>&nbsp;<strong>Vitness Profession</strong>:<br></td><td>&nbsp;<input type="text" name="text6"></td></tr><tr><td>&nbsp;<strong>Security Submitted</strong> :<br></td><td>&nbsp;<input type="text" name="text4"></td></tr><tr><td>&nbsp;<strong>Security Value</strong> :<br></td><td>&nbsp;<input type="text" name="text5"></td></tr><tr>
<td>&nbsp;<strong>Agent Name</strong>:</td>
<td>&nbsp;<input type="text" name="text3"></td></tr>
<tr><td></td>
<td>&nbsp;<input type="submit" value="Done" name="button1"></td></tr>
</tbody></table></fieldset> </form>
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
  alert("Please enter amount!!");
  v.text1.focus();
  return false;
  }
  var stra = v.text1.value;
    for(i=0;i<stra.length;i++)
    {
        if(!(stra.charAt(i)>="0" && stra.charAt(i)<="9"))
        {
            alert("Amount should be in digits only.");
            v.text1.value="";
            v.text1.focus();
            return false;
        }
    }           
}
</script>
</html>