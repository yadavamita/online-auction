<%@include file="base.jsp" %>
    <a href="dashboard.jsp" class="btn btn-success" style="float:right; margin-right:50px; margin-top:50px;"> Back</a>

    <section id="resgistration_lists" class="resgistration_lists py-5">
        <div class="container">
            <div class="row mb-3">
                <div class="col-md-12">
                    <h4 class="text-uppercase font-weight-bold ">List of Registered Users</h4>
                </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Sr. No</th>
                                    <th>Public Name</th>
                                    <th>Email Address</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${users}" var="user">
                                    <tr>
                                        <td>${user.userId}</td>
                                        <td>${user.name}</td>
                                        <td>${user.emailId}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                  </div>
               </div>
            </div>
        </div>
    </section>

