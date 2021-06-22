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
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">机构全称</label>
						<div class="layui-input-block">
							<input type="text" name="name" value="${main.name }"  disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">归口管理部门</label>
						<div class="layui-input-block">
							<input type="text" name="gk" value="${main.gk }" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">通讯地址</label>
						<div class="layui-input-block">
							<input type="text" name="address" value="${main.address }" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">所在地域</label>
						<div class="layui-input-block">
							<input type="text" name="area" value="${main.area }" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">网址</label>
							<div class="layui-input-inline">
								<input type="text" name="website" value="${main.website }" disabled class="layui-input">
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">电子邮箱</label>
							<div class="layui-input-inline">
								<input type="text" name="email" value="${main.email }" disabled class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">法人代表</label>
							<div class="layui-input-inline">
								<input type="text" name="lperson" value="${main.lperson }" disabled class="layui-input">
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">邮政编码</label>
							<div class="layui-input-inline">
								<input type="text" name="post" value="${main.post }" disabled class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">联系人</label>
							<div class="layui-input-inline">
								<input type="text" name="contact" value="${main.contact }" disabled class="layui-input">
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">固定电话</label>
							<div class="layui-input-inline">
								<input type="text" name="phone" value="${main.phone }" disabled class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">手机</label>
							<div class="layui-input-inline">
								<input type="text" name="mobile" value="${main.mobile }" disabled class="layui-input">
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">传真</label>
							<div class="layui-input-inline">
								<input type="text" name="fax" value="${main.fax }" disabled class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构属性</label>
						<div class="layui-input-block">
							<input type="text" name="attract" value="${main.attract }" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">机构简介</label>
						<div class="layui-input-inline">
							<input type="text" name="introduction" value="${main.introduction }" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技术需求名称</label>
						<div class="layui-input-inline">
							<input type="text" name="techdemand" value="${main.techdemand }" disabled class="layui-input">
						</div>
						<label class="layui-form-label">需求年限</label>
						<div class="layui-input-inline">
							<input type="text" name="begin" value="${main.begin }年" disabled class="layui-input">
						</div>
						<label class="layui-form-label"
							style="width: 30px; text-align: center">——</label>
						<div class="layui-input-inline">
							<input type="text" name="end" value="${main.end }年" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">主要问题</label>
						<div class="layui-input-inline">
							<textarea cols="100" maxlength="500" name="main" disabled
								class="layui-textarea">${main.main }</textarea>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">技术关键</label>
						<div class="layui-input-inline">
							<textarea cols="100" maxlength="500" name="key" disabled
								class="layui-textarea">${main.key }</textarea>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">预期目标</label>
						<div class="layui-input-inline">
							<textarea cols="100" maxlength="500" name="expect" disabled
								class="layui-textarea">${main.expect }</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">关键字</label>
						<div class="layui-input-block">
							<input type="text" name="keyword" value="${main.keyword }" disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">拟投入资金总额</label>
						<div class="layui-input-inline">
							<input type="text" name="totalsum" value="${main.totalsum }" disabled class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux">万元</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技术需求解决方式</label>
						<div class="layui-input-block">
							<input type="text" name="fix" value="${main.fix }" disabled class="layui-input">
						</div>
					</div>
					<c:if test="${main.fix eq '合作研发' }">
						<div class="layui-form-item">
							<label class="layui-form-label">合作意向单位</label>
							<div class="layui-input-block">
								<input type="text" name="coinstitution" value="${main.coinstitution }" disabled class="layui-input">
							</div>
						</div>
					</c:if>
					<div class="layui-form-item">
						<label class="layui-form-label">科技活动类型</label>
						<div class="layui-input-block">
							<input type="text" name="type" value="${main.type }" disabled class="layui-input">
						</div>
					</div>
					<c:choose>
						<c:when test="${main.type eq '基础研究' }">
						<div class="layui-form-item" id="classifyDiv">
							<label class="layui-form-label">学科分类</label>
								<div class="layui-input-block">
									<input type="text" name="classify" value="${main.classify }" disabled class="layui-input">
								</div>
						</div>
						</c:when>
						<c:otherwise>
						<div class="layui-form-item" id="fieldDiv">
							<label class="layui-form-label">需求技术所属领域</label>
							<div class="layui-input-block">
								<input type="text" name="field" value="${main.field }" disabled class="layui-input">
							</div>
								
						</div>
						<c:if test="${main.field eq '其他' }">
						<div class="layui-form-item">
							<label class="layui-form-label">注明信息</label>
							<div class="layui-input-block">
								<input type="tel" name="details" value="${main.details }" disabled class="layui-input">
							</div>
						</div>
						</c:if>
						<div class="layui-form-item">
							<label class="layui-form-label">需求技术应用行业</label>
							<div class="layui-input-block">
								<input type="text" name="industry" value="${main.industry }" disabled class="layui-input">
							</div>
						</div>
						</c:otherwise>
					</c:choose>
					<c:if test="${main.management>0 }">
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">形式审核意见</label>
							<div class="layui-input-inline">
								<textarea cols="100" maxlength="500" name="expect" disabled
									class="layui-textarea">${main.check }</textarea>
							</div>
						</div>
					</c:if>
					
					<c:if test="${main.status2>0 }">
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">部门审核意见</label>
							<div class="layui-input-inline">
								<textarea cols="100" maxlength="500" name="expect" disabled
									class="layui-textarea">${main.check2 }</textarea>
							</div>
						</div>
					</c:if>
					
					<div class="layui-row">
						<div class="layui-btn-group" id="layerDemo" style="margin-left:600px">
						  <button type="button" class="layui-btn layui-btn-normal" onclick="window.location.href='/Demand/view/demand/demand_manage.jsp'">返回</button>
						</div>
					</div>
				</form>
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
<script type="text/javascript" src="../../js/industry.js"></script>
<script type="text/javascript" src="../../js/select_industry.js"></script>
<script type="text/javascript" src="../../js/classify.js"></script>
<script type="text/javascript" src="../../js/select_classify.js"></script>
</body>
</html>