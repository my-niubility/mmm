package com.nbl.services.product;

import java.util.List;
import java.util.Map;

import com.nbl.jspbean.product.StandardProductBean;
/**
 * @author Donald
 * @createdate 2016年7月28日
 * @version 1.0 
 * @description :货架管理服务（上架、下架、调架）
 */
public interface ShelfManagerService {
	
	/**
	 * @return
	 * @description:获得所有货架
	 */
	public Map<String,String> getShelfMessage();
	
	/**
	 * @return
	 * @description:获取已经上架的产品及其所在的货架
	 */
	public List<StandardProductBean> getAllUpShelfProduct();
	
	/**
	 * @param shelf1
	 * @param shelf2
	 * @param shelf3
	 * @param shelf4
	 * @param shelf5
	 * @param shelf6
	 * @param shelf7
	 * @return
	 * @description:新品上架
	 */
	public boolean setNewProductShelf(String[] shelf1,String[] shelf2,String[] shelf3,String[] shelf4,String[] shelf5,String[] shelf6,String[] shelf7);

	/**
	 * @param shelf1
	 * @param shelf2
	 * @param shelf3
	 * @param shelf4
	 * @param shelf5
	 * @param shelf6
	 * @param shelf7
	 * @param productAll
	 * @return
	 * @description:已上架产品管理（下架或调架）
	 */
	public boolean offAndUpProductShelf(String[] shelf1,String[] shelf2,String[] shelf3,String[] shelf4,String[] shelf5,String[] shelf6,String[] shelf7,String[] productAll);
	
}
