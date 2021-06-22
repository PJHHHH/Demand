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
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
					  <legend>用户权限管理</legend>
				</fieldset>
				<form class="layui-form" action="">
					<input type="hidden" id="ID" name="ID" value="${user.id}"/>
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-inline">
							<input type="text" name="name" value="${user.username }"  disabled class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">角色权限</label>
						<div class="layui-input-inline">
							<select id="role" name="role" lay-filter="role" lay-verify="required">
								<option value=""></option>
								<option value="-1">管理员</option>
								<option value="-2">形式审核员</option>
								<option value="1">部门审核员</option>
								<option value="0">注册用户</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item" id="managementDiv" style="display:none">
						<label class="layui-form-label">管理部门</label>
						<div class="layui-input-inline">
							<select id="management" name="management" lay-filter="management">
							  <option value=""></option>
							  <option value="001">办公室</option>
							  <option value="002">人事处</option>
							  <option value="003">机关党委</option>
							  <option value="004">政策法规处</option>
							  <option value="005">计划财务处</option>
							  <option value="006">平台与基础处</option>
							  <option value="007">国际合作处</option>
							  <option value="008">高新技术处</option>
							  <option value="009">农村科技处</option>
							  <option value="010">社会发展处</option>
							  <option value="011">成果与市场处</option>
							  <option value="012">监察室</option>
							  <option value="013">离退休干部处</option>
							  <option value="014">知识产权局</option>
							  <option value="015">半干旱中心</option>
							  <option value="016">山办</option>
							  <option value="017">机关服务中心</option>
							  <option value="020">科技研发中心</option>
							  <option value="021">科技情报研究院</option>
							  <option value="022">器材公司</option>
							  <option value="023">基金办</option>
							  <option value="024">档案馆</option>
							  <option value="025">科技管理信息中心</option>
							  <option value="026">科技投资中心</option>
							  <option value="027">成果转换中心</option>
							  <option value="028">中小企业创新资金管理中心</option>
							  <option value="029">对外交流中心</option>
							</select>
						</div>
					</div>
					<div class="layui-row">
						<div class="layui-btn-group" id="layerDemo" style="margin-left:600px">
						  <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">修改</button>
						  <button type="button" class="layui-btn" onclick="window.location.href='/Demand/view/demand/auth_manage.jsp'">返回</button>
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
layui.use(['jquery','form'],function(){
    var $ = layui.jquery;
    var form = layui.form;
    form.on('select(role)', function(data){
    	if(data.value == "1"){
    		$("#managementDiv").show();
    	} else {
    		$("#managementDiv").hide();
    	}
	}); 

    $('form').submit(function (e) {
        e.preventDefault();
        var role = "";
        var s1 = $("#role option:selected").val();
        if(s1 == "1"){
        	role = $("#management option:selected").val();
        }else{
        	role = s1;
        }
        var id = $("#ID").val();
        
	    layer.load(1);
        $.ajax({
            url: "do_auth_update",
            type: 'post',
            data: {
            	id: id,
                role: role
            },
            success: function (data) {
            	layer.closeAll('loading');
                if (data == "yes") {
                	layer.open({
                        content: '修改成功！',
                        yes:function(){
                        	window.location.href='/Demand/view/demand/auth_manage.jsp';
                        }
                    });
                	
                } else if(data=="no"){
                  	layer.open({
                  	    content: "修改失败！"
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