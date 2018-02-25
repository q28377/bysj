<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <!-- 导入easyui的样式表 -->
    <link rel="stylesheet" href="js/jquery-easyui-1.5/themes/bootstrap/easyui.css">
    <link rel="stylesheet" href="js/jquery-easyui-1.5/themes/icon.css">
    <link rel="stylesheet" href="css/common.css">
</head>
<body class="easyui-layout">
<div style="height:120px;padding-left:10px;" data-options="region:'north'" >
    <div style="border-bottom: solid 5px cyan;">
        <img src="images/agency_logo.png" style="width: 400px;height: 50px;margin-left: 100px;">
        <a href="#" onclick="javaScript:checkLogout()"><img src="images/sys-logout.png" style="float: right;margin-right: 50px;margin-top: 10px;"></a>
    </div>
    <div>
        <p id="datetime" style="margin-right: 50px;font-weight: 600;font-size: large; float: right" ></p>
    </div>
</div>
<div data-options="region:'south'" style="padding:5px;background-color: #4cae4c;">
    系统版本：V2.0
</div>
<div data-options="region:'west'" style="width:200px;">
    <div id="menu" class="easyui-accordion" style="opacity: 0.9">
        <div title="用户管理" data-options="selected:true,iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li>
                    <span>普通用户管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'user-list'}">查询用户</li>
                    </ul>
                </li>
                <li>
                    <span>管理员管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'user-list2'}">查询用户</li>
                        <li data-options="attributes:{'href':'user-add'}">新增用户</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div title="人事管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li>
                    <span>部门管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'department-list'}">查询部门</li>
                        <li data-options="attributes:{'href':'department-add'}">新增部门</li>
                    </ul>
                </li>
                <li>
                    <span>员工管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'staff-list'}">查询员工</li>
                        <li data-options="attributes:{'href':'staff-add'}">新增员工</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div title="薪资管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">

            </ul>
        </div>
        <div title="考勤管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li data-options="attributes:{'href':'vacation-list'}">查询请假记录</li>
                <li data-options="attributes:{'href':'vacation-add'}">新增请假记录</li>
            </ul>
        </div>
        <div title="培训管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li data-options="attributes:{'href':'train-list'}">查询培训记录</li>
                <li data-options="attributes:{'href':'train-add'}">新增培训记录</li>
            </ul>
        </div>
    </div>
</div>

<div data-options="region:'center'" style="background:#eee;">
    <div id="tab" class="easyui-tabs" data-options="fit:true">
        <div title="欢迎页面" style="padding:20px;">
            <img style="width: 1000px;height: 400px" src="images/bg.jpg"/>
        </div>
    </div>
</div>
<!-- jquery -->
<script src="js/jquery-easyui-1.5/jquery.min.js"></script>
<!-- jquery easyui -->
<script src="js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script src="js/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<%--引入日期处理库--%>
<script src="js/moment/moment-with-locales.js"></script>
<script>
    moment.locale('zh-cn');
</script>


<!-- ueditor配置文件 -->
<script type="text/javascript" src="js/ueditor/ueditor.config.js"></script>
<!-- ueditor编辑器源码文件 -->
<script type="text/javascript" src="js/ueditor/ueditor.all.js"></script>
<!-- 自定义脚本 -->
<script src="js/common.js"></script>




<!-- 自定义js -->
<script>
    bysj.registerMenuEvent();
</script>

<script>
    var time=new Date();
    $('#datetime').html(moment(time).format('YYYY 年 MM 月 DD 日 dddd a H : mm : ss'));
    function getdate() {
        var time=new Date();

        $('#datetime').html(moment(time).format('YYYY 年 MM 月 DD 日 dddd a H : mm : ss'));
    }
    window.setInterval(function(){getdate()},1000);

</script>
<script type="text/javascript">
    function checkLogout() {
        var flag=confirm("确定退出吗");
        if(flag){
            top.location.href="logout";
        }
    }
</script>
</body>
</html>
