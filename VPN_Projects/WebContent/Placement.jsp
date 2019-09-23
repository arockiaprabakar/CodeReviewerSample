<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
<body bgcolor="Peachpuff">
<h2><center><u>Placement Details</u></center></h2>
<form name=booksdet>
<center>
<table border=1 cellpadding=5>
<tr>
<th><font size=5>Contact Person</font></th>
<th><font size=5>Company</font></th>
<th><font size=5>Softwares</font></th>
<th><font size=5>Callcenter</font></th>
<th><font size=5>Networking</font></th>

</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/central","root","");
	PreparedStatement pr=con.prepareStatement("select * from PlacementDetails");
	ResultSet rs=pr.executeQuery();
	while(rs.next())
	{
		%>
		<tr>
		<td><font size=4>
		<%=rs.getString(1)%>
		</font>
		</td>
		<td><font size=4>
		<%=rs.getString(2)%>
		</font>
		</td>
		<td><font size=4>
		<%=rs.getString(3)%>
		</font>
		</td>
		<td><font size=4>
		<%=rs.getString(4)%>
		</font>
		</td>
		<td><font size=4>
		<%=rs.getString(5)%>
		</font>
		</td>
		</tr>
	<%
	}
}
catch(Exception e)
	{
	out.println("error"+ e);
	}

%>

</table>
</center>
</form>
</body>
</html>