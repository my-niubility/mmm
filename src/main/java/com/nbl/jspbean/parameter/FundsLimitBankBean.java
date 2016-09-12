package com.nbl.jspbean.parameter;
/**
 * @author gcs
 * @createdate 2016年8月3日	
 * @version 1.0
 * 银行资金限额实体类
 */

public class FundsLimitBankBean {
	
	private String id;

    private String bankId;

    private String cardType;

    private String channelType;

    private String businessType;

    private Long singleLimit;

    private Long dayLimit;

    private Long monthLimit;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId == null ? null : bankId.trim();
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType == null ? null : cardType.trim();
    }

    public String getChannelType() {
        return channelType;
    }

    public void setChannelType(String channelType) {
        this.channelType = channelType == null ? null : channelType.trim();
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType == null ? null : businessType.trim();
    }

    public Long getSingleLimit() {
        return singleLimit;
    }

    public void setSingleLimit(Long singleLimit) {
        this.singleLimit = singleLimit;
    }

    public Long getDayLimit() {
        return dayLimit;
    }

    public void setDayLimit(Long dayLimit) {
        this.dayLimit = dayLimit;
    }

    public Long getMonthLimit() {
        return monthLimit;
    }

    public void setMonthLimit(Long monthLimit) {
        this.monthLimit = monthLimit;
    }

	@Override
	public String toString() {
		return "FundsLimitBankBean [id=" + id + ", bankId=" + bankId + ", cardType=" + cardType + ", channelType="
				+ channelType + ", businessType=" + businessType + ", singleLimit=" + singleLimit + ", dayLimit="
				+ dayLimit + ", monthLimit=" + monthLimit + "]";
	}
    
    
}
