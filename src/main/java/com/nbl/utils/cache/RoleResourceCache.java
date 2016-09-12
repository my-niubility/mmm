package com.nbl.utils.cache;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbl.service.manager.constant.SystemType;
import com.nbl.services.role.RoleManagerService;
@Service
public class RoleResourceCache {
	private final static Logger logger = LoggerFactory.getLogger(RoleResourceCache.class); 

	@Resource
	private RoleManagerService roleManagerService;
	private static List<String> resourceIdList = null;
	
	public List<String> getResourceCache(SystemType systemType){
		
		if(resourceIdList == null){
			logger.info("----数据为空----");
			synchronized(RoleResourceCache.class){
				
				if(resourceIdList == null){
					logger.info("-----双层检测,获取数据-----");
					resourceIdList = roleManagerService.getResourceIdCache(systemType);
				}
				
			}
			
		}
		logger.info("-----数据不为空直接获取-----");
		return resourceIdList;
	}
	
	
}
