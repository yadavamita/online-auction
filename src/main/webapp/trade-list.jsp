<%@include file="base.jsp" %>
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
