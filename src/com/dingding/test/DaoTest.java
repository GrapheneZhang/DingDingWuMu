package com.dingding.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dingding.background.domin.User;
import com.dingding.background.service.UserService;

public class DaoTest {
		
			//@Resource
			//public  static UserService ns;
			private static ApplicationContext ctx;
			static
			{
			//在类路径下寻找resources/beans.xml文件
			ctx = new ClassPathXmlApplicationContext(new String[]{"classpath:resources/springMVC-servlet.xml","classpath:resources/mybatis-spring.xml"});
			}
			public static void main(String ag[]){
					
					System.out.println("进入主程序开始执行。。。。。。。。。。。。");
					User user=new User();
					user.setIdCard("222222222222222222");
					user.setLoginName("zhang");
					user.setPassword("zhang123");
					user.setUserName("春生");
					/*使用注解的方式也是将是用默认名进行生成spring的bean*/
					UserService ns=(UserService)ctx.getBean("userServiceImpl");
					ns.add(user);
					System.out.println("添加数据成功！！");
			}
}
