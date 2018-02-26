<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>企业人力资源管理系统V1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
    <link rel="stylesheet" rev="stylesheet" href="css/common_member_login.css" type="text/css" />
    <link rel="icon" href="http://pages.anjukestatic.com/favicon.ico" type="image/ico"></link>
    <link rel="shortcut icon" href="http://pages.anjukestatic.com/favicon.ico"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div id="content">
    <div class="simple-header">
        <div id="header-box">
            <div class="logo"></div>
        </div>
    </div>    <!-- 内容 -->
    <div class="content-box">
        <h2 class="login-title">用户登录</h2>
        <div class="login-main">
            <div class="register_left">
                <div class="login_border clear_box">
                    <!-- 二手房登录 -->
                    <div class="login_block ershoufang" style="display: block">
                        <form method="post" action="" id="ershoufang_login" name="ershoufang_login">
                            <input type="hidden" class="" name="login_type" value="ershoufang">
                            <input type="hidden" class="" name="act" value="login">
                            <div id="p_tip" class="c_red block_tip"></div>
                            <dl class="login_form">
                                <dt>用户名</dt>
                                <dd><input type="text" name="username" id="p_username" value="" style="height:30px"
                                           class="default_color input_bg login_input220"/><span id="sp1"></span> </dd>
                                <dt>密码</dt>
                                <dd><input type="password" name="password" id="p_password" style="height:30px"
                                           class="default_color input_bg login_input220"/><span id="sp2"></span></dd>
                                <dd class="btn">
                                    <input type='submit' name="p_login" disabled="disabled" value='' id='p_login' hidefocus="true"
                                           class="login_btn gj_login_bg"/>
                                    <%--<a href="http://mendian.anjuke.com/mendian/password" target="_blank">忘记密码</a>--%>
                                </dd>
                            </dl>
                            <%--<div class="login_register">
                                <p class="word f14">还没有店长独享帐号？<a href="http://mendian.anjuke.com/mendian/apply" target="_blank">现在就申请</a></p>
                            </div>--%>
                        </form>
                    </div>
                </div>
            </div>

            <!-- 登录引导至移动下载页 -->
            <div class="login_right login_mobile">
                <img src="images/login_pho.png" alt=""/>
            </div>
            <div class="clear"></div>
        </div>
    </div>


</div>

<div id="footer">
    <p>Copyright &copy; 2010 www.anjuke.com All Rights Reserved&nbsp;<a class="footer-icp" target="_blank" href="http://www.miibeian.gov.cn">ICP号：沪 B2-20090008</a></p>
    <p>
        <a href="" rel="nofollow" hidefocus="true" target="_blank">关于我们</a>
        <em>|</em>
        <a target="_blank" href="">联系我们</a>
        <em>|</em>
        <a target="_blank" href="">用户协议</a>
    </p>
</div>
<script type="text/javascript">
    document.write(unescape("%3Cscript src='http://s.anjuke.com/aa.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    try {
        var st = new SiteTracker("anjuke");
        st.setPage("Common_Member_LoginPage");
        st.setReferer(document.referrer);
        st.setNGuid("aQQ_ajkguid");
        st.setNUid("ajk_member_id");
        st.track();
    } catch (err) {}
</script>

<%--<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>--%>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/common_member_login.js"></script>

<script>
    $(function () {
        $("#ershoufang_login").submit(function(a){
            var un=$("#p_username").val();
            var pw=$("#p_password").val();
            var flag1=false;
            var flag2=false;

            if(un==null||un==""){
                //$("#sp1").html("用户名不能为空");
                flag1=false;
            }else{
                $("#sp1").html("");
                flag1=true;
            }
            if(pw==null||pw==""){
                //$("#sp2").html("密码不能为空");
                flag1=false;
            }else{
                $("#sp2").html("");
                flag2=true;
            }
            a.preventDefault();
            if (flag1&&flag2){
                $.ajax({
                    url:'login',
                    data:{"username":un,"password":pw},
                    datatype:"json",
                    type:"post",
                    cache:false,
                    success:function(data){
                        var i=data;
                        if(i==0){
                            $("#sp1").html("用户名不能为空");
                        }else if(i==1){
                            $("#sp2").html("密码不能为空");
                        }else if(i==2||i==4){
                            alert('用户名或密码不正确');
                        }else if (i==3){
                            alert('该账号已被锁定,请联系管理员');
                        }else if (i==5||i==6){
                            alert('欢迎登录');
                            location.href="index";
                        }
                    },error:function(){
                        alert("未知错误");
                    }
                });
            }
        })
    });
</script>
</body>
</html>
