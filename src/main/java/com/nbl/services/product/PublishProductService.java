package com.nbl.services.product;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.product.FinanceExtendsBean;
import com.nbl.jspbean.product.RentRigsterBean;
import com.nbl.jspbean.product.SolarProductPublishBean;
import com.nbl.jspbean.product.SolarProjectPublishBean;
import com.nbl.jspbean.product.StandardProductBean;

/**
 * @author Donald
 * @createdate 2016年7月20日
 * @version 1.0 
 * @description :发布产品接口（包括标准产品、光伏、基金、众筹、信托等产品）
 */
public interface PublishProductService {

	/**
	 * @param pp 产品
	 * @param pj 项目
	 * @param fn 承租人
	 * @param re 租赁物
	 * @return
	 * @description:光伏产品系列
	 */
	public boolean publishSolar(SolarProductPublishBean pp,SolarProjectPublishBean pj,FinanceExtendsBean fn,RentRigsterBean re);
	
	/**
	 * @param standard 产品要素
	 * @return
	 * @description:标准产品系列
	 */
	public boolean publishStandard(StandardProductBean standard);
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<StandardProductBean> queryListStandardProduct(PageVO<StandardProductBean> pageVO,StandardProductBean sb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int queryCountStandardProduct(StandardProductBean sb);
	
	/**
	 * @param productId
	 * @return
	 * @description:产品明细查询
	 */
	public StandardProductBean queryProductDetail(String productId);

	
}
