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
	var portal = 0;//门户官网
	var iosClient = 0; //IOS客户端
	var androidClient = 0;//安卓客户端
	var weChat = 0;//微信
	var blog = 0;//微博
	var other = 0;//其它
	var listCount;//全部统计
	var listLastMonthCount;//上月统计
	var listMonthCount;//本月统计
	var listWeekCount;//本周统计
	var listData;
	var val = $(el).val();
	var param = {};
	$.post(getWebRootPath()+"/channelResoule/query", param, function(data) {
		if (val == "全部") {
			listData = data.data.listCount;

			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].regChanCode) {
					case "001":
						portal = listData[i].num;
						break;
					case "002":
						iosClient = listData[i].num;
						break;
					case "003":
						androidClient = listData[i].num;
						break;
					case "004":
						weChat = listData[i].num;
						break;
					case "005":
						blog = listData[i].num;
						break;
					case "006":
						other = listData[i].num;
						break;
					}
				}
			}
		} else if (val == "上月") {
			listData = data.data.listLastMonthCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].regChanCode) {
					case "001":
						portal = listData[i].num;
						break;
					case "002":
						iosClient = listData[i].num;
						break;
					case "003":
						androidClient = listData[i].num;
						break;
					case "004":
						weChat = listData[i].num;
						break;
					case "005":
						blog = listData[i].num;
						break;
					case "006":
						other = listData[i].num;
						break;
					}
				}
			}
		} else if (val == "本月") {
			listData = data.data.listMonthCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].regChanCode) {
					case "001":
						portal = listData[i].num;
						break;
					case "002":
						iosClient = listData[i].num;
						break;
					case "003":
						androidClient = listData[i].num;
						break;
					case "004":
						weChat = listData[i].num;
						break;
					case "005":
						blog = listData[i].num;
						break;
					case "006":
						other = listData[i].num;
						break;
					}
				}
			}
		} else if (val == "本周") {
			listData = data.data.listWeekCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].regChanCode) {
					case "001":
						portal = listData[i].num;
						break;
					case "002":
						iosClient = listData[i].num;
						break;
					case "003":
						androidClient = listData[i].num;
						break;
					case "004":
						weChat = listData[i].num;
						break;
					case "005":
						blog = listData[i].num;
						break;
					case "006":
						other = listData[i].num;
						break;
					}
				}
			}
		}
		var myChart = echarts.init(document.getElementById('main'));
		var option = {
			title : {
				show : true, //是否显示标题组件 （boolean 类型   默认是true）
				text : '用户渠道来源',
				textStyle : {
					color : '#333333',
					fontStyle : 'normal',//normal（默认）   italic oblique
					fontWeight : 'bolder',//normal bold bolder(默认) lighter
					fontFamily : 'sans-serif',
					fontSize : '16'
				},
				left : '60'
			},
			tooltip : {
				trigger : 'item',//没有坐标轴为 item  反之用  axis
				formatter : "{a} <br/>{b}: {c} ({d}%)"
			},
			color : [ '#fe0000', '#ff9c01', '#ffff01', '#00ff01', '#01ffff',
					'#0000fe' ],
			legend : {
				orient : 'vertical',//horizontal vertical
				right : '40',
				data : [ {
					name : '门户网站',
					textStyle : {
						color : '#2e4454'
					}
				}, {
					name : 'IOS手机客户端',
					textStyle : {
						color : '#2e4454'
					}
				}, {
					name : 'Android手机客户端',
					textStyle : {
						color : '#2e4454'
					}
				}, {
					name : '微信',
					textStyle : {
						color : '#2e4454'
					}
				}, {
					name : '微博',
					textStyle : {
						color : '#2e4454'
					}
				}, {
					name : '其他',
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
					name : '门户网站',
					value : portal
				}, {
					name : 'IOS手机客户端',
					value : iosClient
				}, {
					name : 'Android手机客户端',
					value : androidClient
				}, {
					name : '微信',
					value : weChat
				}, {
					name : '微博',
					value : blog
				}, {
					name : '其他',
					value : other
				} //数据对应的值
				]
			} ]
		};

		myChart.setOption(option);
	}, "json");

}