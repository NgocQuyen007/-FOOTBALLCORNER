package common;

import java.util.List;

public class ValidationResponse {

	private String status;
	private List<ErrorMessage> errorMessageList;

	// Getters and setters
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ErrorMessage> getErrorMessageList() {
		return errorMessageList;
	}

	public void setErrorMessageList(List<ErrorMessage> errorMessageList) {
		this.errorMessageList = errorMessageList;
	}

}
