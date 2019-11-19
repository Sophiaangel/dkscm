package cn.ekgc.dkscm.dao;

import java.util.List;
import java.util.Map;

import cn.ekgc.dkscm.pojo.entity.Menu;

public interface MenuDao {

	List<Menu> findListByQuery(Map<String, Object> params) throws Exception;

	

}
