<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="新增工资记录" data-options="fit:true">
    <form class="payForm" id="payAddForm" name="payAddForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">员工编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="sid" name="sid"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">基本工资/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="basic" name="basic"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">饭补/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="eat" name="eat"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">房补/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="house" name="house"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">其他补助金/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="other" name="other"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">奖金/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="bonus" name="bonus"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">罚金/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="penalty" name="penalty"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="payAddSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="payAddClearForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-undo'">重置
                    </button>
                </td>
            </tr>

        </table>
    </form>
</div>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script>

    //重置
    function payAddClearForm() {
        bysj.refreshTab('新增工资记录');
    }

    //提交表单
    function payAddSubmitForm(){
        $('#payAddForm').form('submit',{
            //提交表单到item进行处理
            url: 'pay/add',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','恭喜！新增工资记录！');
                    //关闭添加页
                    bysj.closeTabs('新增工资记录');
                    //重置会受到影响的选项卡
                    if($('#tab').tabs('exists','查询工资记录')) {
                        bysj.refreshTab('查询工资记录');
                    }
                }else{
                    $.messager.alert('警告','请确认员工编号未重复且输入的金额都是数字！');
                }
            }
        });

    }
</script>