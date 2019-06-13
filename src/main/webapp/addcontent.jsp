<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>添加新闻</title>
    <style type="text/css">
        table {
            width: 300px;
            border-collapse: collapse;
        }

        h3 {
            text-align: center;
        }

        div {
            margin: 0 auto;
            width: 300px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
</head>

<body>
<div>
    <h3>添加新闻信息</h3>
    <form id="myform" action="查询所有.html" method="post" onsubmit="return false;">
        <table border="1">
            <tr>
                <th>评论内容</th>
                <td><input type="textarea" name="content" /></td>
            </tr>
            <%--<tr>
                <th></th>
                <td>
                    <input type="radio" name="sex" value="男" />男
                    <input type="radio" name="sex" value="女" />女
                </td>
            </tr>--%>
           <%-- <tr>
                <th>新闻摘要</th>
                <td><input type="text" name="" /></td>
            </tr>--%>
            <tr>
                <th>评论人</th>
                <td><input type="text" name="author" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交" />&nbsp;
                    <a href="list.jsp">返回</a></td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function(){

        $("#myform").validate({
            // 处理提交操作
            submitHandler:function() {
                $.ajax({
                    type:"post",
                    url:"add.do?id=${param.id}",
                    data:$("form").serialize(),
                    dataType:"json",
                    success:function(data){  //{code:1,info:....}
                        if(data.code == 1){
                            window.location.href = "list.jsp";
                        }else{
                            alert(data.info);
                        }
                    }
                })
                return false;
            }
            // 验证规则

            //  验证不通过时，提示信息

        })


    })

</script>
<script type="text/javascript">
    // 使用提交按钮的情况下，干预提交事件，发送ajax请求
    /*	// 注意：阻止默认的提交事件
     $("form").submit(function(){
     $.ajax({
     type:"post",
     url:"add.do",
     data:$("form").serialize(),
     dataType:"json",
     success:function(data){  //{code:1,info:....}
     if(data.code == 1){
     window.location.href = "list.jsp";
     }else{
     alert(data.info);
     }
     }
     })
     //return false;
     })*/

</script>
</body>

</html>