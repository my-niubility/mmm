package com.nbl.jspbean.parameter;
/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 对应的银行卡类别的实体Bean
 */

public class BankTypeBean {
	
	private String bankType;

    private String bankName;

    public String getBankType() {
        return bankType;
    }

    public void setBankType(String bankType) {
        this.bankType = bankType == null ? null : bankType.trim();
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

	@Override
	public String toString() {
		return "BankTypeBean [bankType=" + bankType + ", bankName=" + bankName + "]";
	}
    
    
}
