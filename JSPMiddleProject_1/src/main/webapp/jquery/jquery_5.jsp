<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('h3:eq(0)').css("color","red")
	$('h3:eq(1)').css("color","green")
	$('h3:eq(2)').css("color","yellow")
})
</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>eq : 0번 부터</h1>
	<h3>Hello JQuery1</h3>
	<h3>Hello JQuery2</h3>
	<h3>Hello JQuery3</h3>
</body>
</html>