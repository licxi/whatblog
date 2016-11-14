package whatblog;

import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.springframework.util.Base64Utils;

public class MD5Test {
	@Test
	public void test(){
		System.out.println(DigestUtils.md5Hex("417708459"));
		String s = DigestUtils.md5Hex(DigestUtils.md5Hex("417708459")+"Tue Oct 25 09:34:00 CST 2016");
		System.out.println(s);
		System.out.println(Base64Utils.encodeToString(s.getBytes()));
		System.out.println(UUID.randomUUID().toString());
	}
}
