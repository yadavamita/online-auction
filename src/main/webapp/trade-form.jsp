<%@include file="base.jsp" %>
    <a href="dashboard.jsp" class="btn btn-success" style="float:right; margin-right:50px; margin-top:50px;"> Back</a>
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-3">
                <div class="wrapper" style="margin-top:100px;">
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