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
    <link rel="stylesheet" href="<c:url value='resources/css/dashboard.css' />">
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
   <% String name = session.getAttribute("name").toString(); %>
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
    <section id="resgistration_lists" class="resgistration_lists py-5">
        <div class="container">
        <h3>Hello <%=name%></h3>
        <br/>



            <div class="row mb-3">
                <div class="col-md-4">
                    <div class="card position-relative text-center">
                    <a href="<c:url value='/add-trade' />">
                      <img class="card-img-top" src="https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png" alt="Card image cap">
                      <div class="card-body">
                        <a href="<c:url value='/add-trade' />" class="btn btn-primary">Add Transaction</a>
                      </div>
                    </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card position-relative text-center">
                    <a href="<c:url value='/trade-list' />">
                      <img class="card-img-top" src="https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png" alt="Card image cap">
                      <div class="card-body">
                        <a href="<c:url value='/trade-list' />" class="btn btn-primary">Trade List</a>
                      </div>
                    </a>
                    </div>
                </div>
                <c:if test="${name == 'admin' && userId == 1}">
                    <div class="col-md-4">
                        <div class="card position-relative text-center">
                        <a href="<c:url value='/user-list' />">
                          <img class="card-img-top" src="https://cdn4.buysellads.net/uu/1/3386/1525189943-38523.png" alt="Card image cap">
                          <div class="card-body">
                            <a href="<c:url value='/user-list' />" class="btn btn-primary">User List</a>
                          </div>
                          </a>
                        </div>
                    </div>
                </c:if>

            </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>