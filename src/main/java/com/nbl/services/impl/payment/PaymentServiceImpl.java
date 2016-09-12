package com.nbl.services.impl.payment;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nbl.service.manager.app.PaymentApp;
import com.nbl.services.payment.PaymentService;
/**
 * @author gcs
 * @createdate 2016年8月10日	
 * @version 1.0
 * manager层支付订单接口实现
 */

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Resource
	private PaymentApp paymentApp;
	
	@Override
	public int queryCountPayment() {
		return paymentApp.queryCountPayment();
	}

	@Override
	public int queryNoCountPayment() {
		return paymentApp.queryNoCountPayment();
	}

	@Override
	public int queryLastMonthCount() {
		return paymentApp.queryLastMonthCount();
	}

	@Override
	public int queryNoLastMonthCount() {
		return paymentApp.queryNoLastMonthCount();
	}

	@Override
	public int queryMonthCount() {
		return paymentApp.queryMonthCount();
	}

	@Override
	public int queryNoMonthCount() {
		return paymentApp.queryNoMonthCount();
	}

	@Override
	public int queryWeekCount() {
		return paymentApp.queryWeekCount();
	}

	@Override
	public int queryNoWeekCount() {
		return paymentApp.queryNoWeekCount();
	}

}
