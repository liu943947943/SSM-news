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
	</head>

	<body>
		<div>
			<h3>添加紧急新闻</h3>
			<form action="查询所有.html" method="post" onsubmit="return false;">
				<table border="1">
					<tr>
						<th>新闻标题</th>
						<td><input type="text" name="title" /></td>
					</tr>
					<tr>
						<th>新闻摘要</th>
						<td>
							<input type="text" name="summary" />
						</td>
					</tr>
					<tr>
						<th>作者</th>
						<td><input type="text" name="writer" /></td>
					</tr>
					<tr>
						<th>创建时间</th>
						<td><input type="text" name="cretetime" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="添加" />&nbsp;
							<input type="reset" value="重置" /></td>
					</tr>
				</table>
			</form>
		</div>

		<script type="text/javascript">
			// 使用提交按钮的情况下，干预提交事件，发送ajax请求
			// 注意：阻止默认的提交事件
			$("form").submit(function(){
			    $.ajax({
					type:"post",
					url:"news/add.do",
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
			})

		</script>
	</body>

</html>