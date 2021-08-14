<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
 
<html>
    <head>    
        <title>Buying Car</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        
        <%
             
            Connection con;     
            String msg = "";
            String color = "";
   
    
   	    if(request.getMethod().compareToIgnoreCase("post")==0)
   		{
                    try
   			{
                            String regno = request.getParameter("regno");
                            String dln = request.getParameter("dln");
                            String name = request.getParameter("name");
                            String address = request.getParameter("address");
                            String phone = request.getParameter("phone");

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
                            String query = "INSERT INTO buycar(sregno,dl,name,address,phone) VALUES (?,?,?,?,?)";
                            String queryd = "delete from sellcar where regno = ?";

                            PreparedStatement pstd = con.prepareStatement(queryd);


                            pstd.setString(1, regno);
                            pstd.executeUpdate();
                            PreparedStatement pst = con.prepareStatement(query);


                            pst.setString(1, regno);
                            pst.setString(2, dln);
                            pst.setString(3, name);
                            pst.setString(4, address);
                            pst.setString(5, phone);
                            pst.executeUpdate();

                            color = "green";
                            msg = "Buying Succesfully";
   	   			
   	   			
   			}
                    catch(Exception ex)
                        {
                            ex.printStackTrace();
                            color = "red";
                            msg = "Error Occured";
                        }
   		}
        %>    
        
 
        
    <div class="form-group col-12 p-0">
	<h4 style="color:<%= color %>"><%= msg %></h4>
	</div>
        <form id="form" method="post" action="buyCar.jsp" class="form-horizontal">
             <% 
                          
                PreparedStatement pst;
                ResultSet rs;

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");

                String id = request.getParameter("id");

                pst = con.prepareStatement("select * from sellcar where regno = ?");
                pst.setString(1, id);
                rs = pst.executeQuery();

                while(rs.next())
                {

            %>   
         	
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Enter Details</h2>
                </div>
            </div>
            <hr/>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                    <div  class="col-sm-4 mx-auto">
                  	<label>Registation No</label>
                        <input type="text" name="regno" readonly class="form-control" id="regno" value="<%= rs.getString("regno") %>">
                </div>
            </div>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                    <div  class="col-sm-4 mx-auto">
                  	<label >DL Number</label>
  			<input type="text" name="dln" class="form-control" id="dl">
                </div>
            </div>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                    <div  class="col-sm-4 mx-auto">
                  	<label>Buyer Name</label>
                        <input type="text" name="name" class="form-control" id="name">
                </div>
            </div>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                    <div  class="col-sm-4 mx-auto">
                        <label>Address:</label>
                        <input type="text" name="address" class="form-control" id="address">
                    </div>
            </div>
            
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control" id="phone">
                </div>
            </div>
            <br/>
            
            <div class="form-group" align="center">
             
                <div class="col-sm-6">
                    <div class="col-sm-2">
                        <Button class="btn btn-success" style="width: 80px;">BUY</Button>
                    </div>
                </div>
            </div>
            
             <% } %>
        </form>
        <div class="col-sm-12"  align="right">
            <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
    </body>
</html>