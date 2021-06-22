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
                	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
					  <legend>角色权限管理</legend>
					</fieldset>
                   <table class="layui-table" lay-size="lg" lay-even="" lay-skin="row">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>角色</th>
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
<script type="text/javascript">
	var totalPage = 0;
	$.post(
		"/Demand/view/demand/get_auth_page",
		{},
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
	function currentPage(currentPage){
		$.post(
			"/Demand/view/demand/do_auth_select",
			{
				cpage: currentPage
			},
			function(data){
				$('tbody').empty();
				for(var i=0;i<data.length;i++){
					var t1 = "";
					console.log(data[i].status)
					switch (data[i].status) {
			  	      case -1: t1 = '管理员'; break;
			  	      case 0: t1 = '普通用户'; break;
			  	      case -2: t1 = '形式审核员'; break;
			  	      default: t1 = '部门审核员';
			  	    }
					var table = "<tr><td>"+data[i].username+"</td><td>"
					+t1+"</td><td class='link-item'><a href='/Demand/view/demand/do_auth_update?id="+data[i].id+"'>"
					+"管理"+"</a></td></tr>";
					$("tbody").append(table);
				}
			},
			"json"
		);
	}
</script>
</body>
</html>