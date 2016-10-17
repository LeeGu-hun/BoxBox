package place;

public class Place {
	private String id, city, gu, street, name, postId, dong;

	public Place(String id, String city, String gu, String dong, String street, String name, String postId) {
		this.id = id;
		this.city = city;
		this.gu = gu;
		this.street = street;
		this.name = name;
		this.postId = postId;
		this.dong = dong;
	}
	

	public Place(String id, String name, String postId) {
		super();
		this.id = id;
		this.name = name;
		this.postId = postId;
	}


	public Place(String postId, String city, String gu, String dong) {
		this.city = city;
		this.gu = gu;
		this.postId = postId;
		this.dong = dong;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public Place(String city, String gu) {
		this.gu = gu;
		this.city = city;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}
}
