package cn.ekgc.dkscm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ekgc.dkscm.dao.MenuDao;
import cn.ekgc.dkscm.pojo.entity.Menu;
import cn.ekgc.dkscm.pojo.entity.Role;
import cn.ekgc.dkscm.service.MenuService;
import cn.ekgc.dkscm.util.ConstantUtil;
@Service("menuService")
@Transactional
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDao menuDao;
	public List<Menu> getMenuListForIndex(Role role) throws Exception {
		//将所有的查询条件封装到Map集合中
		Map<String, Object> params = new  HashMap<String, Object>();
		//查询所有的一级菜单
		params.put("parentId", 0L);
		params.put("roleId", role.getRoleId());
		params.put("statusCode", ConstantUtil.STATUS_ENABLE);
		//进行查询操作
		List<Menu> menuList = menuDao.findListByQuery(params);
		//判断一级菜单是否存在，如果存在，遍历一级菜单，获得其对应的二级菜单
		if (menuList != null && menuList.size() > 0) {
			for (Menu parent : menuList) {
				//使用一级菜单的主键，查询二级菜单
				params.put("parentId", parent.getMenuId());
				List<Menu> childList = menuDao.findListByQuery(params);
				parent.setChildList(childList);
			}
		}
		return menuList;
	}

}
