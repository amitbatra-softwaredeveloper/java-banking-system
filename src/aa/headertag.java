package aa;


import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
public class headertag extends TagSupport
{
public int doStartTag() throws JspException
{	
	return SKIP_BODY;	
}
public int doEndTag() throws JspException
{
	try
	{
	pageContext.getOut().write("<marquee><h3>A Bank On Which You Can Bank Up On...</h3></marquee>");
	}
	catch(Exception e)
	{
		
	}
	return EVAL_PAGE;
}
}
