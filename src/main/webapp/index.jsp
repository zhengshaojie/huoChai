<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>火柴网</title>
<link rel="stylesheet" 
		href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/index.css">
<script type="text/javascript" 
		src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
$(function () {
	
})
function showLink() {
	$('#link').css("display","block");
}
function hiddenLink() {
	$('#link').css("display","none");
}
function searchModal() {
	$('#search').css("width","300px");
	$('#search').css("border","1px solid #56aef2");
	$('#search').css("background","white");
	$('#searchBtn').css("background","url('img/search1.png')");

	
} 
function cancelModal() {
	$('#search').css("width","140px");
	$('#search').css("border","1px solid #ececec");
	$('#search').css("background","#ececec");
	$('#searchBtn').css("background","url('img/search.png')");

}
function sear() {
	document.getElementById('from1').submit();
}
</script>
<body>
	<div class="container-fluid" style="height: 35px; background-color: #313539;">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8" style=" height: 35px;">
				<div>官方咨询电话 <span>15902380132</span></div>
				<div class="top-right" style="float: right;">
					<div style="display:inline;">
						微信公众号
					</div>
					<a href="#">意见反馈</a>
					<a href="#">帮助中心</a>
					
				</div>
			</div>
			<div class="col-lg-2">
			</div>
		</div>
	</div>
	<div class="container-fluid" style="height: 70px; border-bottom: 1px solid #eee;">
	<div class="row">
		<div class="col-lg-2" >
		</div>
		<div class="col-lg-8">
			<a href="index.jsp" style="float: left;width: 160px; padding-top: 12px;padding-bottom: 12px;">
				<img src="${pageContext.request.contextPath}/img/logo.png" width="90%" height="46px">
			</a>
			<div style="float: left;">
				<div class="top1">
					<a href="index.jsp" >首&nbsp;&nbsp;页</a>
				</div>
				<div class="top1">
					<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised" >奖励众筹</a>
				</div>
				<div class="top1">
					<a href="#" >公益众筹</a>
				</div>
			</div>
			<a href="#" id="btn1">发起众筹</a>
			
			<!-- 登录状态 start -->
			<div  class="siteHCountBox" style="float: right; margin-top: 17px;" onmouseover="showLink()" onmouseleave="hiddenLink()"> 
			<div class="index-header">
				<img src="火柴网/头像/头像1.jpg">
			</div>
			<div class="siteHCountInner1" id="link">
				<a href="#">我的订单</a>
				<a href="#">我的关注</a>
				<a href="#">我的发起</a>
				<a href="#">消息</a>
				<a href="#">设置</a>
				<a href="#">退出</a>
			</div>
				
			</div>
			
			<!-- 登录状态 start -->
			<!-- 未登录状态 start -->
			<div class="no-login" style="float: right;margin-top: 20px; display: none;">
				<a href="#">登录</a>
				<span class="line"></span>
				<a href="#">注册</a>	
			</div>
			<!-- 未登录状态 end -->
			
			
			<div class="searchModal"  id="search" style="float: right;margin-top: 20px;"  >
			<form action="searchProjectInfoByKey" method="get" id="from1">
				<div style="margin: 4px 28px 0 5px;height: 20px; line-height: 20px;">
					<input type="text" id="searchBox" autocomplete="off" name="key"
								onfocus="searchModal()" onblur="cancelModal()"  placeholder="农业" value="农业">
				</div>
				<a href="#" id="searchBtn" onclick="sear()"></a>
			</form>
			</div>
		</div>
		<div class="col-lg-2">
		</div>
	</div>
	</div>
	<div class="container-fluid" id="show" style="width: 100%">
		<jsp:include page="show.jsp" ></jsp:include>
	</div>
	
	
	
		
</body>
</html>