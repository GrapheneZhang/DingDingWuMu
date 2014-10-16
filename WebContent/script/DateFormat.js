/**
 * 日期格式化
 * @param format
 * @returns 给Date添加一个format方法
 * 用法:new Date().Format("yyyy年MM月dd日"); 
		new Date().Format("MM/dd/yyyy"); 
		new Date().Format("yyyyMMdd"); 
		new Date().Format("yyyy-MM-dd hh:mm:ss");
		new Date().format("YYYY年MM月dd日hh小时mm分ss秒"); 
 * @author:ZhangYaxu
 * @date 2014/09/25
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	}

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
}