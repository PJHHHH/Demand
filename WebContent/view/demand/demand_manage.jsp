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
	                <div class="x-body">
				        <form class="layui-form">
				        	<div class="input-block layui-form-item">
				        		<div class="layui-col-md1" style="visibility: hidden;">
				        			<select name="cs" lay-verify="required" lay-search>
						                <option value="0">AND</option>
						                <option value="1">OR</option>
						             </select>
				        		</div>
					        	<div class="layui-col-md2">
									<select name='cls' lay-verify='required' lay-search>
										<option value='name'>机构全称</option>
										<option value='gk'>归口管理单位</option>
										<option value='area'>所在地域</option>
										<option value='lperson'>法人代表</option>
										<option value='contact'>联系人</option>
										<option value='attract'>机构属性</option>
										<option value='techdemand'>技术需求名称</option>
										<option value='keyword'>关键字</option>
										<option value='totalsum'>拟投入资金总额</option>
										<option value='fix'>技术需求解决方式</option>
										<option value='type'>科技活动类型</option>
										<option value='classify'>学科分类</option>
										<option value='field'>需求技术所属领域</option>
										<option value='industry'>需求技术应用行业</option>
										<option value='management'>管理处室</option>
									</select>
					            </div>
					            <div class="layui-col-md4">
					            	<input type="text" name="cont" placeholder="请输入内容" autocomplete="off" class="layui-input">
					            </div>
					            <div class="layui-col-md1">
					            	<select name="how" lay-verify="required" lay-search>
						                <option value="0">精确</option>
						                <option value="1">模糊</option>
						             </select>
					            </div>
					            <div class="layui-col-md3">
					            	<a class="icon-a-sub" onclick="move(this)" style="visibility: hidden;"></a>
					            	<a class="icon-a-add" onclick="add(this)"></a>
					            	<div class="clear"></div>
					            </div>
				            </div>
				            <div class="layui-form-item">
					            <label class="layui-form-label">条件</label>
					            <div class="layui-input-block">
					              <input type="checkbox" name="state" lay-skin="primary" value="0" title="形式审核通过"><div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><span>形式审核通过</span><i class="layui-icon layui-icon-ok"></i></div>
					              <input type="checkbox" name="state" lay-skin="primary" value="1" title="形式审核未通过"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>形式审核未通过</span><i class="layui-icon layui-icon-ok"></i></div>
					              <input type="checkbox" name="state" lay-skin="primary" value="2" title="部门审核未通过"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>部门审核通过</span><i class="layui-icon layui-icon-ok"></i></div>
					              <input type="checkbox" name="state" lay-skin="primary" value="3" title="部门审核未通过"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>部门审核未通过</span><i class="layui-icon layui-icon-ok"></i></div>
					            </div>
					        </div>
					        <div class="layui-form-item">
						        <div class="layui-input-block">
						          <button type="button" class="layui-btn" lay-submit id="sub">提交</button>
						        </div>
						     </div>
				        </form>
				    </div>
                   <table class="layui-table" lay-size="lg" lay-even="" lay-skin="row">
	                   	<colgroup>
					      <col width="500">
					      <col width="200">
					      <col width="200">
					      <col width="200">
					      <col>
					    </colgroup>
                        <thead>
                        <tr>
                            <th>机构全称</th>
                            <th>所在地域</th>
                            <th>机构属性</th>
                            <th>需求名称</th>
                            <th>技术需求解决方式</th>
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
	$.post(
		"/Demand/view/demand/get_manage_page",
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
</script>
<script type="text/javascript">
	function move(event){
		$(event).parent().parent('.input-block').remove();
		$('.icon-a-add').remove();
		$('.input-block').last().find(".icon-a-sub").after("<a class='icon-a-add' onclick='add(this)'></a>");
	}
	
	function add(event){
		var text = "<div class='input-block layui-form-item'>"+
		"		<div class='layui-col-md1'>"+
		"		<select name='cs' lay-verify='required' lay-search>"+
		"            <option value='0'>AND</option>"+
		"            <option value='1'>OR</option>"+
		"         </select>"+
		"	</div>"+
		"	<div class='layui-col-md2'>"+
		"      <select name='cls' lay-verify='required' lay-search>"+
		"        <option value='name'>机构全称</option>"+
		"        <option value='gk'>归口管理单位</option>"+
		"        <option value='area'>所在地域</option>"+
		"        <option value='lperson'>法人代表</option>"+
		"        <option value='contact'>联系人</option>"+
		"        <option value='attract'>机构属性</option>"+
		"        <option value='techdemand'>技术需求名称</option>"+
		"        <option value='keyword'>关键字</option>"+
		"        <option value='totalsum'>拟投入资金总额</option>"+
		"        <option value='fix'>技术需求解决方式</option>"+
		"        <option value='type'>科技活动类型</option>"+
		"        <option value='classify'>学科分类</option>"+
		"        <option value='field'>需求技术所属领域</option>"+
		"        <option value='industry'>需求技术应用行业</option>"+
		"        <option value='management'>管理处室</option>"+
		"      </select>"+
		"    </div>"+
		"    <div class='layui-col-md4'>"+
		"   	<input type='text' name='cont' placeholder='请输入内容' autocomplete='off' class='layui-input'>"+
		"    </div>"+
		"    <div class='layui-col-md1'>"+
		"    	<select name='how' lay-verify='required' lay-search>"+
		"            <option value='0'>精确</option>"+
		"            <option value='1'>模糊</option>"+
		"         </select>"+
		"    </div>"+
		"    <div class='layui-col-md3'>"+
		"    	<a class='icon-a-sub' onclick='move(this)'></a>"+
		"    	<a class='icon-a-add' onclick='add(this)'></a>"+
		"    	<div class='clear'></div>"+
		"    </div>"+
		"</div>";
		var p = $(event).parent().parent('.input-block');
		$('.icon-a-add').remove();
		p.after(text);
		layui.use('form', function(){
		    var form = layui.form; 
		    form.render();
		});
	}

	var json={};
	$("#sub").click(function(e){
		$("#a").remove();
		$('tbody').empty();
		$('#pager').empty();
		var totalPage = 0;
		var length = 0;
		$('.input-block').each(function (index,dom){
			var cs = $(dom).find("select[name='cs']").val();
			var cls = $(dom).find("select[name='cls']").val();
			var cont = $(dom).find("input[name='cont']").val();
			var how = $(dom).find("select[name='how']").val();
			json['cs'+index]=cs;
			json['cls'+index]=cls;
			json['cont'+index]=cont;
			json['how'+index]=how;
			length=index+1;
		});
		var state = "";
	    $("input[name='state']:checked").each(function(i){
			state = state + $(this).val() + " ";
		});
	    json['state'] = state;
		json['length'] = length;
		$.post(
			"/Demand/view/demand/get_manage_page",
			json,
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
	});
	function currentPage(currentPage){
		json['cpage']=currentPage;
		$.post(
			"/Demand/view/demand/do_manage_search",
			json,
			function(data){
				$('tbody').empty();
				for(var i=0;i<data.length;i++){
					var table = "<tr><td>"+data[i].name+"</td><td>"
					+data[i].area+"</td><td>"+data[i].attract+"</td><td>"+data[i].techdemand+"</td><td>"
					+data[i].fix+"</td><td class='link-item'><a href='/Demand/view/demand/do_manage_select?id="+data[i].id+"'>"
					+"查看"+"</a></td></tr>";
					$("tbody").append(table);
				}
			},
			"json"
		);
	}
</script>
</body>
</html>