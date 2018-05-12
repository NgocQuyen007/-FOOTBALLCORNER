package common;

public class ErrorMessage {

	private String fieldName;
	private String message;

	public ErrorMessage() { }
	
	public ErrorMessage(String fieldName, String message) {
		this.setFieldName(fieldName);
		this.setMessage(message);
	}

	// Getters and setters
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
