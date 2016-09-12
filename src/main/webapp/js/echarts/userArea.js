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
	var bj = 0;//北京市  1
	var tj = 0; //天津市  2
	var sh = 0;//上海市 3
	var cq = 0;//重庆市 4
	var hbs = 0;//河北省石家庄 5
	var sxt = 0;//山西省太原 6
	var ln = 0;//辽宁省 7
	var jl = 0;//吉林省 8
	var hlj = 0;//黑龙江省 9
	var js = 0;//江苏省 10
	var zj = 0;//浙江省 11
	var af = 0;//安徽省 12
	var fj = 0;//福建省 13
	var jx = 0;//江西省 14
	var sd = 0;//山东省 15
	var hnz = 0; //河南省郑州 16
	var hbw = 0;//湖北省武汉 17
	var hnc = 0;//湖南省长沙 18
	var gd = 0;//广东省 19
	var hnh = 0;//海南省海口 20
	var sc = 0;//四川省 21
	var gz = 0;//贵州省 22
	var yn = 0;//云南省 23
	var sxx = 0;//陕西省西安 24
	var gs = 0;//甘肃省 25
	var qh = 0;//青海省 26
	var tw = 0;//台湾省 27
	var nmg = 0;//内蒙古自治区 28
	var gx = 0;//广西壮族自治区 29
	var xz = 0;//西藏自治区 30
	var nx = 0;//宁夏回族自治区 31 
	var xj = 0;//新疆维吾尔自治区 32
	var xg = 0;//香港特别行政区 33
	var am = 0;//澳门特别行政区 34
	var listAreaCount;//全部统计
	var listLastMonthAreaCount;//上月统计
	var listMonthAreaCount;//本月统计
	var listWeekAreaCount;//本周统计
	var listData;
	var val = $(el).val();
	var param = {};
	$.post(getWebRootPath()+"/userArea/query", param, function(data) {
		if (val == "全部") {
			listData = data.data.listAreaCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].cityCode) {
					case "1":
						bj = listData[i].num;
						break;
					case "2":
						tj = listData[i].num;
						break;
					case "3":
						sh = listData[i].num;
						break;
					case "4":
						cq = listData[i].num;
						break;
					case "5":
						hbs = listData[i].num;
						break;
					case "6":
						sxt = listData[i].num;
						break;
					case "7":
						ln = listData[i].num;
						break;
					case "8":
						jl = listData[i].num;
						break;
					case "9":
						hlj = listData[i].num;
						break;
					case "10":
						js = listData[i].num;
						break;
					case "11":
						zj = listData[i].num;
						break;
					case "12":
						af = listData[i].num;
						break;
					case "13":
						fj = listData[i].num;
						break;
					case "14":
						jx = listData[i].num;
						break;
					case "15":
						sd = listData[i].num;
						break;
					case "16":
						hnz = listData[i].num;
						break;
					case "17":
						hbw = listData[i].num;
						break;
					case "18":
						hnc = listData[i].num;
						break;
					case "19":
						gd = listData[i].num;
						break;
					case "20":
						hnh = listData[i].num;
						break;
					case "21":
						sc = listData[i].num;
						break;
					case "22":
						gz = listData[i].num;
						break;
					case "23":
						yn = listData[i].num;
						break;
					case "24":
						sxx = listData[i].num;
						break;
					case "25":
						gs = listData[i].num;
						break;
					case "26":
						qh = listData[i].num;
						break;
					case "27":
						tw = listData[i].num;
						break;
					case "28":
						nmg = listData[i].num;
						break;
					case "29":
						gx = listData[i].num;
						break;
					case "30":
						xz = listData[i].num;
						break;
					case "31":
						nx = listData[i].num;
						break;
					case "32":
						xj = listData[i].num;
						break;
					case "33":
						xg = listData[i].num;
						break;
					case "34":
						am = listData[i].num;
						break;

					}
				}
			}
		} else if (val == "上月") {
			listData = data.data.listLastMonthAreaCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].cityCode) {
					case "1":
						bj = listData[i].num;
						break;
					case "2":
						tj = listData[i].num;
						break;
					case "3":
						sh = listData[i].num;
						break;
					case "4":
						cq = listData[i].num;
						break;
					case "5":
						hbs = listData[i].num;
						break;
					case "6":
						sxt = listData[i].num;
						break;
					case "7":
						ln = listData[i].num;
						break;
					case "8":
						jl = listData[i].num;
						break;
					case "9":
						hlj = listData[i].num;
						break;
					case "10":
						js = listData[i].num;
						break;
					case "11":
						zj = listData[i].num;
						break;
					case "12":
						af = listData[i].num;
						break;
					case "13":
						fj = listData[i].num;
						break;
					case "14":
						jx = listData[i].num;
						break;
					case "15":
						sd = listData[i].num;
						break;
					case "16":
						hnz = listData[i].num;
						break;
					case "17":
						hbw = listData[i].num;
						break;
					case "18":
						hnc = listData[i].num;
						break;
					case "19":
						gd = listData[i].num;
						break;
					case "20":
						hnh = listData[i].num;
						break;
					case "21":
						sc = listData[i].num;
						break;
					case "22":
						gz = listData[i].num;
						break;
					case "23":
						yn = listData[i].num;
						break;
					case "24":
						sxx = listData[i].num;
						break;
					case "25":
						gs = listData[i].num;
						break;
					case "26":
						qh = listData[i].num;
						break;
					case "27":
						tw = listData[i].num;
						break;
					case "28":
						nmg = listData[i].num;
						break;
					case "29":
						gx = listData[i].num;
						break;
					case "30":
						xz = listData[i].num;
						break;
					case "31":
						nx = listData[i].num;
						break;
					case "32":
						xj = listData[i].num;
						break;
					case "33":
						xg = listData[i].num;
						break;
					case "34":
						am = listData[i].num;
						break;

					}
				}
			}
		} else if (val == "本月") {
			listData = data.data.listMonthAreaCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].cityCode) {
					case "1":
						bj = listData[i].num;
						break;
					case "2":
						tj = listData[i].num;
						break;
					case "3":
						sh = listData[i].num;
						break;
					case "4":
						cq = listData[i].num;
						break;
					case "5":
						hbs = listData[i].num;
						break;
					case "6":
						sxt = listData[i].num;
						break;
					case "7":
						ln = listData[i].num;
						break;
					case "8":
						jl = listData[i].num;
						break;
					case "9":
						hlj = listData[i].num;
						break;
					case "10":
						js = listData[i].num;
						break;
					case "11":
						zj = listData[i].num;
						break;
					case "12":
						af = listData[i].num;
						break;
					case "13":
						fj = listData[i].num;
						break;
					case "14":
						jx = listData[i].num;
						break;
					case "15":
						sd = listData[i].num;
						break;
					case "16":
						hnz = listData[i].num;
						break;
					case "17":
						hbw = listData[i].num;
						break;
					case "18":
						hnc = listData[i].num;
						break;
					case "19":
						gd = listData[i].num;
						break;
					case "20":
						hnh = listData[i].num;
						break;
					case "21":
						sc = listData[i].num;
						break;
					case "22":
						gz = listData[i].num;
						break;
					case "23":
						yn = listData[i].num;
						break;
					case "24":
						sxx = listData[i].num;
						break;
					case "25":
						gs = listData[i].num;
						break;
					case "26":
						qh = listData[i].num;
						break;
					case "27":
						tw = listData[i].num;
						break;
					case "28":
						nmg = listData[i].num;
						break;
					case "29":
						gx = listData[i].num;
						break;
					case "30":
						xz = listData[i].num;
						break;
					case "31":
						nx = listData[i].num;
						break;
					case "32":
						xj = listData[i].num;
						break;
					case "33":
						xg = listData[i].num;
						break;
					case "34":
						am = listData[i].num;
						break;

					}
				}
			}
		} else if (val == "本周") {
			listData = data.data.listWeekAreaCount;
			if (listData && listData.length > 0) {
				for (var i = 0; i < listData.length; i++) {
					switch (listData[i].cityCode) {
					case "1":
						bj = listData[i].num;
						break;
					case "2":
						tj = listData[i].num;
						break;
					case "3":
						sh = listData[i].num;
						break;
					case "4":
						cq = listData[i].num;
						break;
					case "5":
						hbs = listData[i].num;
						break;
					case "6":
						sxt = listData[i].num;
						break;
					case "7":
						ln = listData[i].num;
						break;
					case "8":
						jl = listData[i].num;
						break;
					case "9":
						hlj = listData[i].num;
						break;
					case "10":
						js = listData[i].num;
						break;
					case "11":
						zj = listData[i].num;
						break;
					case "12":
						af = listData[i].num;
						break;
					case "13":
						fj = listData[i].num;
						break;
					case "14":
						jx = listData[i].num;
						break;
					case "15":
						sd = listData[i].num;
						break;
					case "16":
						hnz = listData[i].num;
						break;
					case "17":
						hbw = listData[i].num;
						break;
					case "18":
						hnc = listData[i].num;
						break;
					case "19":
						gd = listData[i].num;
						break;
					case "20":
						hnh = listData[i].num;
						break;
					case "21":
						sc = listData[i].num;
						break;
					case "22":
						gz = listData[i].num;
						break;
					case "23":
						yn = listData[i].num;
						break;
					case "24":
						sxx = listData[i].num;
						break;
					case "25":
						gs = listData[i].num;
						break;
					case "26":
						qh = listData[i].num;
						break;
					case "27":
						tw = listData[i].num;
						break;
					case "28":
						nmg = listData[i].num;
						break;
					case "29":
						gx = listData[i].num;
						break;
					case "30":
						xz = listData[i].num;
						break;
					case "31":
						nx = listData[i].num;
						break;
					case "32":
						xj = listData[i].num;
						break;
					case "33":
						xg = listData[i].num;
						break;
					case "34":
						am = listData[i].num;
						break;

					}
				}
			}
		}
		var myChart = echarts.init(document.getElementById('main'));
		var option = {
			title : {
				text : '用户地域来源',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',//没有坐标轴为 item  反之用  axis
			},
			legend : {
				orient : 'vertical',//horizontal vertical
				x : 'left',
			},
			dataRange : {
				x : 'left',
				y : 'bottom',
				splitList : [ 
				   {start : 1500},
				   {start : 900,end : 1500}, 
				   {start : 310,end : 1000}, 
				   {start : 200,end : 300}, 
				   {start : 10,end : 200,label : '10 到 200（自定义label）'}, 
				   {start : 5,end : 5,label : '5（自定义特殊颜色）',color : 'black'}, 
				   {start : 1,end : 10},
				   {start : 0,end : 0,color : '#ababab'}
				   ],
				color : [ '#E0022B', '#E09107', '#A3E00B' ]
			},
			toolbox : {
				show : true,
				orient : 'vertical',
				x : 'right',
				y : 'center',
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			roamController : {
				show : true,
				x : 'right',
				mapTypeControl : {
					'china' : true
				}
			},
			series : [ {
				name : '用户地域来源',
				type : 'map',
				mapType : 'china',
				itemStyle : {
					normal : {
						label : {
							show : true,
							textStyle : {
								color : "rgb(249, 249, 249)"
							}
						}
					},
					emphasis : {
						label : {
							show : true
						}
					}
				},
				roam : false,//是否开启鼠标缩放和平移漫游   默认为false 不开启
				label : {
					normal : {
						show : true

					},
					emphasis : {
						show : true
					}
				},
				data : [ {
					name : "北京",
					value : bj
				}, {
					name : '天津',
					value : tj
				}, {
					name : '上海',
					value : sh
				}, {
					name : '重庆',
					value : cq
				}, {
					name : '河北',
					value : hbs
				}, {
					name : '山西',
					value : sxt
				}, {
					name : '辽宁',
					value : ln
				}, {
					name : '吉林',
					value : jl
				}, {
					name : '黑龙江',
					value : hlj
				}, {
					name : '江苏',
					value : js
				}, {
					name : '浙江',
					value : zj
				}, {
					name : '安徽',
					value : af
				}, {
					name : '福建',
					value : fj
				}, {
					name : '江西',
					value : jx
				}, {
					name : '山东',
					value : sd
				}, {
					name : '河南',
					value : hnz
				}, {
					name : '湖北',
					value : hbw
				}, {
					name : '湖南',
					value : hnc
				}, {
					name : '广东',
					value : gd
				}, {
					name : '海南',
					value : hnh
				}, {
					name : '四川',
					value : sc
				}, {
					name : '贵州',
					value : gz
				}, {
					name : '云南',
					value : yn
				}, {
					name : '陕西',
					value : sxx
				}, {
					name : '甘肃',
					value : gs
				}, {
					name : '青海',
					value : qh
				}, {
					name : '台湾',
					value : tw
				}, {
					name : '内蒙古',
					value : nmg
				}, {
					name : '广西',
					value : gx
				}, {
					name : '西藏',
					value : xz
				}, {
					name : '宁夏',
					value : nx
				}, {
					name : '新疆',
					value : xj
				}, {
					name : '香港',
					value : xg
				}, {
					name : '澳门',
					value : am
				} ]
			} ]
		};

		myChart.setOption(option);
	}, "json");

}