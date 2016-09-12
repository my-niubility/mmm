package com.nbl.services.impl.customer;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustPersonBean;
import com.nbl.jspbean.customer.PersonAndUserBean;
import com.nbl.service.manager.app.CustPersonApp;
import com.nbl.service.manager.dto.CustPersonReqDto;
import com.nbl.service.manager.dto.PersonAndUserReqDto;
import com.nbl.services.customer.CustPersonService;


@Service("custPersonService")
public class CustPersonServiceImpl implements CustPersonService{
	private final static Logger logger = LoggerFactory.getLogger(CustPersonService.class);
	
	@Resource
	private CustPersonApp custPersonApp;
	@Override
	public List<PersonAndUserBean> pageListQueryCustPerson(PageVO<PersonAndUserBean> pageVO, PersonAndUserBean cb) {
		PersonAndUserReqDto reqDto = new PersonAndUserReqDto();
		PageVO<PersonAndUserReqDto> pgVO = new PageVO<PersonAndUserReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<PersonAndUserReqDto> reqDtoList = custPersonApp.pageListQueryCustPerson(pgVO, reqDto);
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<PersonAndUserReqDto>.size---------:{}",reqDtoList.size());
			List<PersonAndUserBean> retList = new ArrayList<PersonAndUserBean>();
			for (PersonAndUserReqDto dto : reqDtoList) {
				PersonAndUserBean perBean = new PersonAndUserBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<PersonAndUserReqDto>.identityCardNumber--------",dto.getIdentityCardNumber());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public int pageCountQueryCustPerson(PersonAndUserBean cb) {
		PersonAndUserReqDto reqDto = new PersonAndUserReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return custPersonApp.pageCountQueryCustPerson(reqDto);
	}

	@Override
	public PersonAndUserBean custPersonDetail(String id) {
		PersonAndUserReqDto reqDto = custPersonApp.custPersonDetail(id);
		PersonAndUserBean retBean = new PersonAndUserBean();
		BeanUtils.copyProperties(reqDto, retBean);
		return retBean;
	}

	@Override
	public List<CustPersonBean> listQueryCustPersonId() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listQueryCustPersonId();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listQueryCustPersonId>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listQueryCustPersonId>.certStatus--------",dto.getCertStatus());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listLastMonthCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listLastMonthCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listLastMonthCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listLastMonthCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listMonthCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listMonthCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listMonthCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listMonthCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listWeekCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listWeekCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listWeekCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listWeekCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listAreaCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listAreaCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listAreaCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listAreaCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listLastMonthAreaCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listLastMonthAreaCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listLastMonthAreaCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listLastMonthAreaCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listMonthAreaCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listMonthAreaCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listMonthAreaCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listMonthAreaCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

	@Override
	public List<CustPersonBean> listWeekAreaCount() {
		List<CustPersonReqDto> reqDtoList = custPersonApp.listWeekAreaCount();
		if(reqDtoList !=null && reqDtoList.size()>0){
			logger.info("---------List<listWeekAreaCount>.size---------:{}",reqDtoList.size());
			List<CustPersonBean> retList = new ArrayList<CustPersonBean>();
			for (CustPersonReqDto dto : reqDtoList) {
				CustPersonBean perBean = new CustPersonBean();
				BeanUtils.copyProperties(dto, perBean);
				logger.info("--------List<listWeekAreaCount>.getNum()--------",dto.getNum());
				retList.add(perBean);
			}
			return retList;
		}else {
			return null;
		}
	}

}
