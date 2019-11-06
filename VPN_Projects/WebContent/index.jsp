<html>
<body>
<h2>Hello World!</h2>
<table border = 1>
<%
    for ( int i = 0; i < n; i++ ) {
        %>
        <tr>
        <td>Number</td>
        <td><%= i+1 %></td>
        </tr>
        <%
    }
%>
</table>
</body>
</html>
