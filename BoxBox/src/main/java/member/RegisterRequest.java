package member;

public class RegisterRequest {
	private String email;
	private String password;
	private String confirmPassword;
	private String name;
	private Long phone;
	private Long type;

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	public boolean isPasswordEqualToConfirmPassword() {
		return password.equals(confirmPassword);
	}

}
