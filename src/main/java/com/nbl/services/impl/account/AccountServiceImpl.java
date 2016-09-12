package com.nbl.services.impl.account;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.account.LoginAccountBean;
import com.nbl.service.manager.app.LoginAccountApp;
import com.nbl.service.manager.dto.LoginAccountReqDto;
import com.nbl.services.account.AccountService;
@Service("accountService")
public class AccountServiceImpl implements AccountService {
	private final static Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class); 

	@Resource
	private LoginAccountApp loginAccountApp;
	@Override
	public List<LoginAccountBean> pageListQueryAccount(PageVO<LoginAccountBean> pageVO, LoginAccountBean cb) {
		LoginAccountReqDto reqDto = new LoginAccountReqDto();
		PageVO<LoginAccountReqDto> pgVO = new PageVO<LoginAccountReqDto>();
		BeanUtils.copyProperties(pageVO, pgVO);
		BeanUtils.copyProperties(cb, reqDto);
		List<LoginAccountReqDto> resDtoList = loginAccountApp.pageListQueryAccount(pgVO, reqDto);
		if(resDtoList !=null && resDtoList.size()>0){
			logger.info("---------List<LoginAccountReqDto>.size---------:{}",resDtoList.size());
			List<LoginAccountBean> retList = new ArrayList<LoginAccountBean>();
			
			for(LoginAccountReqDto dto : resDtoList){
				LoginAccountBean cbean = new LoginAccountBean();
				BeanUtils.copyProperties(dto, cbean);
				logger.info("---------List<LoginAccountBean>.mobile----dto-----:{}",dto.getMobile());
				retList.add(cbean);
			}
			return retList;
		}else{
			return null;
		}

	}

	@Override
	public int pageCountQueryAccount(LoginAccountBean cb) {
		LoginAccountReqDto reqDto = new LoginAccountReqDto();
		BeanUtils.copyProperties(cb, reqDto);
		return loginAccountApp.pageCountQueryAccount(reqDto);
	}

	@Override
	public LoginAccountBean detailQueryAccount(String accountName) {
		
		LoginAccountReqDto resDto = loginAccountApp.detailQueryAccount(accountName);
		LoginAccountBean retBean = new LoginAccountBean();
		BeanUtils.copyProperties(resDto,retBean);
		return retBean;
	}

	@Override
	public boolean accountCheckQuery(String accountName) {

		return loginAccountApp.accountCheckQuery(accountName);
	}

	@Override
	public boolean accountAdd(LoginAccountBean cb) {
		
		LoginAccountReqDto reqDto = new LoginAccountReqDto();
		
		BeanUtils.copyProperties(cb,reqDto);
		return loginAccountApp.accountAdd(reqDto);
	}

	@Override
	public boolean modifyPass(String loginName, String newPass) {
		return loginAccountApp.modifyPass(loginName, newPass);
	}

}
