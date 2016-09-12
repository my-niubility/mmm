package com.nbl.services.impl.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.nbl.jspbean.product.ShelfNumberBean;
import com.nbl.jspbean.product.StandardProductBean;
import com.nbl.service.business.constant.ProductShelfNumber;
import com.nbl.service.manager.app.ProductShelfApp;
import com.nbl.service.manager.dto.ProductShelfDto;
import com.nbl.services.product.ShelfManagerService;
@Service("shelfManagerService")
public class ShelfManagerServiceImpl implements ShelfManagerService {
	
	private final static Logger logger = LoggerFactory.getLogger(ShelfManagerServiceImpl.class); 
	@Resource
	private ProductShelfApp productShelfApp;
	
	@Override
	public Map<String, String> getShelfMessage() {
		return null;
	}

	@Override
	public List<StandardProductBean> getAllUpShelfProduct() {
		
		List<StandardProductBean> retList = new ArrayList<StandardProductBean>();	
		//获取所有已上架的产品
		List<ProductShelfDto> list = productShelfApp.getAllUpShelfProduct();
		
		if(list !=null && list.size()>0){
			//处理重复的productId
			Map<String,List<String>> foMap = Maps.newHashMap();
			Map<String,String> nameMap = Maps.newHashMap();
			Iterator<ProductShelfDto> it= list.iterator();
			while(it.hasNext()){
				ProductShelfDto dto = it.next();
				
				List<String> valueList = foMap.get(dto.getProductId());
				
				if(valueList !=null && valueList.size()>0){
					//已存在
					valueList.add(dto.getShelfNum());
					foMap.put(dto.getProductId(),valueList);
				}else{
					//第一次
					valueList = Lists.newArrayList();
					valueList.add(dto.getShelfNum());
					foMap.put(dto.getProductId(),valueList);
				}
				//记录产品名称
				nameMap.put(dto.getProductId(), dto.getProductName());
			}
			
			//处理一个产品拥有的多个货架地点
			Set<String> set = foMap.keySet();
			
			Iterator<String> shelfIt = set.iterator();
			
			while(shelfIt.hasNext()){
				
				StandardProductBean sb = new StandardProductBean();
				ShelfNumberBean snb = new ShelfNumberBean();
				
				String productId = shelfIt.next();
				String productName = nameMap.get(productId);
				sb.setProductId(productId);
				sb.setProductName(productName);
				
				List<String> valList = foMap.get(productId);
				
				for(String shelfNum : valList){
					
					if(ProductShelfNumber.SHELF01.getValue().equals(shelfNum)){
						snb.setShelf1("Y");
					}else if(ProductShelfNumber.SHELF02.getValue().equals(shelfNum)){
						snb.setShelf2("Y");
					}else if(ProductShelfNumber.SHELF03.getValue().equals(shelfNum)){
						snb.setShelf3("Y");
					}else if(ProductShelfNumber.SHELF04.getValue().equals(shelfNum)){
						snb.setShelf4("Y");
					}else if(ProductShelfNumber.SHELF05.getValue().equals(shelfNum)){
						snb.setShelf5("Y");
					}else if(ProductShelfNumber.SHELF06.getValue().equals(shelfNum)){
						snb.setShelf6("Y");
					}else if(ProductShelfNumber.SHELF07.getValue().equals(shelfNum)){
						snb.setShelf7("Y");
					}
				}
				
				sb.setShelfBean(snb);
				retList.add(sb);
			}
		}
		
		return retList;
	}

	@Override
	public boolean setNewProductShelf(String[] shelf1, String[] shelf2, String[] shelf3, String[] shelf4,
			String[] shelf5, String[] shelf6, String[] shelf7) {
		
		Map<String,List<String>> productMap = this.filterProductMap(shelf1, shelf2, shelf3, shelf4, shelf5, shelf6, shelf7);

		Set<String> set = productMap.keySet();
		Iterator<String> it = set.iterator();
		while(it.hasNext()){
			String productId = it.next();
			List<String> list = productMap.get(productId);
			for(String s:list){
				logger.info("----新产品：{}，上架货架数:{}-------",productId,s);
			}
		}
		
		return productShelfApp.setNewProductShelf(productMap);
	}

	
	@Override
	public boolean offAndUpProductShelf(String[] shelf1, String[] shelf2, String[] shelf3, String[] shelf4,
			String[] shelf5, String[] shelf6, String[] shelf7,String[] productAll) {
		
		Map<String,List<String>> productMap = this.filterProductMap(shelf1, shelf2, shelf3, shelf4, shelf5, shelf6, shelf7);
		Set<String> set = productMap.keySet();
		Iterator<String> it = set.iterator();
		while(it.hasNext()){
			String productId = it.next();
			List<String> list = productMap.get(productId);
			for(String s:list){
				logger.info("----已上架产品：{}，调整货架数:{}-------",productId,s);
			}
		}
		
		return productShelfApp.offAndUpProductShelf(productMap,productAll);
	}
	
	/**
	 * @param shelf1
	 * @param shelf2
	 * @param shelf3
	 * @param shelf4
	 * @param shelf5
	 * @param shelf6
	 * @param shelf7
	 * @return
	 * @description:数据过滤
	 */
	private Map<String,List<String>> filterProductMap(String[] shelf1, String[] shelf2, String[] shelf3, String[] shelf4,
			String[] shelf5, String[] shelf6, String[] shelf7){
		
		Map<String,List<String>> productMap = new HashMap<String,List<String>>();
		
		if(shelf1 !=null && shelf1.length>0){
			
			for(String productId:shelf1){
				List<String> retList = productMap.get(productId);
				if (retList !=null && retList.size()>0) {
					
					retList.add("shelf1");
					productMap.put(productId, retList);
				} else {
					List<String> shelf1List = new ArrayList<String>();
					shelf1List.add("shelf1");
					productMap.put(productId, shelf1List);
				}
				
			}
		}
		if(shelf2 !=null && shelf2.length>0){
			
			for(String productId:shelf2){
				
				List<String> retList = productMap.get(productId);
				if(retList !=null && retList.size()>0){
					retList.add("shelf2");
					productMap.put(productId, retList);
				}else{
					List<String> shelf2List = new ArrayList<String>();
					shelf2List.add("shelf2");
					productMap.put(productId, shelf2List);
				}
				
			}
			
		}
		if(shelf3 !=null && shelf3.length>0){
			for(String productId:shelf3){
				
				List<String> retList = productMap.get(productId);
				if(retList !=null && retList.size()>0){
					retList.add("shelf3");
					productMap.put(productId, retList);
				}else{
					List<String> shelf3List = new ArrayList<String>();
					shelf3List.add("shelf3");
					productMap.put(productId, shelf3List);
				}
				
			}

		}
		if(shelf4 !=null && shelf4.length>0){
			for(String productId:shelf4){
				
				List<String> retList = productMap.get(productId);
				if(retList !=null && retList.size()>0){
					retList.add("shelf4");
					productMap.put(productId, retList);
				}else{
					List<String> shelf4List = new ArrayList<String>();
					shelf4List.add("shelf4");
					productMap.put(productId, shelf4List);
				}
				
			}

		}
		if(shelf5 !=null && shelf5.length>0){
			for(String productId:shelf5){
				
				List<String> retList = productMap.get(productId);
				if(retList !=null && retList.size()>0){
					retList.add("shelf5");
					productMap.put(productId, retList);
				}else{
					List<String> shelf5List = new ArrayList<String>();
					shelf5List.add("shelf5");
					productMap.put(productId, shelf5List);
				}
				
			}

		}
		if(shelf6 !=null && shelf6.length>0){
			for(String productId:shelf6){
				
				List<String> retList = productMap.get(productId);
				if(retList !=null && retList.size()>0){
					retList.add("shelf6");
					productMap.put(productId, retList);
				}else{
					List<String> shelf6List = new ArrayList<String>();
					shelf6List.add("shelf6");
					productMap.put(productId, shelf6List);
				}
				
			}

		}
		if(shelf7 !=null && shelf7.length>0){
			for(String productId:shelf7){
				
				List<String> retList = productMap.get(productId);
				if(retList !=null && retList.size()>0){
					retList.add("shelf7");
					productMap.put(productId, retList);
				}else{
					List<String> shelf7List = new ArrayList<String>();
					shelf7List.add("shelf7");
					productMap.put(productId, shelf7List);
				}
				
			}
		}

		return productMap;
		
	}

}
