package com.nbl.services.product;

import com.nbl.service.business.dto.req.ProductAuditReqDto;

public interface ProductCheckService {
	
	/**
	 * @param reqDto
	 * @return
	 * @description:产品发布审核
	 */
	public boolean productPublishAudit(ProductAuditReqDto reqDto);
	
	/**
	 * @param reqDto
	 * @return
	 * @description:产品募集成立后审核
	 */
	public boolean productEstablishAudit(ProductAuditReqDto reqDto);

}
