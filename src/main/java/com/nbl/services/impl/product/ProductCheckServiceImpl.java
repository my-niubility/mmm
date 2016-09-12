package com.nbl.services.impl.product;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nbl.service.business.app.ProductAuditApp;
import com.nbl.service.business.dto.req.ProductAuditReqDto;
import com.nbl.services.product.ProductCheckService;

@Service("productCheckService")
public class ProductCheckServiceImpl implements ProductCheckService {

	@Resource
	private ProductAuditApp productAuditApp;
	
	@Override
	public boolean productPublishAudit(ProductAuditReqDto reqDto) {
		
		return productAuditApp.productPublishAudit(reqDto);
	}

	@Override
	public boolean productEstablishAudit(ProductAuditReqDto reqDto) {
		return productAuditApp.productEstablishAudit(reqDto);
	}

}
