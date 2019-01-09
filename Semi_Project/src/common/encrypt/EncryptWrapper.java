package common.encrypt;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getParameter(String key) {
		String value="";
		
		if(key != null  && (key.equals("password") || key.equals("password_new"))) {
			value = super.getParameter(key);
			value = getSha512(value);
			
		}else {
			value = super.getParameter(key);
		}
		
		
		return value;
		
	}
	
	private static String getSha512(String password) {
		String encPwd = "";
		MessageDigest md = null;
		
		try {
			md=MessageDigest.getInstance("SHA-512");
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes=password.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}
	
}
