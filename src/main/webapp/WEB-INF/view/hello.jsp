<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<% String path = request.getContextPath(); 
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
   pageContext.setAttribute("basePath",basePath);
   pageContext.setAttribute("path",path);
%> 

<html>
<body>
<h2>path-------:${pageScope.path}</h2>
<h2>basePath---:${pageScope.basePath}</h2>

</body>
</html>