/**
 * @author gcs
 * @createdate 2016年8月8日	
 * @version 1.0
 * 
 */
package com.nbl.services.impl.customer;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nbl.service.manager.app.CustUserApp;
import com.nbl.services.customer.CustUserService;

@Service("custUserService")
public class CustUserServiceImpl implements CustUserService {
	
	
	@Resource
	private CustUserApp custUserApp;
	
	@Override
	public int queryCountCustUser() {
		return custUserApp.queryCountCustUser();
	}

	@Override
	public int queryNoCountCustUser() {
		return custUserApp.queryNoCountCustUser();
	}

	@Override
	public int queryLastMonthCount() {
		return custUserApp.queryLastMonthCount();
	}

	@Override
	public int queryNoLastMonthCount() {
		return custUserApp.queryNoLastMonthCount();
	}

	@Override
	public int queryMonthCount() {
		return custUserApp.queryMonthCount();
	}

	@Override
	public int queryNoMonthCount() {
		return custUserApp.queryNoMonthCount();
	}

	@Override
	public int queryWeekCount() {
		return custUserApp.queryWeekCount();
	}

	@Override
	public int queryNoWeekCount() {
		return custUserApp.queryNoWeekCount();
	}

	

}
