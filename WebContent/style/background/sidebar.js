/**
 * Created with JetBrains WebStorm.
 * User: dell
 * Date: 14-8-4
 * Time: 下午1:24
 * To change this template use File | Settings | File Templates.
 */
$(function(){
    $(".sidebar ul .li1 ").click(function(){
        $(this).find(".submenu").slideToggle();
    });
    $(".nav-list li").click(function(){
    	$(this).siblings().removeClass("active");
    	$(this).addClass("active");
    });
    $(".submenu li").click(function(){
    	$(this).siblings().removeClass("active");
    	$(this).addClass("active");
    });
  
});