<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/trade-form.css' />">
</head>
<body>
   <%
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
        response.setHeader("pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if(session.getAttribute("user") == null){
   %>
       <c:redirect url="/" />
   <%
       }
   %>
    <section class="header bg-light py-3 px-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 d-flex justify-content-between">
                    <h3 class="font-weight-bold">Dashboard</h3>
                    <a href="<c:url value='/logout'/>" class="btn btn-outline-primary">Logout</a>
                </div>
            </div>
        </div>
    </section>
    <a href="dashboard.jsp" class="btn btn-success" style="float:right; margin-right:50px; margin-top:50px;"> Back</a>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-3">
              <div class="wrapper">
                <form method="POST" action="/add-trade" modelAttribute="tradeForm" class="form-signin">

                  <input type="hidden" name="public_name" value="${name}"/>
                  <div class="form-group">
                    <input type="number" class="form-control" name="quantity" placeholder="Quantity (from 1 to 100,000)"/>
                  </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="price" placeholder="Price (from $0.01 to $1000,000.00)"/>
                    </div>

                    <span class="text-danger"> ${msg}</span>

                    <a href="dashboard.jsp" class="btn btn-secondary">Close</a>

                    <button type="submit" class="btn btn-primary" value="hello">Save</button>
                </form>
              </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>