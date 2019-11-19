package cn.ekgc.dkscm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ekgc.dkscm.dao.UserDao;
import cn.ekgc.dkscm.pojo.entity.User;
import cn.ekgc.dkscm.service.UserService;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	public User getUserByCellphone(String cellphone) throws Exception {
		//在数据持久层，将会把所有的查询都进行集成，那么需要封装查询参数
		Map<String, Object> params = new HashMap<String, Object>();
		//设定查询参数
		params.put("cellphone", cellphone);
		//进行查询，得到结果集
		List<User> userList = userDao.findByQueryForPage(params);
		//判断结果集中是否有数据，如果有，也只能有一个
		if (userList != null && userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}

}
