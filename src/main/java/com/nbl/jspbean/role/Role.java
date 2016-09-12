package com.nbl.jspbean.role;

import java.util.Date;
import java.util.List;

public class Role {
	
	private String roleId;
	
	private String roleName;
	
	private String description;
	
	private String status;
	
	private Date createdTime;
	
	private String creater;
	
	private List<RoleResource> resList;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<RoleResource> getResList() {
		return resList;
	}

	public void setResList(List<RoleResource> resList) {
		this.resList = resList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", description=" + description + ", status="
				+ status + ", createdTime=" + createdTime + ", creater=" + creater + ", resList=" + resList + "]";
	}


}
