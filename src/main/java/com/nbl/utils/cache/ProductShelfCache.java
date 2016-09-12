package com.nbl.utils.cache;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nbl.services.product.ShelfManagerService;

/**
 * @author Donald
 * @createdate 2016年7月27日
 * @version 1.0 
 * @description :产品货架缓存
 */
@Service("productShelfCache")
public class ProductShelfCache {
	private final static Logger logger = LoggerFactory.getLogger(ProductShelfCache.class); 

	@Resource
	private ShelfManagerService shelfManagerService;
	private static Map<String,String> map = null;
	
	public Map<String,String> getShelfCache(){
		
		if(map == null){
			logger.info("----数据为空----");
			synchronized(ProductShelfCache.class){
				
				if(map == null){
					logger.info("-----双层检测,获取数据-----");
					map = shelfManagerService.getShelfMessage();
				}
			}
		}
		logger.info("-----数据不为空直接获取-----");
		return map;
	}
	
}
