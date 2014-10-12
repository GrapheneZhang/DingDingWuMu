package com.dingding.background.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dingding.background.base.BaseController;
import com.dingding.background.domin.User;
import com.dingding.background.service.UserService;
import com.dingding.utils.page.PageHelper;
import com.dingding.utils.page.PageInfo;

/**
 * User的Controller层接口
 * @author zcs
 * 2014-9-21
 */
@Controller
@RequestMapping(value="/user",method={RequestMethod.GET,RequestMethod.POST})//此类全局路径
public class UserController extends BaseController{
	
	@Resource
	public UserService userService;//Service支持
	public ModelAndView mav;//模型视图
	public User user=null;
	
	
	/*****************ProcessingStart******************/
	
	/**1
	 * Describe:条件查询
	 * Parameters:
	 * @return:ModelAndView
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest req,User user){
		mav=new ModelAndView("background/user/userlist2");
		try {
			String str_pageNum = req.getParameter("pageNum")==null?"1":req.getParameter("pageNum");
			String str_pageSize = req.getParameter("pageSize")==null?"10":req.getParameter("pageSize");
			
			int pageNum = 0,pageSize = 0;
			
			pageNum = Integer.parseInt(str_pageNum);
			pageSize = Integer.parseInt(str_pageSize);
			// 分页:页码，每页显示数量
			PageHelper.startPage(pageNum, pageSize);
			
			List<User> userList=userService.list(user);
			
			PageInfo<User> page = new PageInfo(userList);
			mav.addObject("userList", userList);
			mav.addObject("user", user);//条件查询
			mav.addObject("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**2.1
	 * Describe:新增页面
	 * Parameters:
	 * @return:ModelAndView
	 */
	@RequestMapping(value="/addUI")
	public String addUI(){
		/*try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return "background/user/useradd";
	}
	/**2.2
	 * Describe:新增
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/add")
	public String add(User user){
		try {
			userService.add(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/list";
	}
	
	/**3
	 * Describe:删除
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/delete")
	public String delete(int id){
		try {
			userService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/list";
	}
	
	/**4.1
	 * Describe:修改页面
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/updateUI")
	public ModelAndView updateUI(int id){
		mav=new ModelAndView("background/user/userupdate");
		try {
			User user=userService.getById(id);
			mav.addObject("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	/**4.2
	 * Describe:修改
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/update")
	public void update(HttpServletResponse response,User user){
		try {
			boolean result=false;
			result=userService.update(user);
			PrintWriter writer=response.getWriter();
			writer.write(String.valueOf(result));
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**5.1
	 * Describe:登录页面
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/loginUI")
	public String loginUI(){
		return "background/user/login";
	} 
	/**5.2
	 * Describe:登录后台
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/login")
	public String login(HttpServletResponse response,HttpServletRequest request,User loginUser){
		String result="";
		try {
			HttpSession session=request.getSession();
			User user=userService.login(loginUser);
			if (user!=null) {
				session.setAttribute("user", user);//将登录的用户放入session
				result="background/mainframe/index";
			}else{//账户密码错误的时候
				if(session!=null)
					session.invalidate();			
				request.setAttribute("message", "您输入的账户或者密码不正确，请重新确认");
				result="background/user/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**5.3
	 * Describe:注销回到登录界面
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request){
		try {
			//清除session内容
			request.getSession(true).invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/loginUI";
	}
	
	/**6.1
	 * Describe:跳转到框架子页top
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/top")
	public String top(HttpServletRequest request){
		return "background/mainframe/top";
	}
	/**6.2
	 * Describe:跳转到框架子页top
	 * Parameters:
	 * @return:String
	 */
	@RequestMapping(value="/sider")
	public String sider(HttpServletRequest request){
		return "background/mainframe/sider";
	}
	
	
	/**10 唯一性验证**/
	@RequestMapping("/checkUnique")
	public void checkUnique(HttpServletResponse response,
			String loginName,String idCard,Integer updateId){//修改的id
		
		boolean result=false;//结果
		try {
			//1、loginName
			if(StringUtils.isNotBlank(loginName)){
				loginName=loginName.trim();//新名字trim
				String oldName="";//老名字
				if(null!=updateId){//修改时候的操作：获取要修改的实体
					oldName = userService.getById(updateId).getLoginName();
				}
				//操作
				if(StringUtils.isNotBlank(oldName)&&oldName.equals(loginName)){//1 修改自身情况
					result=true;
				}else{//2 新增和修改为其他情况
					result=userService.countByLoginName(loginName);
				}
			}
			//2、idCard
			if(StringUtils.isNotBlank(idCard)){
				idCard=idCard.trim();//新名字trim
				String oldName="";//老名字
				if(null!=updateId){//修改时候的操作：获取要修改的实体
					oldName = userService.getById(updateId).getIdCard();
				}
				//操作
				if(StringUtils.isNotBlank(oldName)&&oldName.equals(idCard)){//1 修改自身情况
					result=true;
				}else{//2 新增和修改为其他情况
					result=userService.countByIdCard(idCard);
				}
			}
			//4、返回结果
			PrintWriter writer=response.getWriter();
			writer.write(String.valueOf(result));
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
