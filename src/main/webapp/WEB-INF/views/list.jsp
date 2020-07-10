
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
            <!--按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
            <!--表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>id</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-info btn-sm" > <span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>编辑</button>
                                <button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash " aria-hidden="true"></span> 删除</button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
            <!--分页信息-->
        <div class="row">
            <!--分页文字信息-->
            <div class="col-md-6">
                当前第${pageInfo.pageNum}页,总共${pageInfo.pages}页，共${pageInfo.total}条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="#"> 首页</a></li>
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/emps?pageNow=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </c:if>
                        </li>
                       <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                           <c:if test="${page_Num==pageInfo.pageNum}">
                               <li class="active"><a href="#">${page_Num}</a></li>
                           </c:if>
                           <c:if test="${page_Num!=pageInfo.pageNum}">
                               <li ><a href="${pageContext.request.contextPath}/emps?pageNow=${page_Num}">${page_Num}</a></li>
                           </c:if>
                       </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/emps?pageNow=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="#">末页</a> </li>
                    </ul>
                </nav>
            </div>
    </div>
</body>
</html>
