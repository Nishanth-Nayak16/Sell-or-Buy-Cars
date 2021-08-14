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
        <title>SELL CAR</title>
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
                            String sname = request.getParameter("sname");
                            String model = request.getParameter("model");
                            String company = request.getParameter("company");
                            String price = request.getParameter("price");
                            String city = request.getParameter("city");
                            String address = request.getParameter("address");
                            String phone = request.getParameter("phone");

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/car","root","");
                            String query = "INSERT INTO sellcar(regno,name,company,model,price,city,address,phone) VALUES (?,?,?,?,?,?,?,?)";

                            PreparedStatement pst = con.prepareStatement(query);

                            pst.setString(1, regno);
                            pst.setString(2, sname);
                            pst.setString(3, company);
                            pst.setString(4, model);
                            pst.setString(5, price);
                            pst.setString(6, city);
                            pst.setString(7, address);
                            pst.setString(8, phone);

                            pst.executeUpdate();

                            color = "green";
                            msg = "Car Selling Succesfully";
	
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
            <center><h4 style="color:<%= color %>"><%= msg %></h4></center>
        </div>
        
        <form id="form" method="post" action="sellCar.jsp" class="form-horizontal">

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4">
                    <h2 style="text-align: center">Enter Car Details</h2>
                </div>
            </div>
            <hr/>
            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Registation No</label>
                    <input type="text" name="regno" class="form-control" id="regno">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label >Seller Name</label>
                    <input type="text" name="sname" class="form-control" id="sname">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Company</label>
                    <input type="text" name="company" class="form-control" id="comapny">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Model</label>
                    <input type="text" name="model" class="form-control" id="model">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Selling Price</label>
                    <input type="text" name="price" class="form-control" id="price">
                </div>
            </div>


            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>City</label>
                    <input type="city" name="city" class="form-control" id="city">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Address</label>
                    <input type="text" name="address" class="form-control" id="address">
                </div>
            </div>

            <div class="form-group">
                <div  class="col-sm-4"></div>
                <div  class="col-sm-4 mx-auto">
                    <label>Phone Number</label>
                    <input type="text" name="phone" class="form-control" id="phone">
                </div>
            </div>
            <br/>
                <div class="form-group" align="center">
                    <div class="col-sm-6">
                        <div class="col-sm-2">
                            <Button class="btn btn-success" style="width: 90px;">Submit</Button>
                        </div>
                        <div class="col-sm-4">
                        </div>
                    </div>
                </div>
        </form>
        <div class="col-sm-12"  align="right">
            <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
    </body>
</html>