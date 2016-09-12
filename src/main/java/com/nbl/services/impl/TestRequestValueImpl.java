package com.nbl.services.impl;

import org.springframework.stereotype.Service;

import com.nbl.services.TestRequestValue;

/**
 * @author Donald
 * @version 1.0, 2015年12月12日
 * @description
 */
@Service("testRequestValue")
public class TestRequestValueImpl implements TestRequestValue {

	@Override
	public String getRequestValue(String key) {
		return key;
	}


}
