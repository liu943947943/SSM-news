<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>新闻</title>
	<style type="text/css">
		table td {
			text-align: center;
		}
		/*合并表格的边框*/

		table {
			width: 700px;
			border-collapse: collapse;
		}

		h3 {
			text-align: center;
		}

		div {
			margin: 0 auto;
			width: 700px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
</head>

<body>
<div>
	<h3>新闻联播</h3>
	<a href="add.jsp">添加新闻</a><br/>
	搜索新闻<input id="keyword" type="text" name="keyword" />
	<button onclick="loadData()">检索</button>
	<table border="1">

		<tr>
			<th>新闻编号</th>
			<th>新闻标题</th>
			<th>新闻摘要</th>
			<th>作者</th>
			<th>创建时间</th>
			<th>操作</th>
		</tr>

		<%--<tr>--%>
		<%--<td>1</td>--%>
		<%--<td>张三</td>--%>
		<%--<td>男</td>--%>
		<%--<td>20</td>--%>
		<%--<td>1231313123</td>--%>
		<%--<td>--%>
		<%--<a href="update.jsp">修改</a>&nbsp;--%>
		<%--<a href="#">删除</a>--%>
		<%--</td>--%>
		<%--</tr>--%>

		<tbody id="tid"></tbody>


	</table>
</div>


<script type="text/javascript">
	$(function(){
		loadData();
	})

	function loadData(){
		$.ajax({
			type:"get",
			url:"news/list.do",
			data:{keyword:$("#keyword").val()},
			dataType:"json",
			success:function(data){
				if(data.code == 1){
					// 清空子元素
					$("#tid").empty();
					var infos = data.info;
					// 循环遍历
					$(infos).each(function(){
						var html = '<tr>\n' +
								'\t\t\t\t\t<td>' + this.id + '</td>\n' +
								'\t\t\t\t\t<td>' + this.title + '</td>\n' +
								'\t\t\t\t\t<td>' + this.summary + '</td>\n' +
								'\t\t\t\t\t<td>' + this.writer + '</td>\n' +
								'\t\t\t\t\t<td>' + this.createTime + '</td>\n' +
								'\t\t\t\t\t<td>\n' +
								'\t\t\t\t\t\t<a href="comment.jsp?id=' + this.id + '">查看评论</a>&nbsp;\n' +
								'\t\t\t\t\t\t<a href="addcontent.jsp?id=' + this.id + '">评论</a>&nbsp;\n' +

								'\t\t\t\t\t\t<a href="#" onclick="delInfo(' + this.id + ');return false;">删除</a>\n' +
								'\t\t\t\t\t</td>\n' +
								'\t\t\t\t</tr>';
						// append 追加数据
						// $(html) 创建dom对象
						$("#tid").append($(html));
					})

				/*	var html = '<tr><td colspan="6"><a href="javascript:loadData(1)">首页</a>&nbsp;' +
							'<a href="javascript:loadData(' + (data.info.currentPage - 1) + ')">上一页</a>&nbsp;' +
							'<a href="javascript:loadData(' + (data.info.currentPage + 1) + ')">下一页</a>&nbsp;' +
							'<a href="javascript:loadData(' + data.info.totalPage + ')">末页</a></td></tr>';
					$("#tid").append($(html));*/


				}

			}
		})
	}

</script>

<script type="text/javascript">
	function delInfo(id){
		$.ajax({
			type:"get",
			url:"news/delete.do?id=" + id,
			dataType:"json",
			success:function(data){
				if(data.code == 1){
					loadData();
				}else{
					alert(data.info);
				}
			}
		})
	}

</script>

</body>

</html>