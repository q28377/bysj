<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="新增用户" data-options="fit:true">
    <form class="userForm" id="userAddForm" name="userAddForm" method="post">
        <table style="width:100%;">

            <tr>
                <td class="label">用户名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="userName" name="username"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">密码：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="password" name="password"
                           data-options="required:true" style="width:200px">
                </td>
            <tr>
                <td class="label">权限：</td>
                <td>
                    <select name="role">
                        <option value="0">普通用户</option>
                        <option value="1">管理员</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="userAddSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="userAddClearForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-undo'">重置
                    </button>
                </td>
            </tr>

        </table>
        <!--<input name="paramData" id="paramData" style="display:none;">-->
    </form>
</div>
<script>
    //加载权限的下拉框
    /*$('#role').combotree({
        url: 'citiesCats',
        required: true
    });*/

    //重置
    function userAddClearForm() {
        ajhouse.refreshTab('新增用户');
    }

    //提交表单
    function userAddSubmitForm(){
        $('#userAddForm').form('submit',{
            //提交表单到item进行处理
            url: 'user/add',
            //在表单提交之前触发
            onSubmit:function () {
                //alert(123);
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','恭喜！新增用户成功！');
                    //关闭添加页
                    ajhouse.closeTabs('新增用户');
                    //重置会受到影响的选项卡
                    if($('#tab').tabs('exists','查看用户')) {
                        /*ajhouse.closeTabs('查看城市');
                        ajhouse.addTabs('查看城市', 'city-list');*/
                        ajhouse.refreshTab('查看用户');
                    }

                }else{
                    $.messager.alert('警告','用户名重复，新增用户失败！');
                }
            }
        });
    }
</script>