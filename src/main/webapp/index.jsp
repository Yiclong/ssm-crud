<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--update model--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" >修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateEmpForm" >
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empUpdateEmpName" name="empName">zhansan</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio"  id="empUpdateGender1" name="gender" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio"  id="empUpdateGender2" name="gender" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empUpdateEmail" name="email"  placeholder="请输入邮箱">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="empUpdateDeptId_deptNameSelect" name="dId">
                                <option>1</option>
                                <option>2</option>

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="empUpdateSaveBtn">更新</button>
            </div>
        </div>
    </div>
</div>
<!--  add Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="empInfoForm">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName" name="empName"  placeholder="请输入姓名">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio"  id="empGender1" name="gender" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio"  id="empGender2" name="gender" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empEmail" name="email"  placeholder="请输入邮箱">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="empDeptId_deptNameSelect" name="dId">
                                <option>1</option>
                                <option>2</option>

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="empSaveBtn">添加</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
        <!--按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id='addEmp'>新增</button>
                <button class="btn btn-danger" id='delEmp'>删除</button>
            </div>
            <!--表格数据-->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover" id="emps_table">
                        <tr>
                            <th><input type="checkbox" class="all_check">全选</th>
                            <th>id</th>
                            <th>姓 名</th>
                            <th>性 别</th>
                            <th>邮 箱</th>
                            <th>部 门</th>
                            <th>操 作</th>
                        </tr>
                        <tbody id="emps_info">
                        <tr>
                            <th>1</th>
                            <th>xiaohong</th>
                            <th>nan</th>
                            <th>2289290@qq.com</th>
                            <th>dept</th>
                            <th>操作</th>
                        </tr>
                        </tbody>


                    </table>
                </div>
                <!--分页信息-->
                <div class="row">
                    <!--分页文字信息-->
                    <div class="col-md-6" id="page_info_area">
                        当前第 1 页,总共 50 页，共 300 条记录
                    </div>
                    <div class="col-md-6" id="page_nav_area">
                        <%--<nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="#"> 首页</a></li>
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                    <li ><a href="#">1</a></li>
                                    <li ><a href="#">2</a></li>
                                    <li ><a href="#">3</a></li>
                                    <li ><a href="#">4</a></li>
                                    <li ><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">末页</a> </li>
                            </ul>
                        </nav>--%>
                    </div>
                </div>

</body>
<script type="text/javascript">
    var currentPage;
    $(function () {
        toPage(1);
    })

    function toPage(pageNow) {
        $.ajax({
            url: "emp",
            data: {"pageNow": pageNow},
            success: function (data) {
                buildEmpsTable(data);
                buildPageInfo(data);
                buildPageNav(data);
            }
        })
    }

    function buildEmpsTable(result) {
        var emp = result.data.list;
        var empinfo = "";
        $.each(emp, function (index, item) {
            var gender = item.gender == 'M' ? '男' : '女';
            var operat =
                "                    <button class=\"btn btn-info btn-sm edit_btn\" editId='"+item.empId+"' > <span class=\"glyphicon glyphicon-pencil \" aria-hidden=\"true\"></span>编辑</button>\n" +
                "                    <button class=\"btn btn-danger btn-sm delete_btn\" editId='"+item.empId+"'><span class=\"glyphicon glyphicon-trash \" aria-hidden=\"true\"></span> 删除</button>\n";
            empinfo += '<tr><th><input type="checkbox" class="Radio_check"></th>' +
                '<th>' + item.empId + '</th>\n' +
                '<th>' + item.empName + '</th>\n' +
                '<th>' + gender + '</th>\n' +
                '<th>' + item.email + '</th>\n' +
                '<th>' + item.department.deptName + '</th>\n' +
                '<th>' + operat + '</th></tr>';

        })
        $("#emps_info").html(empinfo);
    }

    function buildPageInfo(result) {
        var emp = result.data;
        $("#page_info_area").html("当前第 " + emp.pageNum + " 页,总共 " + emp.pages + " 页，共 " + emp.total + " 条记录");
        currentPage=emp.pageNum;
    }

    function buildPageNav(result) {
        var pageNavnums = result.data.navigatepageNums;
        var prevPage = "";
        if (result.data.hasPreviousPage == true) {
            prevPage += " <li onclick='toPage(" + (result.data.pageNum - 1) + ")'>\n" +
                "                            <a href=\"#\" aria-label=\"Previous\">\n" +
                "                                <span aria-hidden=\"true\">&laquo;</span>\n" +
                "                            </a>\n" +
                "                        </li>\n";
        }
        var nextPage = "";
        if (result.data.hasNextPage == true) {
            nextPage += " <li onclick='toPage(" + (result.data.pageNum + 1) + ")'>\n" +
                "                            <a href=\"#\" aria-label=\"Next\">\n" +
                "                                <span aria-hidden=\"true\">&raquo;</span>\n" +
                "                            </a>\n" +
                "                        </li>\n";

        }
        var pageNav = "";
        $.each(pageNavnums, function (index, item) {
            if (result.data.pageNum == item) {
                pageNav += "<li class='active' onclick='toPage(" + item + ")'><a>" + item + "</a></li>";
            } else {
                pageNav += "<li onclick='toPage(" + item + ")'><a>" + item + "</a></li>";
            }
        })
        var pageNavinfo = "";
        pageNavinfo += "<nav aria-label=\"Page navigation\">\n" +
            "                    <ul class=\"pagination\">\n" +
            "                        <li onclick='toPage(" + 1 + ")'><a href=\"#\"> 首页</a></li>\n" +
            prevPage +
            pageNav +
            nextPage +
            "                        <li onclick='toPage(" + result.data.pages + ")'><a href=\"#\">末页</a> </li>\n" +
            "                    </ul>\n" +
            "                </nav>";
        $("#page_nav_area").html(pageNavinfo);
    }
    function resetEmpFormInfo(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }
    $("#addEmp").click(function () {
        resetEmpFormInfo("#empInfoForm");
        var deptName="";
        getDept("#empDeptId_deptNameSelect");

        $("#empAddModal").modal({
            backdrop: "static"
        })
    })
    function getDept(ele){
        var deptName="";
        $.ajax({
            url: "depts",
            success:function (data) {
                $.each(data.data,function () {
                    deptName+="<option value='"+this.deptId+"'>"+this.deptName+"</option>";
                })
                $(ele).html(deptName);
            }
        })
    }
    function validate(){
        var empName=$("#empName").val();
        var regName=/(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            tipInfo("#empName",false,"姓名不符合规则");
            return false;
        }else{
             tipInfo("#empName",true," ");
            return true;
        }
        var empEmail=$("#empEmail").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regEmail.test(empEmail)){
            tipInfo("#empEmail",false,"邮箱不符合规则");
            return false;
        }else{
            tipInfo("#empEmail",true," ");
            return true;
        }

    }
    function tipInfo(tag,flag,msg){
        $(tag).parent().removeClass("has-success has-error");
        $(tag).next("span").text("");
        if(flag){
            $(tag).parent().addClass("has-success");
            $(tag).next("span").text(msg)
        }else{
            $(tag).parent().addClass("has-error");
            $(tag).next("span").text(msg)
        }
    }
    $("#empName").change(function () {
        if(validate()==true){
            $.ajax({
                url:"checkEmpName",
                data:{"empName":this.value},
                success:function (data) {
                    if(data.flag){
                        tipInfo("#empName",true,"用户名可用");
                        $("#empSaveBtn").attr("ajax-va","success");
                    }else{
                        tipInfo("#empName",false,"用户名已经被使用");
                        $("#empSaveBtn").attr("ajax-va","error");
                    }
                }
            })
        }else{
            tipInfo("#empName",false,"姓名不合法!");
        }

    })
    $("#empSaveBtn").click(function () {
        //if(validate()&&($(this).attr("ajax-va")=="success")){
         if($(this).attr("ajax-va")=="success"){
            var emp=$("#empInfoForm").serialize();
            $.ajax({
                url:"emp",
                type:"POST",
                data:emp,
                success:function (data) {
                    if(data.code==100){
                        $("#empAddModal").modal("hide");
                        toPage(99999);
                    }else{
                        console.log(data);
                    }
                }
            })
        }else{
            alert("添加失败");
        }
    })
    $(document).on("click",".edit_btn",function () {
        getDept("#empUpdateDeptId_deptNameSelect");

        $("#empUpdateModal").modal({
            backdrop: "static"
        });
       getEmp($(this).attr("editId"));
       $("#empUpdateSaveBtn").attr("editId",$(this).attr("editId"))

    })
    function getEmp(id) {
        $.ajax({
            url:"emp/"+id,
            success:function (data) {
                var emp=data.data;
                $("#empUpdateEmpName").html(emp.empName);
                $("#empUpdateEmail").val(emp.email);
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val(emp.dId);

            }
        })

    }
    $("#empUpdateSaveBtn").click(function () {
        var empEmail=$("#empUpdateEmail").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regEmail.test(empEmail)){
            tipInfo("#empUpdateEmail",false,"更新的邮箱不符合规则");
            return false;
        }else {
            tipInfo("#empUpdateEmail", true, " ");
        }
        $.ajax({
            url: "emp/" + $(this).attr("editId"),
            type: "PUT",
            data: $("#updateEmpForm").serialize(),//+"&_method=PUT"
            success: function (data) {
                $("#empUpdateModal").modal('hide');
                toPage(currentPage);
            }
        })

    })
    $(document).on("click",".delete_btn",function () {
      var empName= $(this).parents("tr").find("th:eq(2)").text();
      if(confirm("确定删除"+empName+"吗？")){
          $.ajax({
              url:"emp/"+$(this).attr("editid"),
              type:"DELETE",
              success: function (data) {
                toPage(currentPage);
              }
          })
      }
    })
    $(".all_check").click(function () {
        //不使用attr（获取自定义属性），prop修改和读取prop原生属性
        $(".Radio_check").prop("checked",$(this).prop("checked"))
    })
    $(document).on("click",".Radio_check",function () {
        var flag=$(".Radio_check:checked").length==$(".Radio_check").length;
        $(".all_check").prop("checked",flag);
    })
    $("#delEmp").click(function () {
        var EmpNameList="";
        var empIdList="";
        $.each($(".Radio_check:checked"),function () {
            EmpNameList+=$(this).parents("tr").find("th:eq(2)").text()+",";
            empIdList+=$(this).parents("tr").find("th:eq(1)").text()+",";

        })
        EmpNameList=EmpNameList.substring(0,EmpNameList.length-1);
        if(confirm("确认"+EmpNameList+"删除吗？")){
            $.ajax({
                url:"emp/"+empIdList,
                type:"DELETE",
                success: function (data) {
                   toPage(currentPage);
                }
            })
        }

    })

</script>
</html>
