<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="../../js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../../js/jquery.ztree.core.js"></script>
<link rel="stylesheet" href="../../css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet" href="../../css/demo.css" type="text/css">
<link rel="stylesheet" href="../../static/layui/css/layui.css"
	rel="stylesheet">
<script src="../../js/calendar.js"></script>
<script>
var num = 1;
function AddKeyword(obj){
	if($(obj).val() != ""){
		num = num + 1;
		$("#keywordDiv"+num).show();
	}
}
</script>
<%@ include file="demand_menu.jsp"%>
<div class="tpl-body">
	<div class="tpl-show">
		<div class="tpl-sub-header">
			<!--面包屑-->
			<!--{include file="public/tpl-crumbs"/}-->
			<div class="crumbs">
				<a href="#">添加需求</a> <i>/</i>
			</div>
		</div>
		<div class="tpl-fluid">
			<div class="tpl-pannel">
				<h1>欢迎来到河北省重大需求征集系统</h1>
			</div>
		</div>
	</div>
</div>
<!--侧边栏-->
<!--{include file="public/tpl-right-bar"/}-->
<div class="tpl-right-bar">
	<div class="tpl-right-bar-show">
		<div class="tpl-card">
			<div class="tpl-card-head">配色方案</div>
			<div class="tpl-card-body">
				<ul class="theme-list">
					<li class="theme-item" theme-id="1">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444444"></div>
						<div class="theme-side" style="background-color: #20222A"
							bg="#20222A" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #20222A"
								bg="#20222A" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="2">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444444"></div>
						<div class="theme-side" style="background-color: #50314F"
							bg="#50314F" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #50314F"
								bg="#50314F" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="3">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #333f58"
							bg="#333f58" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #1E9FFF"
								bg="#1E9FFF" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="4">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #2e9688"
							bg="#2e9688" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #2e9688"
								bg="#2e9688" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="5">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #20222a"
							bg="#20222a" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #f78400"
								bg="#f78400" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="6">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #242d38"
							bg="#242d38" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #AA3130"
								bg="#AA3130" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="7">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #20222a"
							bg="#20222a" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #3A3D49"
								bg="#3A3D49" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="8">
						<div class="theme-head" style="background-color: #2F9688"
							bg="#2F9688" color="#ffffff"></div>
						<div class="theme-side" style="background-color: #20222a"
							bg="#20222a" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #226A62"
								bg="#226A62" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="9">
						<div class="theme-head" style="background-color: #393d49"
							bg="#393d49" color="#ffffff"></div>
						<div class="theme-side" style="background-color: #20222a"
							bg="#20222a" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #20222a"
								bg="#20222a" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="10">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#4f4f4f"></div>
						<div class="theme-side" style="background-color: #ad5fcf"
							bg="#ad5fcf" color="rgba(255,255,255,.8)">
							<div class="theme-logo" style="background-color: #20222A"
								bg="#20222A" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="11">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #20222A"
							bg="#20222A" color="#b91a1a">
							<div class="theme-logo" style="background-color: #20222A"
								bg="#20222A" color="#b91a1a"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="12">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#444"></div>
						<div class="theme-side" style="background-color: #0a5541"
							bg="#0a5541" color="#eda438">
							<div class="theme-logo" style="background-color: #20222A"
								bg="#20222A" color="rgba(255,255,255,.8)"></div>
						</div>
					</li>
					<li class="theme-item" theme-id="13">
						<div class="theme-head" style="background-color: #ffffff"
							bg="#ffffff" color="#626262"></div>
						<div class="theme-side" style="background-color: #f44336"
							bg="#f44336" color="#fbfbfb">
							<div class="theme-logo" style="background-color: #f44336"
								bg="#f44336" color="#fbfbfb"></div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
<script src="../../layuiadmin/layui/layui.js"></script>
<script src="../../static/js/app.js"></script>

</body>
</html>