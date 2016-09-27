package login;

public class AuthInfo {
	private String id;
	private String email;
	private String name;
	private int type;

	public AuthInfo(String id, String email, String name, int type) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.type = type;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

}
