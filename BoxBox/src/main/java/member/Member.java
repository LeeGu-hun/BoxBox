package member;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class Member {
	private String id;
	private String phone;
	private int type;
	private String email, name, password;

	public Member(String email, String name, String password, String phone, int type) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.type = type;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public void changePassword(String oldPassword, String newPassword) {
		if (!password.equals(oldPassword))
			throw new IdPasswordNotMatchingException();
		this.password = newPassword;
	}

	public boolean passwordMatchConfirm(String password) {
		return (password.equals(password)) ? true : false;
	}
}