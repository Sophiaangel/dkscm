package cn.ekgc.dkscm.util;

import java.util.Properties;

public class ConstantUtil {
private static Properties props = new Properties();
	
	static {
		try {
			props.load(ConstantUtil.class.getClassLoader().getResourceAsStream("config/props/dkscm.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static final String STATUS_ENABLE = props.getProperty("status.enable");
	
	public static final String STATUS_DISABLE = props.getProperty("status.disable");
}
