package cn.ekgc.dkscm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.ekgc.dkscm.controller.base.BaseController;
import cn.ekgc.dkscm.pojo.entity.Menu;
import cn.ekgc.dkscm.pojo.entity.Role;
import cn.ekgc.dkscm.pojo.entity.User;
import cn.ekgc.dkscm.service.MenuService;
@Controller("indexController")
public class IndexController extends BaseController{
	@Resource(name = "menuService")
	private MenuService menuService;
	/**
	 * <b>根据当前登录用户的角色，获得对应得菜单列表，转发到首页面</b>
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String index(ModelMap modelMap) throws Exception{
		//获得当前用户登录信息
		User user = (User) session.getAttribute("user");
		//通过当前登录用户信息得到其他角色信息
		Role role = user.getRole();
		//通过角色信息查询该角色所对应得首页菜单列表
		List<Menu> menuList = menuService.getMenuListForIndex(role);
		//将该菜单列表放入ModelMap中，转发到页面
		modelMap.put("menuList", menuList);
		return "index";
	}
}
