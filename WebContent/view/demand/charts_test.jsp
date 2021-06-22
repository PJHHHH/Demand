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
					  <legend>图表统计展示</legend>
					</fieldset>
					  <form class="layui-form" style="margin-top:20px">
						  <div class="layui-form-item">
							  <div class="layui-form-inline">
							    <label class="layui-form-label">图表</label>
							    <div class="layui-input-inline">
							     <select name="ctype" id="ctype" lay-search>
								  <option value=""></option>
								  <option value="001">饼图</option>
								  <option value="002">柱状图</option>
								  <option value="003">折线图</option>
								 </select>
							    </div>
							  </div>
							  <div class="layui-form-inline">
							    <label class="layui-form-label">类型</label>
							    <div class="layui-input-inline">
							     <select name="type" id="type" lay-search>
								  <option value=""></option>
								  <option value="001">按视频访问次数</option>
								  <option value="002">按地市统计</option>
								  <option value="003">按流量统计</option>
								 </select>
							    </div>
							  </div>
						  	<div class="layui-form-inline">
							    <label class="layui-form-label" for="findDemand">数量</label>
							    <div class="layui-input-inline">
							    	<input type="text" name="num" id="num" placeholder="请输入统计数量" class="layui-input">
							    </div>
						    </div>
						  </div>
						    <div class="layui-form-item">
							    <div class="layui-input-block">
							      <button type="button" class="layui-btn" id="search" onclick="zwx()">查询</button>
							    </div>
						    </div>
					  </form>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show">
					    	<div style="height:800px;" id="show_bar"></div>
					    	<table class="layui-table" id="table">
								<thead id="head_bar"></thead>
						        <tbody id="main_bar"></tbody>
							</table>
					    </div>
					    <div class="layui-tab-item">
					    	<div style="height:700px;" id="show_pie"></div>
					    	<table class="layui-table">
								<thead id="head_pie"></thead>
						        <tbody id="main_pie"></tbody>
							</table>
					    </div>
					    <div class="layui-tab-item" style="height:700px;" id="show_map"></div>
					    <div class="layui-tab-item" style="height:700px;" id="show_line"></div>
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
  
  getGraph('show_bar', 'bar');
  
  element.on('tab(tab-all)', function(data){
	  var status = $(this).attr('data-status');
      var position = 'show_bar';
      switch (status) {
	      case 'pie': position = 'show_pie'; break;
	      case 'fix': position = 'show_fix'; break;
	      case 'area': position = 'show_area'; break;
	      default: position = 'show_bar';
	  }
  	  getGraph(position, status);
  });
});

function getGraph(position, status){
    var myEcharts = echarts.init(document.getElementById(position));
    var names = [];
    var datas = [];
    var jsons = [];
    
    $.ajax({
        url: "/Demand/view/demand/get_charts2_graph",
        type: 'post',
        async:false, 
        data: {
            status: status
        },
        success: function (data) {
        	head="<tr><th>地址</th><th>数量</th>";
            $('#head_bar').append(head);
            names = data.names;
            datas = data.datas;
            for(var i=0;i<data.names.length;i++){
            	var json = {};
            	json['name'] = names[i];
            	json['value'] = datas[i];
            	jsons[i]=json;
            	var table = "<tr id='tr"+(i+1)+"'><td>"+names[i]+"</td><td>"+datas[i]+"</td></tr>";
				$("#main_bar").append(table);
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
                data: names
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
}

function zwx(){
	$('#head_bar').empty();
	$("#main_bar").empty();
	var type = $("#type option:selected").val();
	var num = $("#num").val();
	
	var myEcharts = echarts.init(document.getElementById('show_bar'));
    var names = [];
    var datas = [];
    var jsons = [];
    
    $.ajax({
        url: "/Demand/view/demand/get_charts2_graph",
        type: 'post',
        async:false, 
        data: {
            type: type,
            num: num
        },
        success: function (data) {
        	head="<tr><th>地址</th><th>数量</th>";
            $('#head_bar').append(head);
            names = data.names;
            datas = data.datas;
            for(var i=0;i<data.names.length;i++){
            	var json = {};
            	json['name'] = names[i];
            	json['value'] = datas[i];
            	jsons[i]=json;
            	var table = "<tr id='tr"+(i+1)+"'><td>"+names[i]+"</td><td>"+datas[i]+"</td></tr>";
				$("#main_bar").append(table);
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
                data: names
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
            tooltip: {},
            legend: {
                data:['数量']
            },
            grid: {  
                y2: 150  
            },
            xAxis: {
            	type : 'category',
                data: names,
                axisLabel:{  
                    interval:0,
                    margin:20,
                    show:true,
                    textStyle: {
                        fontSize:9      //更改坐标轴文字大小
                      },
                    formatter: function (value) {
                        //x轴的文字改为竖版显示
                        var str = value.split("");
                        return str.join("\n");
                      }
                   }
            },
            yAxis: {},
            series: [{
                name: '详细数目',
                type: 'bar',
                data: datas
            }]
        };
    myEcharts.clear();
    myEcharts.setOption(option2);
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
}
</script>
</body>
</html>