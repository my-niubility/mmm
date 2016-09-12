package com.nbl.services.impl.product;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.product.FinanceExtendsBean;
import com.nbl.jspbean.product.RentRigsterBean;
import com.nbl.jspbean.product.SolarProductPublishBean;
import com.nbl.jspbean.product.SolarProjectPublishBean;
import com.nbl.jspbean.product.StandardProductBean;
import com.nbl.service.business.app.PublishProductApp;
import com.nbl.service.business.dto.req.PublishSolarFinanceDto;
import com.nbl.service.business.dto.req.PublishSolarProductDto;
import com.nbl.service.business.dto.req.PublishSolarProjectDto;
import com.nbl.service.business.dto.req.PublishSolarRentDto;
import com.nbl.service.business.dto.req.PublishStandardProductDto;
import com.nbl.service.business.dto.req.StandardProductQueryDto;
import com.nbl.service.business.dto.res.PublishResultDto;
import com.nbl.service.manager.app.StandardProductQueryApp;
import com.nbl.services.product.PublishProductService;
/**
 * @author Donald
 * @createdate 2016年7月20日
 * @version 1.0 
 * @description :产品发布接口实现
 */
@Service("publishProductService")
public class PublishProductServiceImpl implements PublishProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(PublishProductServiceImpl.class);

	@Resource
	private PublishProductApp publishProductApp;
	@Resource
	private StandardProductQueryApp standardProductQueryApp;
	
	/**
	 * @param pp 产品
	 * @param pj 项目
	 * @param fn 承租人
	 * @param re 租赁物
	 * @return
	 * @description:光伏产品系列
	 */
	@Override
	public boolean publishSolar(SolarProductPublishBean pp, SolarProjectPublishBean pj, FinanceExtendsBean fn,
			RentRigsterBean re) {
		
		PublishSolarProductDto productDto = this.getProductDto(pp);
		
		PublishSolarProjectDto projectDto = this.getProjectDto(pj);
		
		PublishSolarFinanceDto financeDto = this.getFinanceDto(fn);
		
		PublishSolarRentDto rentDto = this.getRentDto(re);
		
		publishProductApp.publishSolarProduct(productDto, projectDto, financeDto, rentDto);
		return true;
	}
	
	/**
	 * @param standard 产品要素
	 * @return
	 * @description:标准产品系列
	 */
	@Override
	public boolean publishStandard(StandardProductBean standard) {
		PublishStandardProductDto  standardDto = new PublishStandardProductDto();
		//赋值拷贝
		BeanUtils.copyProperties(standard,standardDto);
		PublishResultDto resultDto = publishProductApp.publishStandardProduct(standardDto);
		return resultDto.isFlag();
	}


	/**
	 * @param pp
	 * @return
	 * @description:产品要素转换
	 */
	private PublishSolarProductDto getProductDto(SolarProductPublishBean pp){
		PublishSolarProductDto productDto = new PublishSolarProductDto();
		BeanUtils.copyProperties(pp, productDto);
		return productDto;
	}
	
	/**
	 * @param pj
	 * @return
	 * @description:项目要素转换
	 */
	private PublishSolarProjectDto getProjectDto(SolarProjectPublishBean pj){
		
		PublishSolarProjectDto projectDto = new PublishSolarProjectDto();
		
		BeanUtils.copyProperties(pj, projectDto);
		return projectDto;
	}
	
	/**
	 * @param fn
	 * @return
	 * @description:承租人要素转换
	 */
	private PublishSolarFinanceDto getFinanceDto(FinanceExtendsBean fn){
		
		PublishSolarFinanceDto financeDto = new PublishSolarFinanceDto();
		BeanUtils.copyProperties(fn, financeDto);
		
		return financeDto;
	}
	
	/**
	 * @param re
	 * @return
	 * @description:租赁物要素转换
	 */
	private PublishSolarRentDto getRentDto(RentRigsterBean re){
		
		PublishSolarRentDto rentDto = new PublishSolarRentDto();
		BeanUtils.copyProperties(re, rentDto);
		return rentDto;
		
	}

	//分页查询
	@Override
	public List<StandardProductBean> queryListStandardProduct(PageVO<StandardProductBean> pageVO,StandardProductBean sb) {
		StandardProductQueryDto reqDto = new StandardProductQueryDto();
		PageVO<StandardProductQueryDto> pVO = new PageVO<StandardProductQueryDto>();
		BeanUtils.copyProperties(sb, reqDto);
		BeanUtils.copyProperties(pageVO, pVO);
		List<StandardProductQueryDto> list = new ArrayList<StandardProductQueryDto>(); 
		list.add(reqDto);
		pVO.setList(list);
		List<StandardProductQueryDto> retList = standardProductQueryApp.pageListQueryStProduct(pVO, reqDto);
		
		if(retList !=null){
			
			List<StandardProductBean> staList = new ArrayList<StandardProductBean>();
			
			Iterator<StandardProductQueryDto> it = retList.iterator();
			
			while(it.hasNext()){
				StandardProductBean retCb = new StandardProductBean();
				StandardProductQueryDto retDto = it.next();
				logger.info("-------查询返回的产品：{}-------",retDto.toString());
				BeanUtils.copyProperties(retDto,retCb);
				staList.add(retCb);
			}
			return staList;
		}else{
			
			return null;
		}
	}
	//分页查询汇总条数
	@Override
	public int queryCountStandardProduct(StandardProductBean sb) {
		StandardProductQueryDto reqDto = new StandardProductQueryDto();
		BeanUtils.copyProperties(sb, reqDto);
		return standardProductQueryApp.pageCountQueryStProduct(reqDto);
	}
	//产品明细查询
	@Override
	public StandardProductBean queryProductDetail(String productId) {
		StandardProductQueryDto retDto = standardProductQueryApp.detailQuery(productId);
		StandardProductBean cb = new StandardProductBean();
		BeanUtils.copyProperties(retDto, cb);
		return cb;
	}




}
