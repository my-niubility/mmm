package com.nbl.services.impl.shiro;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbl.service.manager.app.ManagerShiroApp;
import com.nbl.service.manager.dto.LoginAccountDto;
import com.nbl.service.manager.dto.RoleDto;
import com.nbl.services.shiro.ShiroService;

@Service("shiroService")
public class ShiroServiceImpl implements ShiroService {
	private final static Logger logger = LoggerFactory.getLogger(ShiroServiceImpl.class); 

	@Resource
	private ManagerShiroApp managerShiroApp;

	@Override
	public LoginAccountDto getByUserName(String userName) {
		logger.info("call dubbo service by managerShiroApp.getByUserName(userName)");
		return managerShiroApp.getByUserName(userName);
	}

	@Override
	public Set<String> getRoles(String userName) {
		Set<RoleDto> roleSet = managerShiroApp.getRoles(userName);
		logger.info("call dubbo service by username query roleSet ="+roleSet);
		if(roleSet !=null && roleSet.size()>0){
			//迭代处理
			Iterator<RoleDto> it = roleSet.iterator();
			Set<String> roleStr = new HashSet<String>();
			while(it.hasNext()){
				RoleDto dto = it.next();
				logger.info(" ------------------------roles  by username query roleSet ={}",dto.getRoleId());
				roleStr.add(dto.getRoleId());
			}
			return roleStr;

		}else{
			return null;
		}
	}

	@Override
	public Set<String> getPermissions(String userName) {
		Set<String> permSet = managerShiroApp.getPermissions(userName);
		logger.info("call dubbo service by username query permSet ={}",permSet);
		return permSet;
	}

}
