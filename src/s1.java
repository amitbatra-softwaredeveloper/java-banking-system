import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.sun.org.apache.bcel.internal.generic.GOTO;


public class s1 extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String accno=request.getParameter("accno");
		String pin=request.getParameter("pin");
		String type=request.getParameter("type");
		
		if(type.equals("b"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			aa.bbean bb=db.verifyAccount(accno,pin);
			if(bb.getbcity()!=null)
			{
			request.setAttribute("bb",bb);
			request.setAttribute("an",bb.getbcode());
			request.setAttribute("pn",bb.getbpin());
				if(request.getParameter("a")!=null)
				{			
				getServletConfig().getServletContext().getRequestDispatcher("/transaction.jsp").include(request,response);	
				}
				else if(request.getParameter("c")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/createacc.jsp").include(request,response);	
				}
				else if(request.getParameter("d")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/editacc.jsp").include(request,response);	
				}
				else if(request.getParameter("e")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/fd.jsp").include(request,response);	
				}
				else if(request.getParameter("f")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/loan.jsp").include(request,response);	
				}
				else if(request.getParameter("g")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/problem.jsp").include(request,response);	
				}
				else if(request.getParameter("h")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/accstatus.jsp").include(request,response);	
				}
				else if(request.getParameter("i")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/demanddraft.jsp").include(request,response);	
				}
				else if(request.getParameter("j")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/collectfd.jsp").include(request,response);	
				}
				else if(request.getParameter("k")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/returnloan.jsp").include(request,response);	
				}
				else if(request.getParameter("l")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/deleteacc.jsp").include(request,response);	
				}
				else if(request.getParameter("m")!=null)
				{
				int p=db.select_trade("funds");
				request.setAttribute("p",p);
				getServletConfig().getServletContext().getRequestDispatcher("/funds.jsp").include(request,response);	
				}
				else if(request.getParameter("n")!=null)
				{
				int p=db.select_trade("shares");
				request.setAttribute("p",p);
				getServletConfig().getServletContext().getRequestDispatcher("/shares.jsp").include(request,response);	
				}
				else if(request.getParameter("o")!=null)
				{
				int p=db.select_trade("bonds");
				request.setAttribute("p",p);
				getServletConfig().getServletContext().getRequestDispatcher("/bonds.jsp").include(request,response);	
				}
				else if(request.getParameter("p")!=null)
				{
				int p=db.select_trade("debentures");
				request.setAttribute("p",p);
				getServletConfig().getServletContext().getRequestDispatcher("/debentures.jsp").include(request,response);	
				}
				else if(request.getParameter("q")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/collectall.jsp").include(request,response);	
				}
				else
				{
				getServletConfig().getServletContext().getRequestDispatcher("/bcontent.jsp").include(request,response);
				}
			}
			else
			{
				out.println("<h3>Invalid Branch code or Pin Number..</h3>");
				getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response);
			}
		}
		else if(type.equals("cr"))
		{			
			dbbean db=new dbbean();
			db.createConnection();
			aa.cbean cb=new aa.cbean();
			cb.setfname(request.getParameter("text0"));
			cb.setlname(request.getParameter("text1"));
			cb.setadd(request.getParameter("text2"));
			cb.setstate(request.getParameter("text3"));
			cb.setcity(request.getParameter("text4"));
			cb.setage(Integer.parseInt(request.getParameter("text5")));
			cb.setfthname(request.getParameter("text6"));
			cb.setocc(request.getParameter("text7"));
			//collect other parameters later becoz two operations are handled together  
			cb.setpno(request.getParameter("text9"));
			
			if(request.getParameter("b")!=null)
			{
				int a=db.update_acc(accno, cb);
				if(a>0)
				{
					out.println("<body background=../images/pic4.jpg");
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-3)></p>");
					out.println("<h3>Account successfully updated..</h3>");
				}
			}
			else if(request.getParameter("b")==null)
			{
				int amt=Integer.parseInt(request.getParameter("text8"));
				cb.setinitdep(amt);
				String fno=request.getParameter("text10");
				cb.setissuer(request.getParameter("text11"));
				cb.setaccno("55255"+fno);
				cb.setpin("3"+fno.substring(2,4)+"1");
				int a=db.createAccount(cb);
				
				int c=db.create_backup_Account(cb);
				if(a>0&&c>0)
				{
					out.println("<body background=../images/pic4.jpg");
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");
					out.println("<h3>Account Successfully created</h3><br>");		
					int b=db.transaction(cb.getaccno(), amt, "D", amt);
					if(b>0)
					{
						out.println("<b>Your Account no. is :</b> "+cb.getaccno());
						out.println("<br><b>Your Pin no. is : </b>"+cb.getpin());
					}
				}
				else
				{
					out.println("<body background=../images/pic4.jpg");
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");
				out.println("Invalid account information<br>Try Again");
				//getServletConfig().getServletContext().getRequestDispatcher("/createacc.jsp").include(request,response);
				}
			}
			
		}
		else if(type.equals("t"))
		{
			String sts=request.getParameter("b1");
			int amt=Integer.parseInt(pin);
			dbbean db=new dbbean();
			db.createConnection();
			String s[][]=db.acc_status(accno);
			if(s.length==0)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3><font color=red>No Such Account Exist...</font></h3>");
			
			}
			else
			{
			int tamt=db.select_total_amt(accno);
			if(sts.equals("Deposit"))
			{								
				int ttamt=tamt+amt;
				int a=db.transaction(accno, amt,"D",ttamt);
				if(a>0)
				{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");
				out.println("<h3><font color=blue>Amount SUCCESSFULLY Deposited..</font>");
				tamt=db.select_total_amt(accno);
				out.println("<br>You have an total balance of Rs. "+tamt+"</h3>");
				}
				else
				{
					out.println("<h2>Sorry for inconvience!!</h2>");
				}
			}
			else if(sts.equals("Withdrawn"))
			{
				if((tamt<=1000)||(tamt-amt<1000))
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3><font color=green>SORRY!! You can not withdwaw this much amount from this account..</font></h3>");		
				}
				else
				{
					int ttamt=tamt-amt;
					int a=db.transaction(accno, amt,"W",ttamt);
					if(a>0)
					{
						out.println("<p align=right>");
						out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
						out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					    out.println("<h3><font color=blue>Amount WITHDRAWN successfully..</font>");
					    tamt=db.select_total_amt(accno);
						out.println("<br>You have an total balance of Rs. "+tamt+"</h3>");
					}
				}
			}
			}
		}
		else if(type.equals("clook"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String s[][]=db.acc_status(accno);
			int l=s.length;
			int i=0,j=0;
			if(request.getParameter("a")==null)
			{		
				if(l>0)
				{
					if(l>10)
					{
						j=l-10;
					}
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					//out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3>Your Last 10 transaction status is :</h3>");
					out.println("<table border=1 bgcolor=blueee>");
					out.println("<tr bgcolor=blue><td><b>Account No.</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><b>Amount</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><b>Status</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><b>Date/Time</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><b>Total Amount</b></td></tr>");
					for(i=j;i<s.length;i++)
					{
						out.println("<tr><td>"+s[i][0]+"</td><td>"+s[i][1]+"</td><td>"+s[i][2]+"</td><td>"+s[i][3]+"</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[i][4]+"</td></tr>");
					}
					out.println("</table>");
				}
				else
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3><font color=red>No Such Account Exist...</font></h3>");
				}
			}
			else if(request.getParameter("b")==null)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
				//out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<font color=red><b>Your Balance is : </b></font><b>"+s[s.length-1][4]+"</b>");
			}
			else
			{
				out.println("<font color=red><b>Your Balance is : </b></font><b>"+s[s.length-1][4]+"Rs.</b>");
				request.setAttribute("s",s[s.length-1][4]);
				getServletConfig().getServletContext().getRequestDispatcher("/cdeposite.jsp").include(request,response);
				
			}
		
		}
		else if(type.equals("edit"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			aa.cbean cb=db.edit_acc(accno);
			if(cb.getfname().equals(""))
			{
				out.println("<body background=../images/pic4.jpg");
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");
				out.println("<h3>No such account exist... </h3>");
			}
			else
			{
				request.setAttribute("cb",cb);
				getServletConfig().getServletContext().getRequestDispatcher("/editaccount.jsp").include(request,response);
				
			}
		}
		else if(type.equals("fd"))
		{
			aa.fd fd=new aa.fd();
			fd.setaccno(accno);
			int money=Integer.parseInt(request.getParameter("text1"));
			fd.setmoney(money);
			float time1=Float.parseFloat(request.getParameter("list1"));
			float time2=Float.parseFloat(request.getParameter("list2"));
			float ttime=time1+(time2/12);
			fd.settime(ttime);
			int interest=Integer.parseInt(request.getParameter("list3"));
			fd.setinterest(interest);
			fd.setagent(request.getParameter("text3"));
			float amt=(money*interest*ttime)/100;
			float tamt=money+amt;
			fd.settamt(tamt);
			String date1=new SimpleDateFormat("yy").format(new Date());
			String date2=new SimpleDateFormat("MM").format(new Date());
			String d=new SimpleDateFormat("dd").format(new Date());
			float y=Integer.parseInt(date1)+time1;
			float m=Integer.parseInt(date2)+time2;
				if(m>12)
				{
					m=m-12;
					y=y+1;
				}
			String y1=String.valueOf(y);
			String m1=String.valueOf(m);
			String doe=d+"/"+m1+"/"+y1;
			fd.setdoe(doe);	
			
			
			if(request.getParameter("a")!=null)
			{
				fd.setpurpose(request.getParameter("list4"));
				fd.setvname(request.getParameter("text2"));
				fd.setvproff(request.getParameter("text6"));
				fd.setssub(request.getParameter("text4"));
				fd.setsvalue(request.getParameter("text5"));
				dbbean db=new dbbean();
				db.createConnection();
				int a=db.issue_loan(fd);
				if(a>0)
				{
					out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
					out.println("<h2><b>Loan is successfully issued....</b></h2>");
					out.println("<h3>Money Returned : "+fd.gettamt()+"<br>");
					out.println("On Date : "+fd.getdoe()+"</h3>");
				}
			}
			else
			{
			fd.setnominee(request.getParameter("text2"));	
			dbbean db=new dbbean();
			db.createConnection();
			int a=db.create_fixed_deposite(fd);
				if(a>0)
				{
					out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
					out.println("<h2><b>Fixed Deposite is sucessfully created</b></h2><br>");
					out.println("<h3>Money Returned : "+fd.gettamt()+"<br>");
					out.println("On Date : "+fd.getdoe()+"</h3>");
					
				}
			
			}
		}
		else if(type.equals("problem"))
		{
			String prob=request.getParameter("t1");
			String date=new SimpleDateFormat("dd:MM:yy").format(new Date());
			dbbean db=new dbbean();
			db.createConnection();
			int a=db.problem(accno, prob, date);
			if(a>0)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3><font color=blue>problem is successfully sent out..<br>" +
						"You will get response with in <b>24 hours</font></h3>");
			}
			
		}
		else if(type.equals("response"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String s[][]=db.response(accno);
			if(s.length>0)
			{
				aa.bbean bb=new aa.bbean();
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
				//out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				for(int i=0;i<s.length;i++)
				{
					bb.setbname(s[i][0]);
					bb.setbpin(accno);
					request.setAttribute("bb",bb);
					out.println("<hr><h3><b>Question : </b>"+s[i][0]+"<br><b>Answer : </b>"+s[i][1]+"<br></h3>");
					getServletConfig().getServletContext().getRequestDispatcher("/deletequestion.jsp").include(request,response);	
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
				//out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3>You still have no Problem/Query...</h3>");
			}
		}
		else if(type.equals("delete"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String ques=request.getParameter("ques");
			db.delete_question(accno, ques);
			String s[][]=db.response(accno);
			aa.bbean bb=new aa.bbean();
			out.println("<p align=right>");
			//out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
			out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
			for(int i=0;i<s.length;i++)
			{
			bb.setbname(s[i][0]);
			bb.setbpin(accno);
			request.setAttribute("bb",bb);
			out.println("<hr><h3><b>Question : </b>"+s[i][0]+"<br><b>Answer : </b>"+s[i][1]+"<br></h3>");
			getServletConfig().getServletContext().getRequestDispatcher("/deletequestion.jsp").include(request,response);	
			}
			
		}
		
		
		
		else if(type.equals("search"))
		{
			String searchby=request.getParameter("list1");
			dbbean db=new dbbean();
			db.createConnection();
			if(searchby.equals("accno"))
			{
				aa.cbean cb=db.edit_acc(accno);
				if(cb.getfname().equals(""))
				{
					out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
					out.println("<h3><font color=red>No such ACCOUNT exist...</font></h3>");
				}
				else
				{
					out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
					out.println("<hr><h2><font color=red><u>Client's Personal Details</u></font></h2>");	
					out.println("<table border=0>");	
					out.println("<tr><td><b>Account No. :</b></td><td><b>"+accno+"</b></td></tr>");			
					out.println("<tr><td><b>Name  :</b></td><td><b>"+cb.getfname()+" "+cb.getlname()+"</b></td></tr>");
					out.println("<tr><td>Address :</td><td> "+cb.getadd()+"</td></tr>");
					out.println("<tr><td>State   :</td><td> "+cb.getstate()+"</td></tr>");
					out.println("<tr><td>City  :</td><td> "+cb.getcity()+"</td></tr>");
					out.println("<tr><td>Age  :</td><td><b>"+cb.getage()+"</b></td></tr>");			
					out.println("<tr><td>Father's Name   :</td><td> "+cb.getfthname()+"</td></tr>");
					out.println("<tr><td>Occupation :</td><td> "+cb.getocc()+"</td></tr>");
					out.println("<tr><td><b>Phone No. :</b></td><td><b>"+cb.getpno()+"</b></td></tr>");			
					out.println("<tr><td><b>Balance :</b></td><td><b>"+db.select_total_amt(accno)+"</b></td></tr>");			
					out.println("</table><br><hr><br>");
					
					String s[][]=db.fdstatus(accno);
					if(s.length>0)
					{
					out.println("<hr><h2><font color=blue><u>Client's Fixed Deposite Details</u></font></h2>");	
					for(int i=0;i<s.length;i++)
					{			
						out.println("<table border=0>");			
						out.println("<tr><td><b>Fixed Deposite  :</b></td><td> "+(i+1)+"</td></tr>");
						out.println("<tr><td>Amount Deposited	:</td><td><b>"+s[i][0]+"</b></td></tr>");
						out.println("<tr><td>Interest Applied (in %) :</td><td> "+s[i][1]+"</td></tr>");
						out.println("<tr><td>Nominee         :</td><td> "+s[i][2]+"</td></tr>");
						out.println("<tr><td>Maturity Date   :</td><td> "+s[i][3]+"</td></tr>");
						out.println("<tr><td>Total Amount on Maturity   :</td><td><b>"+s[i][4]+"</b></td></tr>");			
						out.println("</table><br><hr><br>");
						
					}}
					
					String s1[][]=db.loanstatus(accno);
					if(s1.length>0)
					{
					out.println("<hr><h2><font color=green><u>Client's Loan Details</u></font></h2>");	
					for(int i=0;i<s1.length;i++)
					{			
						out.println("<table border=0>");			
						out.println("<tr><td><b>Loan No.  :</b></td><td> "+(i+1)+"</td></tr>");
						out.println("<tr><td>Amount Borrowed :</td><td><b>"+s1[i][0]+"</b></td></tr>");
						out.println("<tr><td>Interest Applied (in %) :</td><td> "+s1[i][1]+"</td></tr>");
						out.println("<tr><td>Purpose of Loan   :</td><td> "+s1[i][2]+"</td></tr>");
						out.println("<tr><td>Vitness Name   :</td><td> "+s1[i][3]+"</td></tr>");
						out.println("<tr><td>Security Submitted  :</td><td> "+s1[i][4]+"</td></tr>");
						out.println("<tr><td>Security/Mortgage Value  :</td><td> "+s1[i][5]+"</td></tr>");
						out.println("<tr><td>Maturity Date   :</td><td> "+s1[i][6]+"</td></tr>");
						out.println("<tr><td>Total Amount Redeemable   :</td><td><b>"+s1[i][7]+"</b></td></tr>");			
						out.println("</table><br><hr><br>");						
					}
					}
					int nsh=db.no_of_shares(accno);
					if(nsh==0)
					{
						out.println("<h2>You have No money investment in Shares..</h2>");
					}
					else
					{
						out.println("<hr><h2><font color=orange><u>Client's Share(s) Details</u></font></h2>");
						out.println("<h3>No. of Shares You have : "+nsh+"</h3><hr>");
						
					}
					
					int nof=db.no_of_funds(accno);
					if(nof==0)
					{
						out.println("<h2>You have No money investment in funds..</h2>");
					}
					else
					{
						out.println("<hr><h2><font color=orange><u>Client's Fund(s) Details</u></font></h2>");
						out.println("<h3>No. of Funds You have : "+nof+"</h3><hr>");
						
					}
					
					int nod=db.no_of_debentures(accno);
					if(nod==0)
					{
						out.println("<h2>You have No money investment in Debentures..</h2>");
					}
					else
					{
						out.println("<hr><h2><font color=orange><u>Client's Debenture(s) Details</u></font></h2>");
						out.println("<h3>No. of Debentures You have : "+nod+"</h3><hr>");
						
					}
					
					int nob=db.no_of_bonds(accno);
					if(nob==0)
					{
						out.println("<h2>You have No money investment in Bonds..</h2>");
					}
					else
					{
						out.println("<hr><h2><font color=orange><u>Client's Bond(s) Details</u></font></h2>");
						out.println("<h3>No. of Bonds You have : "+nob+"</h3><hr>");
						
					}
				}
			}
			else
			{
				String s[][]=db.search_by_name(accno);
				if(s.length>0)
				{
					for(int i=0;i<s.length;i++)
					{
						out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
						out.println("<b>Name : </b>"+s[i][0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						out.println("<b>Accno : </b>"+s[i][1]+"<br>");
					}
				}
				else
				{
					out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
					out.println("No Such Name Exist..");
				}
			}
		}
		else if(type.equals("dd"))
		{
			String favour=request.getParameter("text1");
			String payable=request.getParameter("text2");
			String amount=request.getParameter("text3");
			int amt=Integer.parseInt(amount);
			String agent=request.getParameter("text4");
			String date=new SimpleDateFormat("dd:MM:yy").format(new Date());
			dbbean db=new dbbean();
			db.createConnection();
			
			if(accno!="")
			{
				int a=db.select_total_amt(accno);
				if(a>=1000+amt)
				{
					int b=db.transaction(accno, amt, "W", (a-amt));
					if(b>0)
					{
						int c=db.demand_draft(accno, favour, payable, amt,date);
						if(c>0)
						{
							out.println("<p align=right>");
							out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
							out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
							out.println("<hr>");
							out.println("<b>In Favour of : </b>"+favour);
							out.println("<br><b>Payable At : </b>"+payable);
							out.println("<br><b>Amount : </b>"+amt);
							out.println("<br><b>Issued on : </b>"+date+"<br><br><br>");
							out.println("<b>"+agent+"'s Signature</b><hr>");
							out.println("<br>* This draft is only valid for 6 months from the date of issue.. <hr>");					
						}
						else
						{
							out.println("Sorry for inconvienence");
						}
					}
					else
					{
						out.println("Sorry for inconvienence");
					}
				}
				else
				{
					out.println("No Such Money Present");
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<hr>");
				out.println("<h3>In Favour of : "+favour+"</h3>");
				out.println("<h3>Payable At : "+payable+"</h3>");
				out.println("<h3>Amount : "+amt+"</h3>");
				out.println("<h3>Issued on : "+date+"</h3><br><br>");
				out.println("<h4>"+agent+"'s Signature</h4><hr>");
				out.println("<br>* This draft is only valid for 6 months from the date of issue.. <hr>");					
			}
		}
		else if(type.equals("collectfd"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String amt=request.getParameter("text2");
			String d=request.getParameter("text3");
			if(d.length()==1)
			{
				d="0"+d;
			}
			String m=request.getParameter("text4");
			String y=request.getParameter("text5");
			String date=d+"/"+m+".0/"+y.substring(2,4)+".0";
			String received=request.getParameter("list2");
			String a="",b="";
			String s[][]=db.fdstatus(accno);
			int count=0;
			for(int i=0;i<s.length;i++)
			{
				if(s[i][0].equals(amt)&&s[i][3].equals(date))
				{
					count=1;
					b=s[i][1];
					a=s[i][4];
				}
			}
			if(count==0)
			{
				out.println("<input type=image src=../images/back.jpg align=right onclick=javascript:history.go(-1)>");
				out.println("No Such FD Exist On Your Account!!");
			}
			else
			{
			if(received.equals("before"))
			{
				int si=Integer.parseInt(a)-Integer.parseInt(amt);
				int intst=Integer.parseInt(b);
				int ext=(si*intst)/100;
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<b>Collect </b><font color=red><b>"+(Integer.parseInt(amt)+ext)+"</font></b><b> Rs./-</b>");
				
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<b>Collect </b><font color=green><b>"+a+"</font></b><b> Rs./-</b>");
			}
			db.delete_fd(accno,Integer.parseInt(amt), date);	
			}
		}
		
		else if(type.equals("returnloan"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String amt=request.getParameter("text1");
			String d=request.getParameter("text2");
			if(d.length()==1)
			{
				d="0"+d;
			}
			String m=request.getParameter("text3");
			String y=request.getParameter("text4");
			String date=d+"/"+m+".0/"+y.substring(2,4)+".0";
			String received=request.getParameter("list2");
			String s[][]=db.loanstatus(accno);
			String a="",b="";
			for(int i=0;i<s.length;i++)
			{
				if(s[i][0].equals(amt)&&s[i][6].equals(date))
				{
					a=s[i][7];
					b=s[i][1];
				}
			}
			if(received.equals("before"))
			{
				int si=Integer.parseInt(a)-Integer.parseInt(amt);
				int intst=Integer.parseInt(b);
				int ext=(si*intst)/100;
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<b>Return </b><font color=blue><b>"+(Integer.parseInt(a)-ext)+"</font></b><b> Rs./-</b>");
			}
			else if(received.equals("after"))
			{
				int si=Integer.parseInt(a)-Integer.parseInt(amt);
				int intst=Integer.parseInt(b);
				int ext=(si*intst)/100;
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<b>Return </b><font color=red><b>"+(Integer.parseInt(a)+ext)+"</font></b><b> Rs./-</b>");
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<b>Return </b><font color=green><b>"+Integer.parseInt(a)+"</font></b><b> Rs./-</b>");
			}
			db.delete_loan(accno,Integer.parseInt(amt), date);
			
		}
		else if(type.equals("deleteacc"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String s[][]=db.loanstatus(accno);
			String s1[][]=db.fdstatus(accno);
			if(s.length>0||s1.length>0)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3><font color=red><b>Account can not be deleted until loan(s) or fixed Deposite(s) are left...</b></font></h3><br>");
			}	
			else
			{
				int amt=db.select_total_amt(accno);
				if(amt!=0)
				{
				int tamt=amt-1000;
				db.delete_client1(accno);
				db.delete_client2(accno);
				db.delete_client3(accno);		
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("Your Account is successfully deleted<br>");
				out.println("Please collect "+tamt+" Rs./-");	
				}
				else
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<b>No such account exist</b>");
				}
			}
		}
		else if(type.equals("funds"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String ftype=request.getParameter("list1");
			String fno=request.getParameter("text2");
			int nof=Integer.parseInt(fno);
			String fprice=request.getParameter("text3");
			int pricef=Integer.parseInt(fprice);
			String fint=request.getParameter("list2");
			int intf=Integer.parseInt(fint);
			String ftime=request.getParameter("list3");
			int timef=Integer.parseInt(ftime);		
			int amt=nof*pricef;
			int tamt=db.select_total_amt(accno);
			
			if(tamt>=amt+1000)
			{
				db.transaction(accno, amt,"W",(tamt-amt));
				String date1=new SimpleDateFormat("yy").format(new Date());
				String date2=new SimpleDateFormat("MM").format(new Date());
				int ydate=Integer.parseInt(date1)+timef;
				String date=date2+"/"+String.valueOf(ydate);
				int ttamt=amt+(amt*timef*intf)/100;
				if(request.getParameter("a").equals("bonds"))
				{
					db.create_bonds(accno, ftype, nof, pricef, amt, intf, timef, date, ttamt);
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3>BONDS Successfully Purchased...</h3>");
				}
				else if(request.getParameter("a").equals("debentures"))
				{
					db.create_debentures(accno,nof, pricef, amt, intf, timef, date, ttamt);
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3>DEBENTURES Successfully Purchased...</h3>");
				}
				else
				{
					db.create_funds(accno, ftype, nof, pricef, amt, intf, timef, date, ttamt);
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3>FUNDS Successfully Purchased...</h3>");
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3>Sorry you can not purchase these much FUNDS/BONDS/DEBENTURES..");
				out.println("<br>Your BALANCE is not much enough</h3> ");
			}
		}
		else if(type.equals("shares"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String shn=request.getParameter("text1");
			int nsh=Integer.parseInt(shn);
			String shp=request.getParameter("text2");
			int psh=Integer.parseInt(shp);
			int amt=nsh*psh;
			int tamt=db.select_total_amt(accno);
			if(tamt>=amt+1000)
			{
				db.transaction(accno, amt,"W",(tamt-amt));
				db.create_shares(accno, nsh, psh,amt);
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3>SHARES purchased Successfully..</h3>");
				
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3>Sorry you can not purchase these much SHARES..");
				out.println("<br>Your BALANCE is not much enough</h3> ");
			}
			
		}
		else if(type.equals("collectall"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String collect=request.getParameter("list1");		
			if(collect.equals("funds"))
			{
				String s[][]=db.funds_details(accno);
				if(s.length>0)
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
					aa.cbean cb=new aa.cbean();
					for(int i=0;i<s.length;i++)
					{
						cb.setaccno(accno);
						cb.setadd(s[i][0]); //funds type..
						cb.setage(Integer.parseInt(s[i][1])); //no of funds..
						cb.setcity(s[i][4]); //funds date..
						request.setAttribute("cb",cb);
						
						out.println("<hr>");
						out.println("<h3>Funds Type : "+s[i][0]+"<br>");
						out.println("No of Funds  : "+s[i][1]+"<br>");
						out.println("Price/Fund : "+s[i][2]+"<br>");
						out.println("Amount invested : "+s[i][3]+"<br>");
						out.println("Date of maturiy : "+s[i][4]+"<br>");
						out.println("Total Amount(on maturity) : "+s[i][5]+"</h3><br><br>");
						
						getServletConfig().getServletContext().getRequestDispatcher("/deletefunds.jsp").include(request,response);	
					}
				}
				else
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
					out.println("<h3>You have No money investment in Funds</h3>");
				}
			}
			if(collect.equals("shares"))
			{
				int p=db.select_trade("shares");
				int nsh=db.no_of_shares(accno);
				request.setAttribute("p",p);
				request.setAttribute("nsh",nsh);
				request.setAttribute("accno",accno);
				getServletConfig().getServletContext().getRequestDispatcher("/collectshare.jsp").include(request,response);
			}
			if(collect.equals("bonds"))
			{
				String s[][]=db.bonds_details(accno);
				if(s.length>0)
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
					aa.cbean cb=new aa.cbean();
					for(int i=0;i<s.length;i++)
					{
						cb.setaccno(accno);
						cb.setadd(s[i][0]); //bonds type..
						cb.setage(Integer.parseInt(s[i][1])); //no of bonds..
						cb.setcity(s[i][4]); //bonds date..
						request.setAttribute("cb",cb);
						
						out.println("<hr>");
						out.println("<h3>Bonds Type : "+s[i][0]+"<br>");
						out.println("No of Bonds  : "+s[i][1]+"<br>");
						out.println("Price/Bond : "+s[i][2]+"<br>");
						out.println("Amount invested : "+s[i][3]+"<br>");
						out.println("Date of maturiy : "+s[i][4]+"<br>");
						out.println("Total Amount(on maturity) : "+s[i][5]+"</h3><br><br>");
						
						getServletConfig().getServletContext().getRequestDispatcher("/deletebonds.jsp").include(request,response);	
					}
				}
				else
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
					out.println("<h3>You have No money investment in Bonds</h3>");
				}
			}
			if(collect.equals("debentures"))
			{
				String s[][]=db.debentures_details(accno);
				if(s.length>0)
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
					aa.cbean cb=new aa.cbean();
					for(int i=0;i<s.length;i++)
					{
						cb.setaccno(accno);
						cb.setage(Integer.parseInt(s[i][0])); //no of bonds..
						cb.setcity(s[i][3]); //bonds date..
						request.setAttribute("cb",cb);
						
						out.println("<hr>");
						out.println("<h3>No of Debentures  : "+s[i][0]+"<br>");
						out.println("Price/Debentures : "+s[i][1]+"<br>");
						out.println("Amount invested : "+s[i][2]+"<br>");
						out.println("Date of maturiy : "+s[i][3]+"<br>");
						out.println("Total Amount(on maturity) : "+s[i][4]+"</h3><br><br>");
						
						getServletConfig().getServletContext().getRequestDispatcher("/deletedebentures.jsp").include(request,response);	
					}
				}
				else
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
					out.println("<h3>You have No money investment in Debentures..</h3>");
				}
			}
		}
		else if(type.equals("deletefunds"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String ftype=request.getParameter("ftype");
			String nf=request.getParameter("nof");
			int nof=Integer.parseInt(nf);
			String fdate=request.getParameter("fdate");
			db.delete_funds(accno, ftype, nof, fdate);
			
			String s[][]=db.funds_details(accno);
			if(s.length>0)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)></p>");
				aa.cbean cb=new aa.cbean();
				for(int i=0;i<s.length;i++)
				{
					cb.setaccno(accno);
					cb.setadd(s[i][0]); //funds type..
					cb.setage(Integer.parseInt(s[i][1])); //no of funds..
					cb.setcity(s[i][4]); //funds date..
					request.setAttribute("cb",cb);
					
					out.println("<hr>");
					out.println("<h3>Funds Type : "+s[i][0]+"<br>");
					out.println("No of Funds  : "+s[i][1]+"<br>");
					out.println("Price/Fund : "+s[i][2]+"<br>");
					out.println("Amount invested : "+s[i][3]+"<br>");
					out.println("Date of maturiy : "+s[i][4]+"<br>");
					out.println("Total Amount(on maturity) : "+s[i][5]+"</h3><br><br>");
					
					getServletConfig().getServletContext().getRequestDispatcher("/deletefunds.jsp").include(request,response);	
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)></p>");
				out.println("<h3>Now You have No money investment in Funds</h3>");
			}
		}
		else if(type.equals("deletebonds"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String btype=request.getParameter("btype");
			String nb=request.getParameter("nob");
			int nob=Integer.parseInt(nb);
			String bdate=request.getParameter("bdate");
			db.delete_bonds(accno, btype, nob, bdate);
			
			String s[][]=db.bonds_details(accno);
			if(s.length>0)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)></p>");
				aa.cbean cb=new aa.cbean();
				for(int i=0;i<s.length;i++)
				{
					cb.setaccno(accno);
					cb.setadd(s[i][0]); //bonds type..
					cb.setage(Integer.parseInt(s[i][1])); //no of bonds..
					cb.setcity(s[i][4]); //bonds date..
					request.setAttribute("cb",cb);
					
					out.println("<hr>");
					out.println("<h3>Bonds Type : "+s[i][0]+"<br>");
					out.println("No of Bonds  : "+s[i][1]+"<br>");
					out.println("Price/Bond : "+s[i][2]+"<br>");
					out.println("Amount invested : "+s[i][3]+"<br>");
					out.println("Date of maturiy : "+s[i][4]+"<br>");
					out.println("Total Amount(on maturity) : "+s[i][5]+"</h3><br><br>");
					
					getServletConfig().getServletContext().getRequestDispatcher("/deletebonds.jsp").include(request,response);	
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)></p>");
				out.println("<h3>Now You have No money investment in Bonds</h3>");
			}
		}
		else if(type.equals("deletedebentures"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String nd=request.getParameter("nod");
			int nod=Integer.parseInt(nd);
			String ddate=request.getParameter("ddate");
			db.delete_debentures(accno, nod, ddate);
			
			String s[][]=db.debentures_details(accno);
			if(s.length>0)
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)></p>");
				aa.cbean cb=new aa.cbean();
				for(int i=0;i<s.length;i++)
				{
					cb.setaccno(accno);
					cb.setage(Integer.parseInt(s[i][0])); //no of debentures..
					cb.setcity(s[i][3]); //debentures date..
					request.setAttribute("cb",cb);
					
					out.println("<hr>");
					
					out.println("<h3>No of Debentures  : "+s[i][0]+"<br>");
					out.println("Price/Debentures : "+s[i][1]+"<br>");
					out.println("Amount invested : "+s[i][2]+"<br>");
					out.println("Date of maturiy : "+s[i][3]+"<br>");
					out.println("Total Amount(on maturity) : "+s[i][4]+"</h3><br><br>");
					
					getServletConfig().getServletContext().getRequestDispatcher("/deletedebentures.jsp").include(request,response);	
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-2)></p>");
				out.println("<h3>Now You have No money investment in Debentures</h3>");
			}
		}
		
		
		
		
		
		
		
		/*  Client Processing part...   */		
		
		
		
		
		
		
		
		else if(type.equals("c"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			aa.cbean cb=db.verify_client_account(accno, pin);
			if(cb.getfname()!=null)
			{
				request.setAttribute("cb",cb);
				request.setAttribute("an",cb.getaccno());
				request.setAttribute("pn",cb.getpin());
				if(request.getParameter("g")!=null)
				{
				getServletConfig().getServletContext().getRequestDispatcher("/problem.jsp").include(request,response);	
				}
				else
				{
				getServletConfig().getServletContext().getRequestDispatcher("/ccontent.jsp").include(request,response);
				}
			}
			else
			{
				out.println("<h3>Invalid Acount No. or Pin...</h3>");
				getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").include(request,response);
			}
		}
		else if(type.equals("fdstatus"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String s[][]=db.fdstatus(accno);
			out.println("<p align=right>");
			out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
			//out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
			for(int i=0;i<s.length;i++)
			{			
				
				out.println("<table border=0>");			
				out.println("<tr><td><b>Fixed Deposite  :</b></td><td> "+(i+1)+"</td></tr>");
				out.println("<tr><td>Amount Deposited	:</td><td><b>"+s[i][0]+"</b></td></tr>");
				out.println("<tr><td>Interest Applied (in %) :</td><td> "+s[i][1]+"</td></tr>");
				out.println("<tr><td>Nominee         :</td><td> "+s[i][2]+"</td></tr>");
				out.println("<tr><td>Maturity Date   :</td><td> "+s[i][3]+"</td></tr>");
				out.println("<tr><td>Total Amount on Maturity   :</td><td><b>"+s[i][4]+"</b></td></tr>");			
				out.println("</table><br><hr><br>");
				
			}
		}
		else if(type.equals("loanstatus"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			String s[][]=db.loanstatus(accno);
			out.println("<p align=right>");
			out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)></p>");
			//out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
			for(int i=0;i<s.length;i++)
			{			
				
				out.println("<table border=0>");			
				out.println("<tr><td><b>Loan No.  :</b></td><td> "+(i+1)+"</td></tr>");
				out.println("<tr><td>Amount Borrowed :</td><td><b>"+s[i][0]+"</b></td></tr>");
				out.println("<tr><td>Interest Applied (in %) :</td><td> "+s[i][1]+"</td></tr>");
				out.println("<tr><td>Purpose of Loan   :</td><td> "+s[i][2]+"</td></tr>");
				out.println("<tr><td>Vitness Name   :</td><td> "+s[i][3]+"</td></tr>");
				out.println("<tr><td>Security Submitted  :</td><td> "+s[i][4]+"</td></tr>");
				out.println("<tr><td>Security/Mortgage Value  :</td><td> "+s[i][5]+"</td></tr>");
				out.println("<tr><td>Maturity Date   :</td><td> "+s[i][6]+"</td></tr>");
				out.println("<tr><td>Total Amount Redeemable   :</td><td><b>"+s[i][7]+"</b></td></tr>");			
				out.println("</table><br><hr><br>");
				
			}
		}
		else if(type.equals("transfer"))
		{
			String accno1=request.getParameter("accno1");
			String money1=request.getParameter("money1");
			int m1=Integer.parseInt(money1);
			String money=request.getParameter("money");
			int m2=Integer.parseInt(money);
			int amt=m2-m1;
			if(amt>=1000)
			{
				dbbean db=new dbbean();
				db.createConnection();				
				int tamt=db.select_total_amt(accno1);
				if(tamt==0)
				{
					out.println("<input type=image src=../images/back.jpg  align=right onclick=javascript:history.go(-1)>");
					out.println("Account No :"+accno1+" doesn't exist..");
				}
				else
				{
					int a=db.transaction(accno,m1,"W",amt);
					tamt=db.select_total_amt(accno1);
					int b=db.transaction(accno1,m1,"D",(tamt+m1));
					if(a>0&&b>0)
					{
						out.println("<p align=right>");
						out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
						out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
						out.println("<h3>Money is successfully transferred");
						tamt=db.select_total_amt(accno);
						out.println("<br>Now you have left balance with Rs."+tamt+"</h3>");
					}
					else
					{
						out.println("<p align=right>");
						out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
						out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
						out.println("<b>Sorry for inconvience...</b>");
					}
				}
			}
			else
			{
				out.println("<p align=right>");
				out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
				out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
				out.println("<h3>You Can Not Transfer "+m1+" Rs. from your account</h3>");
			}
			
		}
		else if(type.equals("cpin"))
		{
			String npin=request.getParameter("text1");
			dbbean db=new dbbean();
			db.createConnection();
			aa.cbean cb=db.verify_client_account(accno, pin);
			if(cb.getfname()!=null)
			{
				int a=db.change_pin(accno, npin);
				if(a>0)
				{
					out.println("<p align=right>");
					out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
					out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
					out.println("<h3><font color=green>PIN Successfully Changed...</font></h3>");
				}
			}
			
		}
		else if(type.equals("share"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			int p=db.select_trade("shares");
			request.setAttribute("p",p);
			request.setAttribute("accno",accno);
			getServletConfig().getServletContext().getRequestDispatcher("/share.jsp").include(request,response);
		}
		else if(type.equals("cshare"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			int p=db.select_trade("shares");
			int nsh=db.no_of_shares(accno);
			request.setAttribute("p",p);
			request.setAttribute("nsh",nsh);
			request.setAttribute("accno",accno);
			getServletConfig().getServletContext().getRequestDispatcher("/collectshare.jsp").include(request,response);
		}
		else if(type.equals("returnshares"))
		{
			String rsh=request.getParameter("text3");
			int rtsh=Integer.parseInt(rsh);
			
			dbbean db=new dbbean();
			db.createConnection();
			int p=db.select_trade("shares");
			int nsh=db.no_of_shares(accno);
			int amt=rtsh*p;
			int lsh=nsh-rtsh;
			db.delete_shares(accno);
			db.create_shares(accno,lsh,p,(lsh*p));
			int money=db.select_total_amt(accno);
			db.transaction(accno,amt,"D",(amt+money));
			out.println("<p align=right>");
			out.println("<input type=image src=../images/back.jpg  onclick=javascript:history.go(-1)>");
			out.println("<input type=image src=../images/home.jpg  onclick=javascript:history.go(-2)></p>");	
			out.println("<h3>SHARES successfully withdrawn");
			out.println("<br>"+amt+" Rs. are successfully added to your account</h3>");
			out.println("<h4><br>Your previous balance was : "+money);
			out.println("<br>Your balance now is Rs. "+(money+amt)+"</h4>");
			
		}
		else if(type.equals("updates"))
		{
			dbbean db=new dbbean();
			db.createConnection();
			int p=db.select_trade("funds");
			int q=db.select_trade("debentures");
			int r=db.select_trade("shares");
			int s=db.select_trade("bonds");
			request.setAttribute("p",p);
			request.setAttribute("q",q);
			request.setAttribute("r",r);
			request.setAttribute("s",s);
			getServletConfig().getServletContext().getRequestDispatcher("/updates.jsp").include(request,response);
		}
		
		
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		doPost(request,response);
	}
}
