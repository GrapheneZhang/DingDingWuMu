/**
 * Created with JetBrains WebStorm.
 * User: dell
 * Date: 14-8-4
 * Time: 下午1:24
 * To change this template use File | Settings | File Templates.
 */
$(function(){
    $(".sidebar ul li ").click(function(){
        $(this).find(".submenu").slideToggle();
    });
    $(".sidebar ul li ul li ").click(function(){
        $(this).find(".submenu").slideToggle();
    });
});