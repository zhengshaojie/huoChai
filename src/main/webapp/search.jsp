<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>火柴网-${requestScope.key}</title>
<link rel="stylesheet" 
		href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/search.css">
<script type="text/javascript" 
		src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
$(function () {
	var ca=$('#c1').find("a");
	var s=$('#s1').find("a");
	var p=$('#p1').find("a");
	
	for (var i = 0; i < ca.length; i++) {
		if ( "${requestScope.c}" == ca[i].innerHTML) {
			
			ca[i].className += " "+"cur";
		}
	}
	for (var i = 0; i < s.length; i++) {
		if ( "${requestScope.s}" == s[i].innerHTML) {
			s[i].className += " "+"cur";
		}
	}
	for (var i = 0; i < p.length; i++) {
		if ("${requestScope.p}" == p[i].innerHTML) {
			p[i].className += " "+"cur";
		}
	}
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
function split(obj,row) {

	var h = $('div').find('a.cur');
	h[row].classList.remove('cur');
	obj.className += " "+"cur";
	var p="";
	var c="";
	var s="";
	var link="";
	h = $('div').find('a.cur');
	if (h[0].innerHTML == '全部') {
		c=null;
	}else {
		c=h[0].innerHTML;
		link += "c="+c;
	}
	if (h[1].innerHTML == '全部') {
		s=null;
	}else {
		s=h[1].innerHTML;
		link += "&s="+s;
	}
	switch (h[2].innerHTML) {
	case '默认':
		p=null;
		break;
	case '最新上线':
		p='start';
		link += "&p=start";
		break;
	case '目标金额':
		p='raiseFund'
		link += "&p=raiseFund";
		break;
	default:
		p='hasRaised'
		link += "&p=hasRaised";
		;
	}
	window.location.href="searchProjectInfoByCategoryld?"+link;
	
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
					<input type="text" id="searchBox" autocomplete="off" name="key" value="农业"
								onfocus="searchModal()" onblur="cancelModal()" placeholder="农业">
				</div>
				<a href="#" id="searchBtn" onclick="sear()"></a>
			</form>
			</div>
		</div>
		<div class="col-lg-2">
		</div>
	</div>
	</div>
	<div class="listFilterBox">
		<div class="mainInnerBox">
		<c:if test="${empty requestScope.ca}">
			<div class="souSuoBox">
				<c:if test="${requestScope.msg == true}">
					<label class="siteIlB_item">很抱歉，您搜索的:&nbsp;&nbsp;&nbsp;</label>
					<span class="siteIlB_item">"${requestScope.key}"</span>
					<label class="siteIlB_item">&nbsp;&nbsp;&nbsp;没有任何项目</label>
				</c:if>
				<c:if test="${requestScope.msg != true}">
					<label class="siteIlB_item">搜索关键字:&nbsp;&nbsp;&nbsp;</label>
					<span class="siteIlB_item">"${requestScope.key}"</span>
				</c:if>
				
			</div>
		</c:if>
		<c:if test="${!empty requestScope.ca}">
			<div style="margin: 0px;padding: 0px;width: 100%;">
				<div class="listFilterItemBox">
					<label style="float: left;">行业筛选：</label>
					<div class="listFilterItemABox " id="c1" style="float: none;">
						<a href="#" onclick="split(this,0)" class="siteIlB_item btn_ALink">全部</a>
						<a href="#" onclick="split(this,0)" class="siteIlB_item btn_ALink">公益</a>
						<a href="#" onclick="split(this,0)" class="siteIlB_item btn_ALink">农业</a>
						<a href="#" onclick="split(this,0)" class="siteIlB_item btn_ALink">出版</a>
						<a href="#" onclick="split(this,0)" class="siteIlB_item btn_ALink">娱乐</a>
						<a href="#" onclick="split(this,0)" class="siteIlB_item btn_ALink">艺术</a>
					</div>
				</div>
				<div class="listFilterItemBox">
					<label>项目进程：</label>
					<div class="listFilterItemABox" id="s1" style="float: none;">
						<a href="#" onclick="split(this,1)" class="siteIlB_item btn_ALink">全部</a>
						<a href="#" onclick="split(this,1)" class="siteIlB_item btn_ALink">筹集中</a>
						<a href="#" onclick="split(this,1)" class="siteIlB_item btn_ALink">成功筹集</a>
					
					</div>
				</div>
				<div  class="listFilterItemBox">
					<label>项目排序：</label>
					<div class="listFilterItemABox" id="p1" style="float: none;">
						<a href="#" onclick="split(this,2)" class="siteIlB_item btn_ALink">默认</a>
						<a href="#" onclick="split(this,2)" class="siteIlB_item btn_ALink">最新上线</a>
						<a href="#" onclick="split(this,2)" class="siteIlB_item btn_ALink">目标金额</a>
						<a href="#" onclick="split(this,2)" class="siteIlB_item btn_ALink">筹资额</a>
						
						
					</div>
				</div>
			</div>
		</c:if>
		</div>
		
	</div>
	<div class="mainInnerBox">
		<c:if test="${empty requestScope.catrgroy}">
			<c:if test="${requestScope.msg == true}">
					<div style="font-size: 20px;margin-top: 10px;">您可能对以下项目感兴趣：</div>
			</c:if>
		</c:if>
		<div class="souSuoListBox">
		<c:forEach items="${requestScope.list }" var="list">
		
			<div class="ssCardItem">
				<a href="#" class="siteCardItemImgA">
					<img  src='${list.image}'>
				</a>
				<div class="ssCardICBox">
					<div class="ssCardICText"> 
						<h3>
						<a href="#" class="siteCardICH3">${list.name }</a>
						</h3>
						<p class="siteCardIC_p">${list.describeld}</p>
					</div>
					<div class="siteCardFBox">
						<div class="siteCardRatio">
							 
							<div style="background-color: #50abf2;width:
							<fmt:formatNumber type="number" value="${(list.hasRaised/list.raiseFund)*100}" maxFractionDigits="0"/>%
							;height: 6px;"></div>
						</div>
						<div class="siteCardFData">
							<div class="ftDiv">
								<p class="ftP">￥${list.hasRaised }</p>
								<p class="scP">已筹款</p>
							</div>
							<div class="scDiv">
								<p class="ftP">39</p>
								<p class="scP">支持数</p>
							</div>
							<div class="thDiv">
								<p class="ftP">
								<fmt:formatNumber type="number" value="${(list.hasRaised/list.raiseFund)*100}" maxFractionDigits="0"/>%
								</p>
								<p class="scP">筹款进度</p>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			</c:forEach>
		</div>
	
	</div>
</body>
</html>