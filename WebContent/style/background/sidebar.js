/**
 * Created with JetBrains WebStorm.
 * User: dell
 * Date: 14-8-4
 * Time: 下午1:24
 * To change this template use File | Settings | File Templates.
 */
$(function(){
    //1 点击一级菜单的时候
    $(".nav-list li").click(function(){
    	//2.1 显示或隐藏二级菜单整体
    	$(this).find(".submenu").slideToggle();
    	//2.2 移除所有一级菜单的active
    	$(this).siblings().removeClass("active");
    	//2.3 移除其他一级菜单下的二级菜单的active
    	$(this).siblings().find("li").removeClass("active");
    	//2.4 给当前一级菜单加上active
    	$(this).addClass("active");
    });
    //2 点击二级菜单的时候
    $(".submenu li a").click(function(){
    	$(this).parent().parent().css("display","block");
    	
    	//1 将本二级机构的display在none和block之间切换
    	//alert($(this).parent().parent());//("display","block");
    	//$(this).parent().parent().prop("style","display:block");
    	//1 移除不是本二级菜单父一级菜单的active
    	//$(this).parent().parent().siblings().removeClass("active");
    	//2 移
    	//$(this).siblings().removeClass("active");
    	//$(this).addClass("active");
    });
  
});