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
    <link rel="stylesheet" href="resources/css/dashboard.css"/>
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
<% String userId = session.getAttribute("name").toString(); %>
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
    <section id="resgistration_lists" class="resgistration_lists py-5">
        <div class="container">
        <div class="row mb-3">
            <div class="col-md-12">
                <h4 class="text-uppercase font-weight-bold ">Trade List</h4>
            </div>
        </div>
        <div class="row">
           <div class="col-md-12">
              <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Public Name</th>
                                <th>Quantity</th>
                                <th>Price($) </th>
                                <c:if test="${name == 'admin' && userId == 1}">
                                    <th>Action</th>
                                </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${trades}" var="trade">
                                <tr>
                                    <td>${trade.name}</td>
                                    <td>${trade.quantity}</td>
                                    <td>${trade.price}</td>
                                    <c:if test="${name == 'admin' && userId == 1}">
                                        <td>
                                            <div class="btn-group">
                                                <a href="<c:url value='/delete-${name}' />"><button class="btn btn-outline-danger"><i class="fas fa-trash-alt "></i></button></a>
                                            </div>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
              </div>
           </div>
        </div>
    </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>