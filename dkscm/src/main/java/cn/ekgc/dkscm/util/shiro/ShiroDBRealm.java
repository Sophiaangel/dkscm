package cn.ekgc.dkscm.util.shiro;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.ekgc.dkscm.pojo.entity.User;
import cn.ekgc.dkscm.service.UserService;
import cn.ekgc.dkscm.util.ConstantUtil;
import cn.ekgc.dkscm.util.MD5Util;
@Component("shiroDBRealm")
public class ShiroDBRealm extends AuthorizingRealm{
	@Resource(name="userService")
	private UserService userService;
	@Autowired
	private HttpSession session;
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}
/**
 * <b>Shiro进行认证的规则方法</b>
 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) 
			throws AuthenticationException {
		//完成系统登录认证过程
		//Shiro将认证请求交给 ShiroDBRealm的时候，就已经将用户提交的登录信息
		//封装到AuthenticationToken对象中，作为参数传入放方法
		//但是对于原始的AuthenticationToken对象，无法很好地获得请求的用户名和密码
		//因此需要将类型转换未含有用户名和密码信息的UsernamePasswordToken
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		//获得用户在进行登录时候所提交的用户名（手机号）
		String cellphone = token.getUsername();
		//获得用户所提交的登录密码。此时是一个char[]
		char[] pwds = token.getPassword();
		//校验用户提交的数据的有效性
		if (cellphone != null && !"".equals(cellphone.trim()) && 
				pwds != null && pwds.length>0) {
			//用户填写的信息是有效的
			//对于密码进行MD5加密，将toke中的密码后使用加密后更细
			token.setPassword(MD5Util.encrypt(new String(pwds)).toCharArray());
			//使用cellphonr查询正确的用户信息
			try {
				User user = userService.getUserByCellphone(cellphone);
				//判断此时deUser对象是否有效
				if (user != null && ConstantUtil.STATUS_ENABLE.equals(user.getStatus().getStatusCode())) {
					//得到该用户信息，而且该用户允许登录，那么剩下的比较密码的工作，就给Shiro
					SimpleAuthenticationInfo info = new SimpleAuthenticationInfo
							(user.getCellphone(),user.getPassword(),getName());
				//默认登录成功，则绑定HttpSession对象
					session.setAttribute("user", user);
					//返回该info对象，后续工作有Shiro进行
					return info;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
