layui.use('form', function() {
	var form = layui.form;
		
	var province = $("#classify1"),
		city = $("#classify2"),
		district = $("#classify3"),
		small = $("#classify4");
	
	//初始将省份数据赋予
	for (var i = 0; i < classifyList.length; i++) {
		addEle(province, classifyList[i].name);
	}
	
	//赋予完成 重新渲染select
	form.render('select');
	
	//向select中 追加内容
	function addEle(ele, value) {
		var optionStr = "";
		optionStr = "<option value=" + value + " >" + value + "</option>";
		ele.append(optionStr);
	}

	//移除select中所有项 赋予初始值
	function removeEle(ele) {
		ele.find("option").remove();
		var optionStar = "<option value=" + "0" + ">" + "请选择" + "</option>";
		ele.append(optionStar);
	}

	var provinceText,
		cityText,
		cityItem,
		districtText,
		districtItem,
		smallItem,
		smallText;
	
	//选定省份后 将该省份的数据读取追加上
	form.on('select(classify1)', function(data) {
		provinceText = data.value;
		$.each(classifyList, function(i, item) {
			if (provinceText == item.name) {
				cityItem = i;
				return cityItem;
			}
		});
		removeEle(city);
		removeEle(district);
		$.each(classifyList[cityItem].list, function(i, item) {
			addEle(city, item.name);
		})
		//重新渲染select 
		form.render('select');
	})

	////选定市或直辖县后 将对应的数据读取追加上
	form.on('select(classify2)', function(data) {
		cityText = data.value;
		removeEle(district);
		$.each(classifyList, function(i, item) {
			if (provinceText == item.name) {
				cityItem = i;
				return cityItem;
			}
		});
		
		//重新渲染select 
		form.render('select');
	})

	////选定市或直辖县后 将对应的数据读取追加上
	form.on('select(classify3)', function(data) {
		smallText = data.value;
		removeEle(small);
		$.each(classifyList, function(i, item) {
			if (provinceText == item.name) {
				cityItem = i;
				return cityItem;
			}
		});

		$.each(classifyList[cityItem].list, function(i, item) {
			if (cityText == item.name) {
				districtItem = i;
				return districtItem;
			}
		});

		$.each(classifyList[cityItem].list[districtItem].list, function(i, item) {
			if (smallText == item.name) {
				smallItem = i;
				return smallItem;
			}
		});
		//console.log(cityItem+" "+districtItem+" "+smallItem)
		//console.log(classifyList[cityItem].list[districtItem].list[smallItem])

		$.each(classifyList[cityItem].list[districtItem].list[smallItem], function(i, item) {
			
			if(districtText==item.name&&i=='list'){
				for(var n=0;n<item.length;n++){
					addEle(small,item[n].name)
				}
			}
		})
		//重新渲染select 
		form.render('select');
	})

})