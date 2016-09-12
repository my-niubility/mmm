

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nbl.service.manager.app.ManagerShiroApp;
import com.nbl.service.manager.dto.LoginAccountDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:/spring/applicationContext.xml",
		"classpath*:/spring/dubbo-base.xml"})
public class TestShiroService {

	@Resource
	private ManagerShiroApp managerShiroApp;

	@Test
	public void testFindUserService() {

		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

		LoginAccountDto dto = managerShiroApp.getByUserName("Donald");

		System.out.println("dto=" + dto.toString());

	}


}
