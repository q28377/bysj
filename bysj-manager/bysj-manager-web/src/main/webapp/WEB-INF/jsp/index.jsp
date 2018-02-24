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
        <div title="房源管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li data-options="attributes:{'href':'house-add'}">发布房源</li>
                <li data-options="attributes:{'href':'house-list'}">查看房源</li>
                <li data-options="attributes:{'href':'house-param-add'}">房屋规格参数管理</li>
            </ul>
        </div>
        <div title="新闻管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li data-options="attributes:{'href':'sysnews-add'}">新增系统新闻</li>
                <li data-options="attributes:{'href':'sysnews-list'}">查看系统新闻</li>
            </ul>
        </div>
        <div title="回答管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li data-options="attributes:{'href':'question-list'}">查看提问</li>
            </ul>
        </div>
        <div title="帮助中心管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">

            <ul class="easyui-tree">
                <li>
                    <span>帮助菜单管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'menu-add'}">新增菜单</li>
                        <li data-options="attributes:{'href':'menu-list'}">查看菜单</li>
                    </ul>
                </li>
                <li>
                    <span>帮助中心文档管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'doc-add'}">新增文档</li>
                        <li data-options="attributes:{'href':'doc-list'}">查看文档</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div title="城市区域管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">

            <ul class="easyui-tree">
                <li>
                    <span>城市管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'city-add'}">新增城市</li>
                        <li data-options="attributes:{'href':'city-list'}">查看城市</li>
                    </ul>
                </li>
                <li>
                    <span>区域管理</span>
                    <ul>
                        <li data-options="attributes:{'href':'regin-add'}">新增区域</li>
                        <li data-options="attributes:{'href':'regin-list'}">查看区域</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div title="索引库管理" data-options="iconCls:'icon-tip'" style="padding:10px 0;">
            <ul class="easyui-tree">
                <li data-options="attributes:{'href':'solr-add'}">一键导入索引库</li>
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
    ajhouse.registerMenuEvent();
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
