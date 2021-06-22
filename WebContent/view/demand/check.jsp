<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="demand_menu.jsp" %>
<div class="tpl-body">
        <div class="tpl-show">
            <div class="tpl-sub-header">
                <!--面包屑-->
                <!--{include file="public/tpl-crumbs"/}-->
                <div class="crumbs">
                    <a href="#">首页</a>
                    <i>/</i>
                </div>
            </div>
            <div class="tpl-fluid">
                <div class="tpl-pannel">
	                <form class="layui-form">
	                	<input type="hidden" id="status" name="status" value="${sessionScope.user.status }"/>
	                    <div class="layui-form-item">
						    <label class="layui-form-label" for="findDemand">需求名称</label>
						    <div class="layui-input-block">
						    	<input type="text" name="findDemand" id="findDemand" placeholder="请输入需求名称" class="layui-input">
						    </div>
					    </div>
					    <div class="layui-form-item">
						    <label class="layui-form-label" for="findName">机构名称</label>
						    <div class="layui-input-block">
						    	<input type="text" name="findName" id="findName" placeholder="请输入机构名称" class="layui-input">
						    </div>
					    </div>
					    <div class="layui-form-item">
						    <label class="layui-form-label" for="findArea">所在地域</label>
						    <div class="layui-input-block">
						    	<input type="text" name="findArea" id="findArea" placeholder="请输入所在地域" class="layui-input">
						    </div>
					    </div>
					    <div class="layui-form-item">
						    <label class="layui-form-label" for="findGk">归口管理单位</label>
						    <div class="layui-input-block">
						    	<input type="text" name="findGk" id="findGk" placeholder="请输入归口管理单位" class="layui-input">
						    </div>
					    </div>
					    <div class="layui-form-item">
						    <label class="layui-form-label" for="findAttract">机构属性</label>
						    <div class="layui-input-block">
						    	<input type="text" name="findAttract" id="findAttract" placeholder="请输入机构属性" class="layui-input">
						    </div>
					    </div>
					    <div class="layui-form-item">
						    <label class="layui-form-label" for="findType">科技活动类型</label>
						    <div class="layui-input-block">
						    	<input type="text" name="findType" id="findType" placeholder="请输入科技活动类型" class="layui-input">
						    </div>
					    </div>
					    <div class="layui-form-item">
						    <div class="layui-input-block">
						      <button type="button" class="layui-btn" id="search" onclick="zwx()">搜索</button>
						      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
						    </div>
					    </div>
	                </form>
                   <table class="layui-table" lay-even="" lay-skin="row">
                   		<colgroup>
					      <col width="500">
					      <col>
					    </colgroup>
                        <thead>
                        <tr>
                            <th>机构全称</th>
                            <th>需求名称</th>
                            <th>所在地域</th>
                            <th>归口管理单位</th>
                            <th>机构属性</th>
                            <th>科技活动类型</th>
                            <th>审核状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div style="text-align: center;margin:50px auto;">
						<div id="pager" class="pager clearfix">
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!--侧边栏-->
    {include file="public/tpl-right-bar"/}
</div>

<link rel="stylesheet" type="text/css" href="../../css/page.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="../../js/jquery.z-pager.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layuiadmin/layui/layui.js"></script>
<script src="../../static/js/app.js"></script>

<script id="a" type="text/javascript">
	var totalPage = 0;
	var status = $("#status").val();
	$.post(
		"/Demand/view/demand/get_check_page",
		{status: status},
		function(data){
			totalPage = parseInt(data);
			$("#pager").zPager({
				totalData: totalPage,
				htmlBox: $('#wraper'),
				btnShow: true,
				ajaxSetData: false
			});
		},
		"text"
	);
</script>
<script type="text/javascript">
	function zwx(){
		$("#a").remove();
		$('tbody').empty();
		$('#pager').empty();
		var totalPage = 0;
		var status = $("#status").val();
		var techdemand = $("input[name='findDemand']").val();
		var name = $("input[name='findName']").val();
		var area = $("input[name='findArea']").val();
		var gk = $("input[name='findGk']").val();
		var attract = $("input[name='findAttract']").val();
		var type = $("input[name='findType']").val();
		$.post(
			"/Demand/view/demand/get_check_page",
			{
				status:status,
				techdemand:techdemand,
				name:name,
				area:area,
				gk:gk,
				attract:attract,
				type:type
			},
			function(data){
				totalPage = parseInt(data);
				console.log(totalPage);
				$("#pager").zPager({
					totalData: totalPage,
					htmlBox: $('#wraper'),
					btnShow: true,
					ajaxSetData: false
				});
			},
			"text"
		);
		
		return false;
	}
	function currentPage(currentPage){
		var status = $("#status").val();
		var techdemand = $("input[name='findDemand']").val();
		var name = $("input[name='findName']").val();
		var area = $("input[name='findArea']").val();
		var gk = $("input[name='findGk']").val();
		var attract = $("input[name='findAttract']").val();
		var type = $("input[name='findType']").val();
		$.post(
			"/Demand/view/demand/do_check_search",
			{
				cpage: currentPage,
				status: status,
				techdemand:techdemand,
				name:name,
				area:area,
				gk:gk,
				attract:attract,
				type:type
			},
			function(data){
				$('tbody').empty();
				for(var i=0;i<data.length;i++){
					var table = "<tr><td>"+data[i].name+"</td><td>"+data[i].techdemand+"</td><td>"
					+data[i].area+"</td><td>"+data[i].gk+"</td><td>"+data[i].attract+"</td><td>"
					+data[i].type+"</td><td>"
					+"未通过"
					+"</td><td class='link-item'><a href='/Demand/view/demand/do_check_update?id="+data[i].id+"'>"
					+"审核"+"</a></td></tr>";
					$("tbody").append(table);
				}
			},
			"json"
		);
	}
</script>
</body>
</html>