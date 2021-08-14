<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELL AND BUY CAR</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<style>
body {  
  background-position: center;
  background-repeat: no-repeat;
  background-size: 150%;
  background-image: url("cars.jpg");   
}
</style>
</head>
<body style="padding:30px" >
    <div>
        <center>
            <a href="sellCar.jsp"  class="btn btn-success">SELL CAR</a>
            <a href="viewCar.jsp" class="btn btn-success">VIEW CAR</a>
        </center>
    </div> 
    <div>
        <br>
        <form id="form" method="post" action="searchCar.jsp" class="form-horizontal">
            <center>
                <div class="form-group">
                    <div  class="col-sm-4"></div>
                        <div  class="col-sm-4 mx-auto">
                            <label>Enter City Name</label>
                            <input type="text" name="city" class="form-control" id="city">
                        </div>
                    </div>
                </div>
            </center>
            <div class="form-group" align="center"> 
                <div class="col-sm-4">
                    <div class="col-sm-4">
                        <Button class="btn btn-success" style="width: 90px;">SEARCH</Button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
