package cn.ekgc.dkscm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.ekgc.dkscm.controller.base.BaseController;
@Controller("userController")
@RequestMapping("/user")
public class UserController extends BaseController{
	/**
	 * <b>转发登录界面</b>
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "login",method = RequestMethod.GET)
	
	public String getLoginFrom() throws Exception{
		
		return "user/user_login_form";	
	}
	/**
	 * <b>登录失败之后的重定向</b>
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginError() throws Exception{
		return "redirect:logout";
	}
}
