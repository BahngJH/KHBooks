package common.encrypt;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Base64;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest req) {
		super(req);
	}

	@Override
	public String getParameter(String key)
	{
		String value="";
		//key.contains("password");
		if(key!=null && (key.equals("password") || key.equals("password_new")))
		{
			value = super.getParameter(key);
			value = getSha512(value);
		}
		else {
			value = super.getParameter(key);
		}
		return value;
	}
	
	private static String getSha512(String password) {
		String encPwd = "";
		//sha512방식의 암호화 객체 생성
		//암호화 하는 객체
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		}catch (Exception e) {
			e.printStackTrace();
		}
		//위에서 받은 패스워드를 바이트 단위로 쪼개고 update로 암호화 돌리는것
		byte[] bytes = password.getBytes(Charset.forName("utf-8"));
		md.update(bytes);
		//다시 String으로 바꾸는 작업
		encPwd = Base64.getEncoder().encodeToString(md.digest());
	    
		return encPwd;
		
	}
}
