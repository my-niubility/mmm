package com.nbl.jspbean.message;

import java.util.Date;
import java.util.List;

/**
*@author:chenhongji
*@createdate：2016年8月25日 
*@version: 1.0 
*/

public class UserMessageBean {
	//消息id
    private String id;
    //消息创建者userId
    private String userId;
    
    //消息接受者custId
    List<String> userIds;
    
	//消息标题
    private String title;
    //消息内容
    private String content;
    //消息创建时间
    private Date createTime;
    //消息状态(0：初始 1：删除 2:预删除)
    private String status;
    //消息类型(0:系统消息 1：业务消息)
    private String messageType;
    //收信人一级选择
    private String firstChoice;
    //收信人二级选择
    private String secondChoice;
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<String> getUserIds() {
		return userIds;
	}

	public void setUserIds(List<String> userIds) {
		this.userIds = userIds;
	}
	
	
	public String getFirstChoice() {
		return firstChoice;
	}

	public void setFirstChoice(String firstChoice) {
		this.firstChoice = firstChoice;
	}

	public String getSecondChoice() {
		return secondChoice;
	}

	public void setSecondChoice(String secondChoice) {
		this.secondChoice = secondChoice;
	}

	@Override
	public String toString() {
		return "UserMessageBean [id=" + id + ", userId=" + userId + ", userIds=" + userIds + ", title=" + title
				+ ", content=" + content + ", createTime=" + createTime + ", status=" + status + ", messageType="
				+ messageType + ", firstChoice=" + firstChoice + ", secondChoice=" + secondChoice + "]";
	}

	

	

	
	
	
}


