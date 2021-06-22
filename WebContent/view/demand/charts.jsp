<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="demand_menu.jsp"%>
<div class="tpl-body">
	<div class="tpl-show">
		<div class="tpl-sub-header">
			<!--面包屑-->
			<!--{include file="public/tpl-crumbs"/}-->
			<div class="crumbs">
				<a href="#">首页</a> <i>/</i>
			</div>
		</div>
		<div class="tpl-fluid">
			<div class="tpl-pannel">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 50px;">
					<legend>图表统计展示</legend>
				</fieldset>
				<div class="layui-tab layui-tab-brief" lay-filter="tab-all">
					<ul class="layui-tab-title">
						<li data-status="1" class="layui-this">机构属性</li>
						<li data-status="2">科技活动类型</li>
						<li data-status="3">技术需求解决方式</li>
						<li data-status="4">归口管理部门</li>
						<li data-status="5">所在地域</li>
						<li data-status="6">需求技术应用行业</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show" style="height: 400px;" id="show_attract">
							<div style="height:400px;width:800px;float:left" id="left1"></div>
							<div style="height:400px;width:800px;float:right" id="right1"></div>
						</div>
						<div class="layui-tab-item" style="height: 400px;" id="show_type">
							<div style="height:400px;width:800px;float:left" id="left2"></div>
							<div style="height:400px;width:800px;float:right" id="right2"></div>
						</div>
						<div class="layui-tab-item" style="height: 400px;" id="show_fix">
							<div style="height:400px;width:800px;float:left" id="left3"></div>
							<div style="height:400px;width:800px;float:right" id="right3"></div>
						</div>
						<div class="layui-tab-item" style="height: 400px;" id="show_gk">
							<div style="height:400px;width:800px;float:left" id="left4"></div>
							<div style="height:400px;width:800px;float:right" id="right4"></div>
						</div>
						<div class="layui-tab-item" style="height: 400px;" id="show_area">
							<div style="height:400px;width:800px;float:left" id="left5"></div>
							<div style="height:400px;width:800px;float:right" id="right5"></div>
						</div>
						<div class="layui-tab-item" style="height: 400px;" id="show_industry">
							<div style="height:400px;width:800px;float:left" id="left6"></div>
							<div style="height:400px;width:800px;float:right" id="right6"></div>
						</div>
						<table class="layui-table" id="table">
							<thead></thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--侧边栏-->
{include file="public/tpl-right-bar"/}
</div>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="../../layuiadmin/layui/layui.js"></script>
<script src="../../static/js/app.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<style>
.success {
	background: rgba(173, 216, 230, 0.4);
}
</style>

<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element;
  
  getGraph('show_attract', '1');
  
  element.on('tab(tab-all)', function(data){
	  var status = $(this).attr('data-status');
      var position = '#show_attract';
      switch (status) {
	      case '1': position = 'show_attract'; break;
	      case '2': position = 'show_type'; break;
	      case '3': position = 'show_fix'; break;
	      case '4': position = 'show_gk'; break;
	      case '5': position = 'show_area'; break;
	      case '6': position = 'show_industry'; break;
	      default: position = 'show_attract';
	  }
  	  getGraph(position, status);
  });
});

function getGraph(position, status){
    var myEcharts = echarts.init(document.getElementById('left' + status));
    var myEcharts2 = echarts.init(document.getElementById('right' + status));
    var names = [];
    var datas = [];
    var jsons = [];
    
    $.ajax({
        url: "/Demand/view/demand/get_charts_graph",
        type: 'post',
        async:false, 
        data: {
            status: status
        },
        success: function (data) {
        	$('thead').empty();
        	$('tbody').empty();
        	var t1 = "";
        	switch (status) {
        	  case '1': t1 = '机构属性'; break;
	  	      case '2': t1 = '科技活动类型'; break;
	  	      case '3': t1 = '技术需求名称'; break;
	  	      case '5': t1 = '所在地域'; break;
	  	      case '6': t1 = '需求技术所属领域'; break;
	  	      case '4': t1 = '管理部门'; break;
	  	      default: t1 = '机构属性';
	  	    }
        	var head="<tr><th>"+t1+"</th><th>数量</th>";
            $('thead').append(head);
            names = data.names;
            datas = data.datas;
            for(var i=0;i<data.names.length;i++){
            	var json = {};
            	json['value'] = datas[i];
            	json['name'] = names[i];
            	jsons[i]=json;
            	var table = "<tr id='tr"+(i+1)+"'><td>"+names[i]+"</td><td>"+datas[i]+"</td></tr>";
				$("tbody").append(table);
            }
        },
        dataType: "json"
    });
    
    var option = {
    	    // 鼠标悬停显示数据
    	    tooltip:{
    	    },
    	    //图例
    	    legend : {
    	        data: []
    	    },
    	    //数据
    	    series :[
    	        {
    	            radius:['55%','70%'], //半径
    	            label:{
    	                normal:{
    	                    // 取消在原来的位置显示
    	                    show:false,
    	                    // 在中间显示
    	                    position:'center'
    	                },
    	                // 高亮扇区
    	                emphasis:{
    	                    show:true,
    	                    textStyle:{
    	                        fontSize:30,
    	                        fontWeight:'bold'
    	                    }
    	                }
    	            },
    	            data: jsons,
    	            type:'pie',
    	            //关掉南丁格尔图
    	            //roseType:'radius'
    	        }
    	    ]
    	};
    	var option2 = {
    	   
    	    legend: {
    	        data: []
    	    },
    	    toolbox: {
    	        // y: 'bottom',
    	        feature: {
    	            magicType: {
    	                type: ['stack', 'tiled']
    	            },
    	            dataView: {},
    	            saveAsImage: {
    	                pixelRatio: 2
    	            }
    	        }
    	    },
    	    tooltip: {},
    	    xAxis: {
    	        data: names,
    	        splitLine: {
    	            show: false
    	        }
    	    },
    	    yAxis: {
    	    },
    	    series: [{
    	        name: '活跃度',
    	        type: 'bar',
    	        data: datas,
    	        animationDelay: function (idx) {
    	            return idx * 10;
    	        }
    	    }],
    	    animationEasing: 'elasticOut',
    	    animationDelayUpdate: function (idx) {
    	        return idx * 5;
    	    }
    	};

    	myEcharts.clear();
    	myEcharts.setOption(option);
    	myEcharts.on('click',function (params) {
    	    // 获取table下所有的tr
    	    let trs = $("#table tbody tr");
    	    for (let i = 0;i<trs.length;i++){
    	        // 获取tr下所有的td
    	        let tds = trs.eq(i).find("td");
    	        // 先把之前的标记的success去掉
    	        $("#table tbody tr").eq(i).removeClass('success');
    	        // 如果点击图示的名字和table下的某一个行的第一个td的值一样
    	        if (params.name == tds.eq(0).text()){
    	            //设置success状态
    	            $("#table tbody tr").eq(i).addClass('success');
    	            // 跳转到页面指定的id位置
    	            $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},1000);
    	        }
    	    }
    	});
    	// 当鼠标落在tr时，显示浮动
    	$("#table tbody").find("tr").on("mouseenter",function () {
    	    // 获得当前匹配元素的个数
    	    let row = $(this).prevAll().length;
    	    // 获得当前tr下td的名字
    	    let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
    	    // 设置浮动
    	    myEcharts.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
    	});
    	// 当鼠标移开tr时候取消浮动
    	$("#table tbody").find("tr").on("mouseleave",function () {
    	    // 获得当前匹配元素的个数
    	    let row = $(this).prevAll().length;
    	    // 获得当前tr下td的名字
    	    let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
    	    // 设置浮动
    	    myEcharts.dispatchAction({ type: 'hideTip', name:name});//选中高亮
    	});
    	myEcharts2.clear();
    	myEcharts2.setOption(option2);
    	myEcharts2.on('click',function (params) {
    	    // 获取table下所有的tr
    	    let trs = $("#table tbody tr");
    	    for (let i = 0;i<trs.length;i++){
    	        // 获取tr下所有的td
    	        let tds = trs.eq(i).find("td");
    	        // 先把之前的标记的success去掉
    	        $("#table tbody tr").eq(i).removeClass('success');
    	        // 如果点击图示的名字和table下的某一个行的第一个td的值一样
    	        if (params.name == tds.eq(0).text()){
    	            //设置success状态
    	            $("#table tbody tr").eq(i).addClass('success');
    	            // 跳转到页面指定的id位置
    	            $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},1000);
    	        }
    	    }
    	});
    	// 当鼠标落在tr时，显示浮动
    	$("#table tbody").find("tr").on("mouseenter",function () {
    	    // 获得当前匹配元素的个数
    	    let row = $(this).prevAll().length;
    	    // 获得当前tr下td的名字
    	    let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
    	    // 设置浮动
    	    myEcharts2.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
    	});
    	// 当鼠标移开tr时候取消浮动
    	$("#table tbody").find("tr").on("mouseleave",function () {
    	    // 获得当前匹配元素的个数
    	    let row = $(this).prevAll().length;
    	    // 获得当前tr下td的名字
    	    let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
    	    // 设置浮动
    	    myEcharts2.dispatchAction({ type: 'hideTip', name:name});//选中高亮
    	});
}
</script>
</body>
</html>