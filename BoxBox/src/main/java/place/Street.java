package place;

public class Street {
	private String street, postId;

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public Street(String street, String postId) {
		super();
		this.street = street;
		this.postId = postId;
	}

}
