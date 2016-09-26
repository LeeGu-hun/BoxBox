package member;

import java.util.Date;

import exception.IdPasswordNotMatchingException;

public class Member {
	private Long id, phone, type;
	private String email, name, password;

	public Member(String email, String name, String password, Long phone, Long type) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

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