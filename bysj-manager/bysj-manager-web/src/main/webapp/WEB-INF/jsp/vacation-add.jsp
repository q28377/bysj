<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="新增请假记录" data-options="fit:true">
    <form class="vacationForm" id="vacationAddForm" name="vacationAddForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">员工编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="sid" name="sid"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">开始时间：</td>
                <td>
                    <input type="text" id="start" name="start"
                           onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',
                            minDate:'1990-01-01 00:00:00',maxDate:'2100-01-01 00:00:00'})"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">结束时间：</td>
                <td>
                    <input type="text" id="finish" name="finish"
                           onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',
                            minDate:'1990-01-01 00:00:00',maxDate:'2100-01-01 00:00:00'})"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">请假原因：</td>
                <td>
                    <textarea  id="reason" name="reason"
                               style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">审核人：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="approver" name="approver"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">是否同意：</td>
                <td>
                    <select  type="text" id="agree" name="agree" style="width:200px">
                        <option value="9">审核中</option>
                        <option value="1">同意</option>
                        <option value="0">不同意</option>
                    </select>
                </td>
            </tr>


            <tr>
                <td colspan="2">
                    <button onclick="vacationAddSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="vacationAddClearForm()" class="easyui-linkbutton" type="button"
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
    function vacationAddClearForm() {
        bysj.refreshTab('新增请假记录');
    }

    //提交表单
    function vacationAddSubmitForm(){
        if(!(flag1&&flag2)){
            $.messager.alert('警告','请输入正确格式的手机号码和电子邮箱！');
        } else{
            $('#vacationAddForm').form('submit',{
                //提交表单到item进行处理
                url: 'vacation/add',
                //在表单提交之前触发
                onSubmit:function () {
                    //如果有任意一个字段没有校验通过，返回false，不会提交表单
                    return $(this).form('validate');
                },
                //后台处理成功之后的回调函数
                success:function(data){
                    if(data > 0) {
                        $.messager.alert('温馨提示','恭喜！新增请假记录！');
                        //关闭添加页
                        bysj.closeTabs('新增请假记录');
                        //重置会受到影响的选项卡
                        if($('#tab').tabs('exists','查询请假记录')) {
                            bysj.refreshTab('查询请假记录');
                        }
                    }else{
                        $.messager.alert('警告','发生未知错误，新增请假记录失败！');
                    }
                }
            });
        }
    }
</script>