<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css"/>
</head>
<body>
    <section id="login" class="login py-5 d-flex h-100 align-items-center">
        <div class="container">
            <div class="row">
               <div class="col-md-12">
                   <div class="card rounded shadow border">
                       <div class="row no-gutters">
                        <div class="col-md-7 auction_bg d-flex align-items-center">
                            <div class="p-5">
                                <div class="content_wrap p-5">
                                    <h2 class="text-white text-uppercase mb-4">Online <span class="font-weight-bold yellow-text">Auction</span>
                                    </h2>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                                        the industry's</p>
                                    <p>Standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it
                                        to make a
                                        type specimen
                                        book.</p>
                                </div>
                            </div>
                        </div>
                           <div class="col-md-5 p-5">
                            <h3 class="mb-4 font-weight-bold">Register</h3>
                            <form method="POST" action="/register" modelAttribute="userForm">
                            <span class="text-danger"> ${msg}</span>
                                <div class="form-group">
                                    <input type="text" name="public_name" placeholder="Enter your public name" class="form-control" required/>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="user_email" placeholder="Enter your email" class="form-control" required/>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="user_password" placeholder="Enter your password" class="form-control" required/>
                                </div>
                                <button class="btn btn-outline-success px-4 mt-3 mb-3">
                                    Sign Up
                                </button>
                                <p>If you already have an account, <a href="<c:url value='/' />" class="text-primary">Login Here</a></p>
                            </form>
                           </div>

                       </div>
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