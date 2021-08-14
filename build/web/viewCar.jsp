<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIEW CARS</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
    
    <div class="form-group">
        <div  class="col-sm-4"></div>
            <div  class="col-sm-4">
                <h2 style="text-align: center">Car Details</h2>
            </div>
    </div>
    <div class="col-sm-2">
        <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Registration Number</th>
                <th scope="col">Seller Name</th>
                <th scope="col">Company</th>
                <th scope="col">Model</th>
                <th scope="col">Price</th>
                <th scope="col">city</th>
                <th scope="col">Address</th>
                <th scope="col">PHone No.</th>

            </tr>
        </thead>
        <tbody>
            <% 
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");

                String query = "Select * from sellcar";
                pst = con.prepareStatement(query);
                rs = pst.executeQuery();

                while(rs.next()){
                    %>
                    <tr>
                    <th scope="row"><%= rs.getString("regno") %></th>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("company")%></td>
                    <td><%=rs.getString("model")%></td>
                    <td><%=rs.getString("price")%></td>
                    <td><%=rs.getString("city")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("phone")%></td>

                    <td><a class="btn btn-danger" href="buyCar.jsp?id=<%=rs.getString("regno") %>" role="button">BUY</a></td>
                    </tr>
            <% }%>	

        </tbody>
    </table>

</body>
</html>