<%@include file="base.jsp" %>
<section id="resgistration_lists" class="resgistration_lists py-5">
    <div class="container">
        <h3 style="color: blue;">
            Hello <%=name%></h3>
        <br/>
        <div class="row mb-3">
            <div class="col-md-4">
                <div class="card position-relative text-center  border-0">
                <a class="img-wrap" href="<c:url value='/add-trade' />">
                  <img src="resources/images/transaction.png" alt="Card image cap" class="rounded-circle">
                </a>
                <div class="card-body">
                  <a href="<c:url value='/add-trade' />" class="btn btn-primary">Add Transaction</a>
                </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card position-relative text-center  border-0">
                <a class="img-wrap" href="<c:url value='/trade-list' />">
                  <img src="resources/images/order.png" alt="Card image cap" class="rounded-circle">
                </a>
                <div class="card-body">
                  <a href="<c:url value='/trade-list' />" class="btn btn-primary">Trade List</a>
                </div>
                </div>
            </div>
            <c:if test="${name == 'admin' && userId == 1}">
                <div class="col-md-4">
                    <div class="card position-relative text-center border-0">
                    <a class="img-wrap" href="<c:url value='/user-list' />">
                      <img src="resources/images/team.png" alt="Card image cap" class="rounded-circle p-3">
                      </a>
                      <div class="card-body">
                        <a href="<c:url value='/user-list' />" class="btn btn-primary">User List</a>
                      </div>
                    </div>
                </div>
            </c:if>
        </div>
