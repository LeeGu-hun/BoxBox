package login;

public class AuthInfo {
	private Long id;
	private String email;
	private String name;
	private Long type;

	public AuthInfo(Long id, String email, String name, Long type) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.type = type;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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
