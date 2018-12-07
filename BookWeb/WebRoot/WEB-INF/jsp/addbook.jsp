<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addbook.jsp' starting page</title>
    
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
    <form method="post" action="addBook">
			<table border="1">
				<tr>
					<td align="center" colspan="2" height="30px" style="font-weight: bold"><h1>添加新书</h1></td>
				</tr>
				
				<tr>
					<td width="100px" height="30px" style="font-weight: bold">书名</td>
					<td width="300px" align="left"><input type="text" name="bookName"/></td>
				</tr>
				
				<tr>
				    <td width="100px" height="30px" style="font-weight: bold">作者</td>
					<td width="300px" align="left"><input type="text" name="bookAuthor" /></td>
	
				</tr>
				
				<tr>
					<td width="100px" height="30px" style="font-weight: bold">出版社</td>
					<td width="300px" align="left"><input type="text" name="bookPublish"/></td>
				</tr>
				
				<tr>
					<td width="100px" height="30px" style="font-weight: bold">页数</td>
					<td width="300px" align="left"><input type="text" name="bookPage"/></td>
				</tr>
				<tr>
					<td width="100px" height="30px" style="font-weight: bold">价格</td>
					<td width="300px" align="left"><input type="text" name="bookPrice"/></td>
				</tr>
				<tr align="center" >
					<td colspan="2">
						<input type="submit" name="" value="提交"/>
					    <input type="reset" name="" value="重置"/>
					</td>
				</tr>
		   </table>
		</form>
    </div>
  </body>
</html>
