layui.use('form', function() {
	var form = layui.form;
		
	var province = $("#industry1"),
		city = $("#industry2"),
		district = $("#industry3"),
		small = $("#industry4");
	
	//初始将省份数据赋予
	for (var i = 0; i < industryList.length; i++) {
		addEle(province, industryList[i].name);
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
	form.on('select(industry1)', function(data) {
		provinceText = data.value;
		$.each(industryList, function(i, item) {
			if (provinceText == item.name) {
				cityItem = i;
				return cityItem;
			}
		});
		removeEle(city);
		removeEle(district);
		$.each(industryList[cityItem].list, function(i, item) {
			addEle(city, item.name);
		})
		//重新渲染select 
		form.render('select');
	})

	////选定市或直辖县后 将对应的数据读取追加上
	form.on('select(industry2)', function(data) {
		cityText = data.value;
		removeEle(district);
		$.each(industryList, function(i, item) {
			if (provinceText == item.name) {
				cityItem = i;
				return cityItem;
			}
		});
		$.each(industryList[cityItem].list, function(i, item) {
			if (cityText == item.name) {
				for (var n = 0; n < item.list.length; n++) {
					addEle(district, item.list[n].name);
				}
			}
		})
		//重新渲染select 
		form.render('select');
	})

	////选定市或直辖县后 将对应的数据读取追加上
	form.on('select(industry3)', function(data) {
		smallText = data.value;
		removeEle(small);
		$.each(industryList, function(i, item) {
			if (provinceText == item.name) {
				cityItem = i;
				return cityItem;
			}
		});

		$.each(industryList[cityItem].list, function(i, item) {
			if (cityText == item.name) {
				districtItem = i;
				return districtItem;
			}
		});

		$.each(industryList[cityItem].list[districtItem].list, function(i, item) {
			if (smallText == item.name) {
				smallItem = i;
				return smallItem;
			}
		});
		//console.log(cityItem+" "+districtItem+" "+smallItem)
		//console.log(industryList[cityItem].list[districtItem].list[smallItem])

		$.each(industryList[cityItem].list[districtItem].list[smallItem], function(i, item) {
			
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