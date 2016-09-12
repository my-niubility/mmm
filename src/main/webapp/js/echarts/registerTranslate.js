function getWebRootPath() {
	var webroot = document.location.href;
	var path = "";
	webroot = webroot.substring(webroot.indexOf('//') + 2, webroot.length);
	webroot = webroot.substring(webroot.indexOf('/') + 1, webroot.length);
	webroot = webroot.substring(0, webroot.indexOf('/'));
	if(webroot == "zlebank-energy-manager"){
		path = "/"+webroot;
	}else{
		path = path;
	}
	return path;
}

function queryAll(el) {
	var certCount;
	var noCertCount;
	var val = $(el).val();
	var param = {};
	$.post(getWebRootPath()+"/registerTranslate/query", param, function(data) {
		if (val == "全部") {
			certCount = data.data.certCount;
			noCertCount = data.data.noCertCount;
		} else if (val == "上月") {
			certCount = data.data.lastMonthCount;
			noCertCount = data.data.noLastMonthCount;
		} else if (val == "本月") {
			certCount = data.data.MonthCount;
			noCertCount = data.data.noMonthCount;
		} else if (val == "本周") {
			certCount = data.data.weekCount;
			noCertCount = data.data.noWeekCount;
		}
		var myChart = echarts.init(document.getElementById('main'));
		var option = {
			title : {
				show : true, //是否显示标题组件 （boolean 类型   默认是true）
				text : '注册实名失败成功对比图',
				textStyle : {
					color : '#333333',
					fontStyle : 'normal',//normal（默认）   italic oblique
					fontWeight : 'bolder',//normal bold bolder(默认) lighter
					fontFamily : 'sans-serif',
					fontSize : '16'
				},
				left : '60'
			//textAlign:'right'//标题文本水平对齐，支持 'left', 'center', 'right'，默认根据标题位置决定
			//textBaseline:'top' //标题文本垂直对齐，支持 'top', 'middle', 'bottom'，默认根据标题位置决定。
			},
			tooltip : {
				trigger : 'item',//没有坐标轴为 item  反之用  axis
				formatter : "{a} <br/>{b}: {c} ({d}%)"
			},
			color : [ '#00ff01', '#fe0000' ],
			legend : {
				orient : 'vertical',//horizontal vertical
				right : '40',
				data : [ {
					name : '实名成功',
					textStyle : {
						color : '#2e4454'
					}
				}, {
					name : '实名失败',
					textStyle : {
						color : '#2e4454'
					}
				} ]
			},
			series : [ {
				name : '实名来源',
				type : 'pie',
				radius : [ '50%', '70%' ],//环型参数   内半径  外半径
				avoidLabelOverlap : false,
				label : {
					normal : {
						show : false,
						position : 'center'//outside属性 data字体显示在环形外侧    center 环形中心  inner 环形内侧

					},
					emphasis : {
						show : true,
						textStyle : {
							fontSize : '30',
							fontWeight : 'bold'
						}
					}
				},
				labelLine : {
					normal : {
						show : false,
					}
				},
				data : [ {
					name : '实名成功',
					value : certCount
				}, {
					name : '实名失败',
					value : noCertCount
				} //数据对应的值
				]
			} ]
		};

		myChart.setOption(option);
	}, "json");

}