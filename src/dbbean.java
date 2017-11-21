
import java.sql.*;
import java.util.Date;

import aa.cbean;

public class dbbean
{
	private Connection cn;
	private PreparedStatement ps,ps1;
	private ResultSet rs;
dbbean()
{
} 
public void createConnection()
{
	try
	{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	cn=DriverManager.getConnection("Jdbc:Odbc:3");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
public aa.bbean verifyAccount(String accno,String pin)
{
	aa.bbean bbean=new aa.bbean();
	try
	{
	ps=cn.prepareStatement("select * from bankdetail where bcode=? and bpin=?");
	ps.setString(1,accno);
	ps.setString(2,pin);
	
	rs=ps.executeQuery();
	if(rs.next())
	{
		bbean.setbname(rs.getString(1));
		bbean.setbcode(rs.getString(2));
		bbean.setbpin(rs.getString(3));
		bbean.setbstate(rs.getString(4));
		bbean.setbcity(rs.getString(5));
		bbean.setblevel(rs.getInt(6));
		bbean.setbopen(rs.getString(7));
		bbean.setbsno(rs.getInt(8));
	
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return bbean;
}
public int transaction(String accno,int amt,String sts,int ttamt)
{
	Date d=new Date();
	String date=String.valueOf(d);
	int a=0;
	try
	{
	ps=cn.prepareStatement("insert into trans values(?,?,?,?,?)");	
	ps.setString(1,accno);
	ps.setInt(2,amt);
	ps.setString(3,sts);
	ps.setString(4,date);
	ps.setInt(5,ttamt);
	a=ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public int select_total_amt(String accno)
{
	int tamt=0;
	String ttamt="0";
	try
	{
		ps=cn.prepareStatement("Select rtrim(ltrim(total)) from trans where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			ttamt=rs.getString(1);
		}
		tamt=Integer.parseInt(ttamt);
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return tamt;
}
public String[][] acc_status(String accno)
{
	String s[][]=new String[1][5];
	int i=0;
	try
	{
		ps=cn.prepareStatement("select * from trans where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		int l=0;
		while(rs.next())
		{
			l++;
		}
		s=new String[l][5];
		ResultSet rs1=ps.executeQuery();
		while(rs1.next())
		{
			s[i][0]=rs1.getString(1);
			s[i][1]=String.valueOf(rs1.getInt(2));
			s[i][2]=rs1.getString(3);
			s[i][3]=rs1.getString(4);
			s[i][4]=String.valueOf(rs1.getInt(5));
			i++;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;
}
public int createAccount(aa.cbean cb)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("insert into clientdetail values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,cb.getfname());
		ps.setString(2,cb.getlname());
		ps.setString(3,cb.getadd());
		ps.setString(4,cb.getstate());
		ps.setString(5,cb.getcity());
		ps.setInt(6,cb.getage());
		ps.setString(7,cb.getfthname());
		ps.setString(8,cb.getocc());
		ps.setInt(9,cb.getinitdep());
		ps.setString(10,cb.getpno());
		ps.setString(11,cb.getissuer());
		ps.setString(12,cb.getaccno());
		ps.setString(13,cb.getpin());
		a=ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public int create_backup_Account(aa.cbean cb)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("insert into backup values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,cb.getfname());
		ps.setString(2,cb.getlname());
		ps.setString(3,cb.getadd());
		ps.setString(4,cb.getstate());
		ps.setString(5,cb.getcity());
		ps.setInt(6,cb.getage());
		ps.setString(7,cb.getfthname());
		ps.setString(8,cb.getocc());
		ps.setString(9,"running");
		ps.setString(10,cb.getpno());
		ps.setString(11,cb.getissuer());
		ps.setString(12,cb.getaccno());
		ps.setString(13,cb.getpin());
		a=ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public aa.cbean edit_acc(String accno)
{
	aa.cbean cb=new aa.cbean();
	try
	{
		ps=cn.prepareStatement("select * from clientdetail where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		if(rs.next())
		{			
			cb.setfname(rs.getString(1));
			cb.setlname(rs.getString(2));
			cb.setadd(rs.getString(3));
			cb.setstate(rs.getString(4));
			cb.setcity(rs.getString(5));
			cb.setage(rs.getInt(6));
			cb.setfthname(rs.getString(7));
			cb.setocc(rs.getString(8));
			cb.setpno(rs.getString(10));
		}
		else
		{
			cb.setfname("");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return cb;
}
public int update_acc(String accno,aa.cbean cb)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("update clientdetail set fname=? ,lname=? ,add=? ,state=? ,city=? ,age=? ,fthname=? ,occ=? ,pno=? where accno=? ");
		ps.setString(1,cb.getfname());
		ps.setString(2,cb.getlname());
		ps.setString(3,cb.getadd());
		ps.setString(4,cb.getstate());
		ps.setString(5,cb.getcity());
		ps.setInt(6,cb.getage());
		ps.setString(7,cb.getfthname());
		ps.setString(8,cb.getocc());
		ps.setString(9,cb.getpno());
		ps.setString(10,accno);
		a=ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public int create_fixed_deposite(aa.fd fd)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("insert into fd values(?,?,?,?,?,?,?,?)");
		ps.setString(1,fd.getaccno());
		ps.setInt(2,fd.getmoney());
		ps.setFloat(3,fd.gettime());
		ps.setInt(4,fd.getinterest());
		ps.setString(5,fd.getnominee());
		ps.setString(6,fd.getagent());
		ps.setString(7,fd.getdoe());
		ps.setFloat(8,fd.gettamt());
		a=ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public int issue_loan(aa.fd fd)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("insert into loan values(?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,fd.getaccno());
		ps.setInt(2,fd.getmoney());
		ps.setFloat(3,fd.gettime());
		ps.setInt(4,fd.getinterest());
		ps.setString(5,fd.getpurpose());
		ps.setString(6,fd.getvname());
		ps.setString(7,fd.getvproff());
		ps.setString(8,fd.getssub());
		ps.setString(9,fd.getsvalue());
		ps.setString(10,fd.getagent());
		ps.setString(11,fd.getdoe());
		ps.setFloat(12,fd.gettamt());
		a=ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public int problem(String accno,String prob,String date)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("insert into problem values(?,?,?,?)");
		ps.setString(1,accno);
		ps.setString(2,prob);
		ps.setString(3,"");
		ps.setString(4,date);
		a=ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public String[][] response(String accno)
{
	String s[][]=new String[1][2];
	int l=0,i=0;
	try
	{
		ps=cn.prepareStatement("select * from problem where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		s=new String[l][2];
		ResultSet rs1=ps.executeQuery();
		while(rs1.next())
		{
			s[i][0]=rs1.getString(2);
			s[i][1]=rs1.getString(3);
			i++;
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;	
}
public int demand_draft(String accno,String fav,String pay,int amt,String date)
{
	int a=0;
	try
	{
	ps=cn.prepareStatement("insert into draft values(?,?,?,?,?)");	
	ps.setString(1,accno);
	ps.setString(2,fav);
	ps.setString(3,pay);
	ps.setInt(4,amt);
	ps.setString(5,date);
	a=ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public void delete_fd(String accno,int money,String date)
{
	try
	{
	ps=cn.prepareStatement("delete from fd where accno=? and money=? and doe=?");
	ps.setString(1,accno);
	ps.setInt(2,money);
	ps.setString(3,date);
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public void delete_loan(String accno,int money,String date)
{
	try
	{
	ps=cn.prepareStatement("delete from loan where accno=? and money=? and doe=?");
	ps.setString(1,accno);
	ps.setInt(2,money);
	ps.setString(3,date);
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public void delete_client1(String accno)
{
	try
	{
	ps=cn.prepareStatement("delete from clientdetail where accno=?");
	ps.setString(1,accno);
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
public void delete_client2(String accno)
{
	try
	{
	ps=cn.prepareStatement("delete from trans where accno=?");
	ps.setString(1,accno);
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public void delete_client3(String accno)
{
	try
	{
		ps=cn.prepareStatement("update backup set status=? where accno=?");
		ps.setString(1,"deleted");
		ps.setString(2,accno);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public void delete_question(String accno,String ques)
{
	try
	{
		ps=cn.prepareStatement("delete from problem where accno=? and problem=?");
		ps.setString(1,accno);
		ps.setString(2,ques);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
public String[][] search_by_name(String name)
{
	int l=0,i=0;
	String a[][]=new String[1][1];
	try
	{
		ps=cn.prepareStatement("select fname,accno from clientdetail where fname like '%"+name+"%'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		a=new String[l][2];
		ResultSet rs1=ps.executeQuery();
		while(rs1.next())
		{
			a[i][0]=rs1.getString(1);
			a[i][1]=rs1.getString(2);
			i++;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public void create_funds(String accno,String ftype,int nof,int pricef,int total,int inrst,int time,String doe,int tamt)
{
	try
	{
		ps=cn.prepareStatement("insert into funds values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1,accno);
		ps.setString(2,ftype);
		ps.setInt(3,nof);
		ps.setInt(4,pricef);
		ps.setInt(5,total);
		ps.setInt(6,inrst);
		ps.setInt(7,time);
		ps.setString(8,doe);
		ps.setInt(9,tamt);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public int select_trade(String funds)
{
	int p=0;
	try
	{
		ps=cn.prepareStatement("select "+funds+" from trading");
		rs=ps.executeQuery();
		if(rs.next())
		{
			p=rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return p;
}
public void create_shares(String accno,int nof,int pricef,int total)
{
	try
	{
		ps=cn.prepareStatement("insert into shares values(?,?,?,?)");
		ps.setString(1,accno);
		ps.setInt(2,nof);
		ps.setInt(3,pricef);
		ps.setInt(4,total);	
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public void create_bonds(String accno,String ftype,int nof,int pricef,int total,int inrst,int time,String doe,int tamt)
{
	try
	{
		ps=cn.prepareStatement("insert into bonds values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1,accno);
		ps.setString(2,ftype);
		ps.setInt(3,nof);
		ps.setInt(4,pricef);
		ps.setInt(5,total);
		ps.setInt(6,inrst);
		ps.setInt(7,time);
		ps.setString(8,doe);
		ps.setInt(9,tamt);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
public void create_debentures(String accno,int nof,int pricef,int total,int inrst,int time,String doe,int tamt)
{
	try
	{
		ps=cn.prepareStatement("insert into debentures values(?,?,?,?,?,?,?,?)");
		ps.setString(1,accno);
		ps.setInt(2,nof);
		ps.setInt(3,pricef);
		ps.setInt(4,total);
		ps.setInt(5,inrst);
		ps.setInt(6,time);
		ps.setString(7,doe);
		ps.setInt(8,tamt);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}	
}
public int no_of_shares(String accno)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("select nsh from shares where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			a=a+rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
	
}
public int no_of_funds(String accno)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("select nof from funds where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			a=a+rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
	
}
public int no_of_debentures(String accno)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("select nod from debentures where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			a=a+rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
	
}
public int no_of_bonds(String accno)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("select nob from bonds where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			a=a+rs.getInt(1);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
	
}

public void delete_shares(String accno)
{
	try
	{
		ps=cn.prepareStatement("delete from shares where accno=?");
		ps.setString(1,accno);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}	
}

public String[][] funds_details(String accno)
{
	String s[][]=new String[0][6];
	int l=0,i=0;
	try
	{
		ps=cn.prepareStatement("select * from funds where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		s=new String[l][6];
		rs=ps.executeQuery();
		while(rs.next())
		{
			s[i][0]=rs.getString(2);
			s[i][1]=String.valueOf(rs.getInt(3));
			s[i][2]=String.valueOf(rs.getInt(4));
			s[i][3]=String.valueOf(rs.getInt(5));
			s[i][4]=rs.getString(8);
			s[i][5]=String.valueOf(rs.getInt(9));
			i++;		
		}	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;
	
}
public void delete_funds(String accno,String ftype,int nof,String fdate)
{
	try
	{
		ps=cn.prepareStatement("delete from funds where accno=? and ftype=? and nof=? and doe=?");
		ps.setString(1,accno);
		ps.setString(2,ftype);
		ps.setInt(3,nof);
		ps.setString(4,fdate);
		ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}


public String[][] bonds_details(String accno)
{
	String s[][]=new String[0][6];
	int l=0,i=0;
	try
	{
		ps=cn.prepareStatement("select * from bonds where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		s=new String[l][6];
		rs=ps.executeQuery();
		while(rs.next())
		{
			s[i][0]=rs.getString(2);
			s[i][1]=String.valueOf(rs.getInt(3));
			s[i][2]=String.valueOf(rs.getInt(4));
			s[i][3]=String.valueOf(rs.getInt(5));
			s[i][4]=rs.getString(8);
			s[i][5]=String.valueOf(rs.getInt(9));
			i++;		
		}	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;
	
}
public void delete_bonds(String accno,String btype,int nob,String bdate)
{
	try
	{
		ps=cn.prepareStatement("delete from bonds where accno=? and btype=? and nob=? and doe=?");
		ps.setString(1,accno);
		ps.setString(2,btype);
		ps.setInt(3,nob);
		ps.setString(4,bdate);
		ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
public String[][] debentures_details(String accno)
{
	String s[][]=new String[0][5];
	int l=0,i=0;
	try
	{
		ps=cn.prepareStatement("select * from debentures where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		s=new String[l][5];
		rs=ps.executeQuery();
		while(rs.next())
		{
			s[i][0]=String.valueOf(rs.getInt(2));
			s[i][1]=String.valueOf(rs.getInt(3));
			s[i][2]=String.valueOf(rs.getInt(4));
			s[i][3]=rs.getString(7);
			s[i][4]=String.valueOf(rs.getInt(8));
			i++;		
		}	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;
	
}
public void delete_debentures(String accno,int nod,String ddate)
{
	try
	{
		ps=cn.prepareStatement("delete from debentures where accno=? and nod=? and doe=?");
		ps.setString(1,accno);
		ps.setInt(2,nod);
		ps.setString(3,ddate);
		ps.executeUpdate();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}




/* Client Processing Part...*/








public aa.cbean verify_client_account(String accno,String pin)
{
	aa.cbean cb=new aa.cbean();
	try
	{
		ps=cn.prepareStatement("select * from clientdetail where accno=? and pin=?");
		ps.setString(1,accno);
		ps.setString(2,pin);
		rs=ps.executeQuery();
		if(rs.next())
		{
			cb.setaccno(accno);
			cb.setpin(pin);
			cb.setfname(rs.getString(1));
			cb.setlname(rs.getString(2));
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return cb;
}
public String[][] fdstatus(String accno)
{
	int l=0,i=0;
	String s[][]=new String[1][1];
	try
	{
		ps=cn.prepareStatement("select * from fd where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		s=new String[l][5];
		ResultSet rs1=ps.executeQuery();
		while(rs1.next())
		{
			s[i][0]=rs1.getString(2);
			s[i][1]=rs1.getString(4);
			s[i][2]=rs1.getString(5);
			s[i][3]=rs1.getString(7);
			s[i][4]=rs1.getString(8);
			i++;
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;
}
public String[][] loanstatus(String accno)
{
	int l=0,i=0;
	String s[][]=new String[1][1];
	try
	{
		ps=cn.prepareStatement("select * from loan where accno=?");
		ps.setString(1,accno);
		rs=ps.executeQuery();
		while(rs.next())
		{
			l++;
		}
		s=new String[l][8];
		ResultSet rs1=ps.executeQuery();
		while(rs1.next())
		{
			s[i][0]=rs1.getString(2);
			s[i][1]=rs1.getString(4);
			s[i][2]=rs1.getString(5);
			s[i][3]=rs1.getString(6);
			s[i][4]=rs1.getString(8);
			s[i][5]=rs1.getString(9);
			s[i][6]=rs1.getString(11);
			s[i][7]=rs1.getString(12);
			i++;
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return s;
}
public int change_pin(String accno,String npin)
{
	int a=0;
	try
	{
		ps=cn.prepareStatement("update clientdetail set pin=? where accno=?");
		ps.setString(1,npin);
		ps.setString(2,accno);
		a=ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}

}