package memberAdmin;

public class MemberSearchAdmin {
	private String name, phone, email, pw;

	public MemberSearchAdmin(String name, String phone, String email, String pw) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}	
		
}