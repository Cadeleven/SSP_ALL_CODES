<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
</head>
<body>
<h4>Product Details</h4>
<h4>Select the Product</h4>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "jneccse");
        stmt = con.createStatement();
        String sql1 = "SELECT * FROM product";
        rs = stmt.executeQuery(sql1);
        int cnt = 1;
%>
        <table border="1">
            <thead>
                <tr>
                    <th>S.No.</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th colspan="2" align="center">Action</th>
                </tr>
            </thead>
            <tbody>
<%
        while (rs.next()) {
            int pid = rs.getInt("pid");
            String pname = rs.getString("prodName");
            String price = rs.getString("price");
%>
                <tr>
                    <td><%= cnt %></td>
                    <td><%= pid %></td>
                    <td><%= pname %></td>
                    <td><%= price %></td>
                    <td><a href="Description.jsp?id=<%= pid %>">Description</a></td>
                    <td><a href="Purchase.jsp?id=<%= pid %>">Purchase</a></td>
                    <td><a href="Tax.jsp?id=<%= pid %>">Calculate Tax</a></td>
					<td><a href="Invoice.jsp?id=<%= pid %>">Generate Invoice</a></td>
                </tr>
           
                
<%
            cnt++;
        }
%>
            </tbody>
        </table>
<%
    } catch (SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
%>
<a href="index.jsp">Home</a>
</body>
</html>
