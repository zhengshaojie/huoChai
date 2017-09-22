<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	$.ajax({
		type:'post',
		url:"showProjectInfomation",
		data:{
			top:'6',
		},
		dataType:'json',
		success:function(data){
			showProject(data,$('#show1'))
		}
	});
	$.ajax({
		type:'post',
		url:"showProjectInfomation",
		data:{
			category:"公益",
			top:'3',
		},
		dataType:'json',
		success:function(data){
			showProject(data,$('#showCommonWeal'))
		}
	});
	$.ajax({
		type:'post',
		url:"showProjectInfomation",
		data:{
			category:"农业",
			top:'3',
		},
		dataType:'json',
		success:function(data){
			showProject(data,$('#showFarm'))
		}
	});
	$.ajax({
		type:'post',
		url:"showProjectInfomation",
		data:{
			category:"出版",
			top:'3',
		},
		dataType:'json',
		success:function(data){
			showProject(data,$('#showPublish'))
		}
	});
	$.ajax({
		type:'post',
		url:"showProjectInfomation",
		data:{
			category:"娱乐",
			top:'3',
		},
		dataType:'json',
		success:function(data){
			showProject(data,$('#showEntertainment'))
		}
	});
	$.ajax({
		type:'post',
		url:"showProjectInfomation",
		data:{
			category:"艺术",
			top:'3',
		},
		dataType:'json',
		success:function(data){
			showProject(data,$('#showArt'))
		}
	});
	
	
	
	
	
})
function showProject(data,obj) {
	var list = data.list;
	for (var i = 0; i < data.num; i++) {
	
		obj.append(
				"<div class='cardItem'>"+
				"<a href='#'>"+
				"<img width:'320px' object-fit:cover; height:'100%' src='"+list[i].image+"'>"+
				"</a>"+
				"<div class='cardBox'>"+
				"<div class='cardText'>"+
				"<a href='#'>"+list[i].name+"</a>"+
				"<p>"+list[i].describeld+"</p>"+
				"</div>"+
				"<div class='siteCardBox'>"+
				"<div class='siteCardRatio'>"+
				"<div class='siteCardRatioInner' style=width:"+parseInt((list[i].hasRaised/list[i].raiseFund)*100)+"%></div>"+
				"</div>"+
				"<div class='siteCardFData'>"+
				"<div class='ftDiv'>"+
				"<p class='ftP'>￥"+list[i].hasRaised+"</p>"+
				"<p class='scP'>已筹款</p>"+
				"</div>"+
				"<div class='scDiv'>"+
				"<p class='ftP'>18</p>"+
				"<p class='scP'>支持数</p>"+
				"</div>"+
				"<div class='thDiv'>"+
				"<p class='ftP'>"+parseInt((list[i].hasRaised/list[i].raiseFund)*100)+"%</p>"+
				"<p class='scP'>筹款进度</p>"+
				"</div>"+
			"</div>"+
				
				"</div>"+
				"</div>"
				);
	
	}
}

</script>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" style="width: 10%">
			</div>
			
			<div class="col-lg-2" style="width: 10%"></div>
			<div class="col-lg-8" style="font-size: inherit;width: 80%">
				<h3 class="indexH3">热门推荐</h3>
				<ul  class="ulstyle">
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=start">最新上线</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=公益">公益</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=农业">农业</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=出版">出版</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=娱乐">娱乐</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=艺术">艺术</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1" style="color: #50abf2;text-decoration: underline;margin-left: 15px;">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised">更多></a>
					</li>
				</ul>
				<div id="show1" style="margin: 0px;padding: 0px;width: 100%">
					
				</div>
				<div style="width: 100%">
					<a href="searchProjectInfoByCategoryld?s=筹集中" class="moreItem" >浏览更多</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" style="width: 10%">
			</div>
			<div class="col-lg-8" style="font-size: inherit;width: 80%">
				<h3 class="indexH3">公益众筹</h3>
				<ul  class="ulstyle">
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=start&c=公益">公益最新上线</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1" style="color: #50abf2;text-decoration: underline;margin-left: 15px;">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=公益">更多></a>
					</li>
				</ul>
				<div id="showCommonWeal" style="margin: 0px;padding: 0px;width: 100%">
					
				</div>
				<div style="width: 100%">
					<a href="searchProjectInfoByCategoryld?s=筹集中&c=公益" class="moreItem" >浏览更多</a>
				</div>
			</div>
			<div class="col-lg-2"style="width: 10%"></div>
			
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" style="width: 10%">
			</div>
			<div class="col-lg-8" style="font-size: inherit;width: 80%">
				<h3 class="indexH3">农业众筹</h3>
				<ul  class="ulstyle">
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=start&c=农业">农业最新上线</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1" style="color: #50abf2;text-decoration: underline;margin-left: 15px;">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=农业">更多></a>
					</li>
				</ul>
				<div id="showFarm" style="margin: 0px;padding: 0px;width: 100%">
					
				</div>
				<div style="width: 100%">
					<a href="searchProjectInfoByCategoryld?s=筹集中&c=农业" class="moreItem" >浏览更多</a>
				</div>
			</div>
			<div class="col-lg-2" style="width: 10%"></div>
			
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" style="width: 10%">
			</div>
			<div class="col-lg-8" style="font-size: inherit;width: 80%">
				<h3 class="indexH3">出版众筹</h3>
				<ul  class="ulstyle">
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=start&c=出版">出版最新上线</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1" style="color: #50abf2;text-decoration: underline;margin-left: 15px;">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=出版">更多></a>
					</li>
				</ul>
				<div id="showPublish" style="margin: 0px;padding: 0px;width: 100%">
					
				</div>
				<div style="width: 100%">
					<a href="searchProjectInfoByCategoryld?s=筹集中&c=出版" class="moreItem" >浏览更多</a>
				</div>
			</div>
			<div class="col-lg-2" style="width: 10%"></div>
			
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" style="width: 10%">
			</div>
				<div class="col-lg-8" style="font-size: inherit;width: 80%">
				<h3 class="indexH3">娱乐众筹</h3>
				<ul  class="ulstyle">
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=start&c=娱乐">娱乐最新上线</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1" style="color: #50abf2;text-decoration: underline;margin-left: 15px;">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=娱乐">更多></a>
					</li>
				</ul>
				<div id="showEntertainment" style="margin: 0px;padding: 0px;width: 100%">
					
				</div>
				<div style="width: 100%">
					<a href="searchProjectInfoByCategoryld?s=筹集中&c=娱乐" class="moreItem" >浏览更多</a>
				</div>
			</div>
			<div class="col-lg-2" style="width: 10%"></div>
			
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" style="width: 10%">
			</div>
			<div class="col-lg-8" style="font-size: inherit;width: 80%">
				<h3 class="indexH3">艺术众筹</h3>
				<ul  class="ulstyle">
					<li class="listyle1">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=start&c=艺术">艺术最新上线</a>
					</li>
					<li class="listyle2">/</li>
					<li class="listyle1" style="color: #50abf2;text-decoration: underline;margin-left: 15px;">
						<a href="searchProjectInfoByCategoryld?s=筹集中&p=hasRaised&c=艺术">更多></a>
					</li>
				</ul>
				<div id="showArt" style="margin: 0px;padding: 0px;width: 100%">
					
				</div>
				<div style="width: 100%">
					<a href="searchProjectInfoByCategoryld?s=筹集中&c=艺术" class="moreItem" >浏览更多</a>
				</div>
			</div>
			<div class="col-lg-2" style="width: 10%"></div>	
		</div>
	</div>
</body>
</html>