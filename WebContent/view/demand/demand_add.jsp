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
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">机构全称</label>
						<div class="layui-input-block">
							<input type="text" name="name"
								value="${sessionScope.user.institution }" required
								lay-verify="required" placeholder="请输入机构名称"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">归口管理部门</label>
						<div class="layui-input-block">
							<input type="radio" name="gk" value="无" title="无" checked>
							<input type="radio" name="gk" value="占坑1" title="占坑1"> <input
								type="radio" name="gk" value="占坑2" title="占坑2"> <input
								type="radio" name="gk" value="占坑3" title="占坑3">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">通讯地址</label>
						<div class="layui-input-block">
							<input type="text" name="address" required lay-verify="required"
								placeholder="请输入通讯地址" class="layui-input">
							<a href="javascript:;"><i></i></a>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">所在地域</label>
						<div class="layui-input-block">
							<select id="area" name="area" lay-verify="required">
								<option value=""></option>
								<option value="石家庄市">石家庄市</option>
								<option value="唐山市">唐山市</option>
								<option value="秦皇岛市">秦皇岛市</option>
								<option value="邯郸市">邯郸市</option>
								<option value="邢台市">邢台市</option>
								<option value="保定市">保定市</option>
								<option value="张家口市">张家口市</option>
								<option value="承德市">承德市</option>
								<option value="沧州市">沧州市</option>
								<option value="廊坊市">廊坊市</option>
								<option value="衡水市">衡水市</option>
								<option value="定州市">定州市</option>
								<option value="辛集市">辛集市</option>
								<option value="其他（河北工大）">其他（河北工大）</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">网址</label>
							<div class="layui-input-inline">
								<input type="text" name="website" placeholder="请输入单位网址"
									class="layui-input"> <a
									href="javascript:;"><i></i></a>
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">电子邮箱</label>
							<div class="layui-input-inline">
								<input type="text" name="email" lay-verify="email"
									lay-verify="required" placeholder="请输入电子邮箱"
									class="layui-input"> <a href="javascript:;"><i></i></a>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">法人代表</label>
							<div class="layui-input-inline">
								<input type="text" name="lperson" required lay-verify="required"
									placeholder="请输入法人代表" class="layui-input">
								<a href="javascript:;"><i></i></a>
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">邮政编码</label>
							<div class="layui-input-inline">
								<input type="text" name="post"
									value="${sessionScope.user.post }" placeholder="请输入邮政编码"
									class="layui-input"> <a
									href="javascript:;"><i></i></a>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">联系人</label>
							<div class="layui-input-inline">
								<input type="text" name="contact" required lay-verify="required"
									placeholder="请输入联系人" class="layui-input">
								<a href="javascript:;"><i></i></a>
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">固定电话</label>
							<div class="layui-input-inline">
								<input type="text" name="phone" placeholder="请输入固定电话"
									class="layui-input"> <a
									href="javascript:;"><i></i></a>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-form-inline">
							<label class="layui-form-label">手机</label>
							<div class="layui-input-inline">
								<input type="text" name="mobile" required lay-verify="required"
									placeholder="请输入移动手机" class="layui-input">
								<a href="javascript:;"><i></i></a>
							</div>
						</div>
						<div class="layui-form-inline">
							<label class="layui-form-label">传真</label>
							<div class="layui-input-inline">
								<input type="text" name="fax" placeholder="请输入传真"
									class="layui-input"> <a
									href="javascript:;"><i></i></a>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">机构属性</label>
						<div class="layui-input-block">
							<input type="radio" name="attract" value="企业" title="企业" checked>
							<input type="radio" name="attract" value="高等院校" title="高等院校">
							<input type="radio" name="attract" value="研究机构" title="研究机构">
							<input type="radio" name="attract" value="其他" title="其他">
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">机构简介</label>
						<div class="layui-input-inline">
							<textarea cols="100" maxlength="500" lay-verify="required"
								id="introduction" name="introduction" placeholder="请输入机构简介"
								class="layui-textarea"></textarea>
						</div>
						<div class="layui-form-mid layui-word-aux">主要包括基本情况、现有研究基础等，限500字以内</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技术需求名称</label>
						<div class="layui-input-inline">
							<input type="text" name="techdemand" required
								lay-verify="required" placeholder="请输入技术需求名称"
								class="layui-input">
						</div>
						<label class="layui-form-label">需求年限</label>
						<div class="layui-input-inline">
							<input type="text" name="begin" id="begin" required
								lay-verify="required" placeholder="请输入起始年限"
								class="layui-input">
						</div>
						<label class="layui-form-label"
							style="width: 30px; text-align: center">——</label>
						<div class="layui-input-inline">
							<input type="text" name="end" id="end" required
								lay-verify="required" placeholder="请输入终止年限"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">技术需求概述</label>
						<div class="layui-input-inline">
							<textarea cols="100" maxlength="500" lay-verify="required"
								id="main" name="main" placeholder="1、主要问题（需要解决的重大技术问题，限500字以内）"
								class="layui-textarea"></textarea>
							<br>
							<textarea cols="100" maxlength="500" lay-verify="required"
								id="key" name="key" placeholder="2、技术关键（所需的关键技术、主要指标，限500字以内）"
								class="layui-textarea"></textarea>
							<br>
							<textarea cols="100" maxlength="500" lay-verify="required"
								id="expect" name="expect"
								placeholder="3、预期目标（技术创新性、经济社会效益，限500字以内）"
								class="layui-textarea"></textarea>
							<br> <label class="layui-form-label"
								style="text-align: left; padding-left: 0; padding-right: 0; width: 50px">关键字</label>
							<div class="layui-input-inline" id="keywordDiv1">
								<input type="tel" name="keyword1" lay-verify="required"
									autocomplete="off" onblur="AddKeyword(this)"
									class="layui-input" placeholder="请输入关键字" size="10">
							</div>
							<div class="layui-input-inline" id="keywordDiv2"
								style="display: none">
								<input type="tel" name="keyword2" autocomplete="off"
									onblur="AddKeyword(this)" class="layui-input"
									placeholder="请输入关键字" size="10">
							</div>
							<div class="layui-input-inline" id="keywordDiv3"
								style="display: none">
								<input type="tel" name="keyword3" autocomplete="off"
									onblur="AddKeyword(this)" class="layui-input"
									placeholder="请输入关键字" size="10">
							</div>
							<div class="layui-input-inline" id="keywordDiv4"
								style="display: none">
								<input type="tel" name="keyword4" autocomplete="off"
									onblur="AddKeyword(this)" class="layui-input"
									placeholder="请输入关键字" size="10">
							</div>
							<div class="layui-input-inline" id="keywordDiv5"
								style="display: none">
								<input type="tel" name="keyword5" autocomplete="off"
									class="layui-input" placeholder="请输入关键字" size="10">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">拟投入资金总额</label>
						<div class="layui-input-inline">
							<input type="text" name="totalsum" placeholder="请输入拟投入资金总额"
								class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux">万元</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技术需求解决方式</label>
						<div class="layui-input-block">
							<input type="radio" name="fix" lay-filter="fix_other" value="独立研发" title="独立研发" checked> 
							<input type="radio" name="fix" lay-filter="fix_other" value="委托研发" title="委托研发">
						    <input type="radio" name="fix" lay-filter="codevelop" value="合作研发" title="合作研发">
							<input type="radio" name="fix" lay-filter="fix_other" value="其他" title="其他">
						</div>
						<div style="display: none; position: absolute; left: 340px;"
							id="coinstitutionDiv">
							<label class="layui-form-label"
								style="text-align: left; padding-left: 0; padding-right: 0; width: 50px">请注明</label>
							<div class="layui-input-inline">
								<input type="tel" name="coinstitution"
									class="layui-input" placeholder="请输入合作意向单位">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">科技活动类型</label>
						<div class="layui-input-block">
							<input type="radio" lay-filter="basic" id="basic" name="type" value="基础研究" title="基础研究" checked> 
							<input type="radio" name="type" lay-filter="other" value="应用研究" title="应用研究"> 
							<input type="radio" name="type" lay-filter="other" value="试验发展" title="试验发展"> 
							<input type="radio" name="type" lay-filter="other" value="研究与试验发展成果应用" title="研究与试验发展成果应用"> 
							<input type="radio" name="type" lay-filter="other" value="技术推广与科技服务" title="技术推广与科技服务"> 
							<input type="radio" name="type" lay-filter="other" value="生产性活动" title="生产性活动">
						</div>
					</div>
					<div class="layui-form-item" id="classifyDiv">
						<label class="layui-form-label">学科分类</label>
							<div class="layui-inline">
								<select name="classify1" id="classify1" lay-search lay-filter="classify1">
									<option value="">门类</option>
								</select>
							</div>
							<div class="layui-inline">
								<select name="classify2" id="classify2" lay-search lay-filter="classify2">
									<option value="">学科</option>
								</select>
							</div>
					</div>
					<div class="layui-form-item" id="fieldDiv" style="display: none">
						<label class="layui-form-label">需求技术所属领域</label>
						<div class="layui-input-block" style="margin-bottom: 5px;">
							<input type="checkbox" name="field" value="电子信息技术" title="电子信息技术"> 
							<input type="checkbox" name="field" value="光机电一体化" title="光机电一体化"> 
							<input type="checkbox" name="field" value="生物技术与制药" title="生物技术与制药"> 
							<input type="checkbox" name="field" value="新材料及应用技术" title="新材料及应用技术"> 
							<input type="checkbox" name="field" value="现代农业" title="现代农业"> 
							<input type="checkbox" name="field" value="新能源与高效节能" title="新能源与高效节能">
							<input type="checkbox" name="field" value="资源与环境" title="资源与环境">
							<input type="checkbox" name="field" value="高技术服务业" title="高技术服务业">
							<input type="checkbox" name="field" value="海洋" title="海洋">
							<input type="checkbox" name="field" value="社会公共事业" title="社会公共事业">
							<input type="checkbox" name="field" value="医疗卫生" title="医疗卫生">
							<input type="checkbox" lay-filter="else" value="其他" name="field" title="其他">
						</div>
						<div style="display: none; padding-left: 225px" id="detailsDiv">
							<label class="layui-form-label"
								style="text-align: left; padding-left: 0; padding-right: 0; width: 50px">请注明</label>
							<div class="layui-input-inline">
								<input type="tel" name="details" autocomplete="off"
									class="layui-input" placeholder="请输入注明信息">
							</div>
						</div>
					</div>
					<div class="layui-form-item" id="industryDiv" style="display: none">
						<label class="layui-form-label">需求技术应用行业</label>
						<div class="layui-inline">
							<select name="industry1" id="industry1"
								lay-search lay-filter="industry1">
								<option value="">门类</option>
							</select>
						</div>
						<div class="layui-inline">
							<select name="industry2" id="industry2"
								lay-search lay-filter="industry2">
								<option value="">大类</option>
							</select>
						</div>
						<div class="layui-inline">
							<select name="industry3" id="industry3"
								lay-filter="industry3" lay-search>
								<option value="">中类</option>
							</select>
						</div>
						<div class="layui-inline">
							<select name="industry4" id="industry4"
								lay-search>
								<option value="">小类</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="formDemo">保存并提交</button>
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

<script>
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  
		  //执行一个laydate实例
		  laydate.render({ 
        	  elem: '#begin'
        	  ,type: 'year'
        });
          laydate.render({ 
        	  elem: '#end'
        	  ,type: 'year'
        });
	});
    layui.use(['jquery','form'],function(){
        var $ = layui.jquery;
        var form = layui.form;
        form.on('radio(basic)', function(data){
			$("#classifyDiv").show();
			$("#fieldDiv").hide();
			$("#industryDiv").hide();
		});
        form.on('radio(other)', function(data){
			$("#classifyDiv").hide();
			$("#fieldDiv").show();
			$("#industryDiv").show();
		});
        form.on('radio(fix_other)', function(data){
        	$("#coinstitutionDiv").hide();
		});
        form.on('radio(codevelop)', function(data){
       		$("#coinstitutionDiv").show();
        });
        form.on('checkbox(else)', function(data){
       		$("#detailsDiv").toggle();
        });  

        $('form').submit(function (e) {
            e.preventDefault();
            var name = $("input[name='name']").val();
            var gk = $("input[name='gk']:checked").val(); //新增
            var address = $("input[name='address']").val();
            var area = $("#area option:selected").val(); //新增
            var website = $("input[name='website']").val();
            var email = $("input[name='email']").val();
            var lperson = $("input[name='lperson']").val();
            var post = $("input[name='post']").val();
            var contact = $("input[name='contact']").val();
            var phone = $("input[name='phone']").val();
            var mobile = $("input[name='mobile']").val();
            var fax = $("input[name='fax']").val();
            var attract = $("input[name='attract']:checked").val();
            var introduction = $('#introduction').val();
            var techdemand = $("input[name='techdemand']").val();
            var begin = $("input[name='begin']").val();
            var end = $("input[name='end']").val();
            var main = $('#main').val(); //新增
            var key = $('#key').val(); //新增
            var expect = $('#expect').val(); //新增
            var keyword = $("input[name='keyword1']").val() + " " + $("input[name='keyword2']").val() + " " + $("input[name='keyword3']").val() + " " + $("input[name='keyword4']").val() + " " + $("input[name='keyword5']").val();
            var fix = $("input[name='fix']:checked").val(); //新增
            var coinstitution = $("input[name='coinstitution']").val(); //新增
            var type = $("input[name='type']:checked").val();
            
            var classify = $("#classify1 option:selected").val() + " " + $("#classify2 option:selected").val();
    		var industry = $("#industry1 option:selected").val() + " " + $("#industry2 option:selected").val()+ " " + $("#industry3 option:selected").val() + " " + $("#industry4 option:selected").val();
    		$('.curSelectedNode').each(function(i){
    			if($(this).parents('#classify').length > 0){
    		        classify = classify + $(this).text() + " ";
    		    }else{
    		    	industry = industry + $(this).text() + " ";	
    		    }
    		});
    		
   		    var field = "";
   		    $("input[name='field']:checked").each(function(i){
   				field = field + $(this).val() + " ";
   			});
   		    
   		    var details = $("input[name='details']").val();
		    
		    var totalsum = $("input[name='totalsum']").val(); //new
		    
		    layer.load(1);
            $.ajax({
                url: "do_main_add",
                type: 'post',
                data: {
                    name: name,
                    gk: gk,
                    address: address,
                    area: area,
                    website: website,
                    email: email,
                    lperson: lperson,
                    post: post,
                    contact: contact,
                    phone: phone,
                    mobile: mobile,
                    fax: fax,
                    attract: attract,
                    introduction: introduction,
                    techdemand: techdemand,
                    begin: begin,
                    end: end,
                    main: main,
                    key: key,
                    expect: expect,
                    keyword: keyword,
                    totalsum: totalsum,
                    fix: fix,
                    coinstitution: coinstitution,
                    type: type,
                    classify: classify,
                    field: field,
                    details: details,
                    industry: industry
                },
                success: function (data) {
                	layer.closeAll('loading');
                    if (data == "yes") {
                    	layer.open({
                            content: '添加成功！',
                            yes: function (layero, index) {
                              	window.location="/Demand/view/demand/demand_manage.jsp";
                              }
                        });
                    } else if(data=="no"){
                      	layer.open({
                      	    content: "添加失败！"
                      	});
                    }
                },
                error: function (e) {
                	layer.msg('网络错误');
                    layer.closeAll('loading')
                },
                dataType: "text"
            });
            return false;
        })
    })
</script>
</body>
</html>