package memberAdmin;

import exception.IdPasswordNotMatchingException;

public class MemberSearchAdmin {
	private String id;
	private String phone;
	private String email, name, password;

	public MemberSearchAdmin(String email, String name, String password, String phone) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void changePassword(String name, String oldPassword, String newPassword) {
		if (!password.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.password = newPassword;
		this.name = name;
	}

	public boolean passwordMatchConfirm(String password) {
		return (password.equals(this.password)) ? true : false;
	}
}
