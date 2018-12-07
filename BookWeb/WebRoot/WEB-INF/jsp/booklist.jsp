<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'userlist.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div align="center">
  <form action="booklist" id="form" >
  		<input type="hidden" name="currentPageNo" value="1" id="currentPageNo"/>
  		<select name="xuanzhe">
				<option <c:if test="${xuanzhe=='书名'}" >selected="selected"</c:if>>书名</option>
				<option <c:if test="${xuanzhe=='作者'}" >selected="selected"</c:if>>作者</option>
				<option <c:if test="${xuanzhe=='出版社'}" >selected="selected"</c:if>>出版社</option>
		</select>
  		<input type="text" name="zhi" value="${zhi}"/>
  		<input type="submit" value="查询"/>
  		<a href="toAdd">新增图书</a><br/>
  	</form>
    <table border="1">
    	<tr>
    		<th>书名</th>
    		<th>作者</th>
    		<th>出版社</th>
    		<th>页数</th>
    		<th>价格</th>
    	</tr>
    	<c:forEach items="${bookList }" var="book">
    		<tr>
    			<td>${book.bookName }</td>
    			<td>${book.bookAuthor}</td>
    			<td>${book.bookPublish }</td>
    			<td>${book.bookPage }</td>
    			<td>${book.bookPrice }</td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td colspan="5" id="page">
    			<a href="javascript:viod(0);" page="1">首页</a>
    			<a href="javascript:viod(0);" page="${currentPageNo - 1 }">上一页</a>
    			<a href="javascript:viod(0);" page="${currentPageNo + 1 }">下一页</a>
    			<a href="javascript:viod(0);" page="${totalPageCount }">尾页</a>
    			第${currentPageNo }页/共${totalPageCount }页
    		</td>
    	</tr>
    </table>
  </div>
  </body>
  <script type="text/javascript" src="statics/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript">
  	$("#page a").click(function (){
  		$("#currentPageNo").val($(this).attr("page"));
  		$("#form").submit();
  	});
  </script>
</html>
