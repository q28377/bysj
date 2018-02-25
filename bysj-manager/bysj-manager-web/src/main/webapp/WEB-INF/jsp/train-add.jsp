<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="新增培训记录" data-options="fit:true">
    <form class="trainForm" id="trainAddForm" name="trainAddForm" method="post">
        <table style="width:100%;">

            <tr>
                <td class="label">培训记录名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="tname" name="tname"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">培训目的：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="purpose" name="purpose"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">培训开始时间：</td>
                <td>
                    <input type="text" id="start" name="start" onClick="WdatePicker()"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">培训结束时间：</td>
                <td>
                    <input type="text" id="finish" name="finish" onClick="WdatePicker()"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">负责人：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="head" name="head"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">参与人数：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="number" name="number"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>

            <tr>
                <td class="label">培训记录：</td>
                <td>
                    <textarea  id="description" name="description"
                           style="width:200px"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="trainAddSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="trainAddClearForm()" class="easyui-linkbutton" type="button"
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
    //加载权限的下拉框
    /*$('#role').combotree({
        url: 'citiesCats',
        required: true
    });*/

    //重置
    function trainAddClearForm() {
        bysj.refreshTab('新增培训记录');
    }

    //提交表单
    function trainAddSubmitForm(){
        $('#trainAddForm').form('submit',{
            //提交表单到item进行处理
            url: 'train/add',
            //在表单提交之前触发
            onSubmit:function () {
                //alert(123);
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','恭喜！新增培训记录成功！');
                    //关闭添加页
                    bysj.closeTabs('新增培训记录');
                    //重置会受到影响的选项卡
                    if($('#tab').tabs('exists','查看培训记录')) {
                        bysj.refreshTab('查看培训记录');
                    }

                }else{
                    $.messager.alert('警告','发生未知错误，新增培训记录失败！');
                }
            }
        });
    }
</script>