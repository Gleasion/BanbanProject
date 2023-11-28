package kr.or.ddit.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {

	private static SqlSessionFactory sessionFactory;
	
	static {
		
		try {
			Charset charset = Charset.forName("UTF-8"); // 설정파일에 있는 한글처리를 위해서...
			Resources.setCharset(charset);

			Reader rd = Resources.getResourceAsReader("config/mybatis-config.xml");

			sessionFactory = new SqlSessionFactoryBuilder().build(rd);

			rd.close();

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSession getInstance() {
		return sessionFactory.openSession(); // 기본값: autoCommit => false
	}
	
	public static SqlSession getInstance(boolean autoCommit) {
		return sessionFactory.openSession(autoCommit);
	}

}
