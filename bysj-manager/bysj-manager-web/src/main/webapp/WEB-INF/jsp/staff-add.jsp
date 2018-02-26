<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="新增员工" data-options="fit:true">
    <form class="staffForm" id="staffAddForm" name="staffAddForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">所属部门：</td>
                <td>
                    <input id="did" name="did" data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">员工姓名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="name" name="name"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">员工性别：</td>
                <td>
                    <select  type="text" id="gender" name="gender" style="width:200px">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">员工出生日期：</td>
                <td>
                    <input type="text" id="brith" name="brith" onClick="WdatePicker()"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">手机号码：</td>
                <td>
                    <input type="text" id="telephone" name="telephone"
                           style="width:200px" onblur="telCheck()">
                    <span id="tel" style="color: red"></span>
                </td>
            </tr>
            <tr>
                <td class="label">电子邮箱：</td>
                <td>
                    <input type="text" id="email" name="email"
                            style="width:200px" onblur="emailCheck()">
                    <span id="em" style="color: red"></span>
                </td>
            </tr>
            <tr>
                <td class="label">学历：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="education" name="education"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">毕业学校：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="school" name="school"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">籍贯：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="nativeplace" name="nativeplace"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">住址：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="address" name="address"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">职称：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="position" name="position"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <%--<tr>
                <td class="label">总工资/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="pay" name="pay"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>--%>
            <tr>
                <td class="label">入职日期：</td>
                <td>
                    <input type="text" id="join" name="join" onClick="WdatePicker()"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">合同到期日期：</td>
                <td>
                    <input type="text" id="exit" name="exit" onClick="WdatePicker()"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">合同编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="contract" name="contract"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">其他信息：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="other" name="other"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>


            <tr>
                <td colspan="2">
                    <button onclick="staffAddSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="staffAddClearForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-undo'">重置
                    </button>
                </td>
            </tr>

        </table>
        <!--<input name="paramData" id="paramData" style="display:none;">-->
    </form>
</div>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script>
    //手机号码与邮箱的校验
    var flag1=true;
    var flag2=true;
    function telCheck(){
        var rule="^1[3|4|5|7|8][0-9]\\d{4,8}$";
        if($("#telephone").val()!=""){
            //alert('校验');
            if(!$("#telephone").val().match(rule)){
                $("#tel").html("手机号码格式不正确!");
                flag1=false;
            }else{
                $("#tel").html("");
                flag1=true;
            }
        }else {
            $("#tel").html("");
            flag1=true;
        }
    }
    function emailCheck(){
        var rule="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        if($("#email").val()!=""){
            //alert('校验');
            if(!$("#email").val().match(rule)){
                $("#em").html("电子邮箱格式不正确!");
                flag2=false;
            }else{
                $("#em").html("");
                flag2=true;
            }
        }else{
            $("#em").html("");
            flag2=true;
        }
    }

    //加载所属部门的下拉框
    $('#did').combotree({
        url: 'department/all',
        required: true
    });

    //重置
    function staffAddClearForm() {
        bysj.refreshTab('新增员工');
    }

    //提交表单
    function staffAddSubmitForm(){
        if(!(flag1&&flag2)){
            $.messager.alert('警告','请输入正确格式的手机号码和电子邮箱！');
        } else{
            $('#staffAddForm').form('submit',{
                //提交表单到item进行处理
                url: 'staff/add',
                //在表单提交之前触发
                onSubmit:function () {
                    //如果有任意一个字段没有校验通过，返回false，不会提交表单
                    return $(this).form('validate');
                },
                //后台处理成功之后的回调函数
                success:function(data){
                    if(data > 0) {
                        $.messager.alert('温馨提示','恭喜！新增员工！');
                        //关闭添加页
                        bysj.closeTabs('新增员工');
                        //重置会受到影响的选项卡
                        if($('#tab').tabs('exists','查询员工')) {
                            bysj.refreshTab('查询员工');
                        }
                    }else{
                        $.messager.alert('警告','发生未知错误，新增员工失败！');
                    }
                }
            });
        }
    }
</script>