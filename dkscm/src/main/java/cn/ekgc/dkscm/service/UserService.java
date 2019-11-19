package cn.ekgc.dkscm.service;

import cn.ekgc.dkscm.pojo.entity.User;

public interface UserService {

	User getUserByCellphone(String cellphone) throws Exception;

}
