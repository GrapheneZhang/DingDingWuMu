/**
 * 页面需要分页就调用此js即可
 * Author:ZhangYaxu
 * Date:2014.10.14
 */
function Page(pageNum,pageSize){
	this.pageSize=pageSize;
	this.pageNum=pageNum;
	
	//主分页方法
	this.paging=function(){
		//每页显示记录数
		$("#pageSize").val(parseInt(pageSize));//载入时回显
		
		//每页显示记录数改变时
		$("#pageSize").change(function(){//改变时重新加载列表
			$("#page_form").submit();
		});
		
		// 点击导航页码的时候提交
		$(".navigate").click(function(){
			$("#pageNum").val(parseInt($(this).find("a").text()));
			$("#page_form").submit();
		});
		
		//上一页、下一页
		$("#previous").click(function(){
			if($(this).children("a").text()=="无上一页"){
				return false;
			}
			$("#pageNum").val(parseInt(pageNum)-1);
			$("#page_form").submit();
		});
		$("#next").click(function(){
			if($(this).children("a").text()=="无下一页"){
				return false;
			}
			$("#pageNum").val(parseInt(pageNum)+1);
			$("#page_form").submit();
		});
	}
}