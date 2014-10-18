/**
 * 页面需要分页就调用此js即可<br>
 * 设计思想是：操作form_page的同时提交分页和搜索两个form<br>
 * 1如果有form_search就提交此form然后顺带page_form<br>
 * 2如果没有form_search就直接提交page_form<br>
 * 要求：list页面的form_search和form_page都要写好action<br>
 * @param pageNum
 * @param pageSize
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
			if($("#form_search")!=null){
				$("#form_search").attr("action",$("#form_search").attr("action")+"?"+$("#page_form").serialize());
				$("#form_search").submit();
			}else{
				$("#page_form").submit();
			}
		});
		
		// 点击导航页码的时候提交
		$(".navigate").click(function(){
			$("#pageNum").val(parseInt($(this).find("a").text()));
			if($("#form_search")!=null){
				$("#form_search").attr("action",$("#form_search").attr("action")+"?"+$("#page_form").serialize());
				$("#form_search").submit();
			}else{
				$("#page_form").submit();
			}
		});
		
		//上一页、下一页
		$("#previous").click(function(){
			if($(this).children("a").text()=="无上一页"){
				return false;
			}
			$("#pageNum").val(parseInt(pageNum)-1);
			
			if($("#form_search")!=null){
				$("#form_search").attr("action",$("#form_search").attr("action")+"?"+$("#page_form").serialize());
				$("#form_search").submit();
			}else{
				$("#page_form").submit();
			}
		});
		$("#next").click(function(){
			if($(this).children("a").text()=="无下一页"){
				return false;
			}
			$("#pageNum").val(parseInt(pageNum)+1);
			
			if($("#form_search")!=null){
				$("#form_search").attr("action",$("#form_search").attr("action")+"?"+$("#page_form").serialize());
				$("#form_search").submit();
			}else{
				$("#page_form").submit();
			}
		});
	}
}