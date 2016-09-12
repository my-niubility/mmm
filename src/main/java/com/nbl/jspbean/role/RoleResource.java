package com.nbl.jspbean.role;

import java.util.List;

public class RoleResource {
	
	private String resourceId;
	
	private String resourceName;
	
	private String description;
	
	private String status;
	
	private List<ResPermission> permList;

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ResPermission> getPermList() {
		return permList;
	}

	public void setPermList(List<ResPermission> permList) {
		this.permList = permList;
	}

	@Override
	public String toString() {
		return "RoleResource [resourceId=" + resourceId + ", resourceName=" + resourceName + ", description="
				+ description + ", status=" + status + ", permList=" + permList + "]";
	}
	
	

}
