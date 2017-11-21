<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%> 
<%@ include file="back_n_logout.jsp" %>
 <html>
 <head></head>
 <body><br>
 <% if(request.getAttribute("an")!=null&&request.getAttribute("pn")!=null)
   {%>
<form action="http://localhost:8080/bank/servlet/s1?type=fd" method="post" onsubmit="return validate(this)"> 
<fieldset><legend><font size="4" color="#ff0080">Fixed Deposite Form</font></legend>
<table width="400"  height="300" border="0" bgcolor="#ff80c0" align="center">
<tbody><tr>
<td>&nbsp;<strong>Account No</strong>:</td>
<td>&nbsp;<input type="text" name="accno"></td></tr>
<tr>
<td>&nbsp;<strong>Time Period</strong> :</td>
<td>&nbsp;<select size="1" name="list1">
<option selected value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
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
<td>&nbsp;<strong>Money Deposited</strong> :</td>
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
<tr>
<td>&nbsp;<strong>Nominee Name</strong>: <br></td>
<td>&nbsp;<input type="text" name="text2"></td></tr>
<tr>
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
  if(v.text2.value=="")
  {
  alert("Nominee name is mandatory");
  v.text2.focus();
  return false;
  }
  var str=v.text2.value;
  if(str.charAt(0)>="0" && str.charAt(0)<="9")
  {
  alert("First Character must be alphabet.");
  v.text2.value="";
  v.text2.focus();
  return false;
  }
  var i;
  for(i=0;i<str.length;i++)
  {
  if(!((str.charAt(i)>="a" && str.charAt(i)<="z") || (str.charAt(i)>="A" && str.charAt(i)<="Z")))
  {
  alert("Nominee name should be in alphabetic only.");
  v.text2.value="";
  v.text2.focus();
  return false;
  }
  }
  if(v.text3.value=="")
  {
  alert("Agent name is mandatory");
  v.text3.focus();
  return false;
  }
  var str=v.text3.value;
  if(str.charAt(0)>="0" && str.charAt(0)<="9")
  {
  alert("First Character must be alphabet in Agent name");
  v.text3.value="";
  v.text3.focus();
  return false;
  }
  var i;
  for(i=0;i<str.length;i++)
  {
  if(!((str.charAt(i)>="a" && str.charAt(i)<="z") || (str.charAt(i)>="A" && str.charAt(i)<="Z")))
  {
  alert("Agent name should be in alphabetic only.");
  v.text3.value="";
  v.text3.focus();
  return false;
  }
  }
  
  return true;
  }
  </script>
</html>