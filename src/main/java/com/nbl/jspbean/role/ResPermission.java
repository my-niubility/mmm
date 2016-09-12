package com.nbl.jspbean.role;

public class ResPermission {

	private String permId;
	
	private String permName;
	
	private String description;
	
	private String status;

	public String getPermId() {
		return permId;
	}

	public void setPermId(String permId) {
		this.permId = permId;
	}

	public String getPermName() {
		return permName;
	}

	public void setPermName(String permName) {
		this.permName = permName;
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

	@Override
	public String toString() {
		return "ResPermission [permId=" + permId + ", permName=" + permName + ", description=" + description
				+ ", status=" + status + "]";
	}
	

}
