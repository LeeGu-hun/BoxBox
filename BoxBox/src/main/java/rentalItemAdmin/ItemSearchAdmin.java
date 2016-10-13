package rentalItemAdmin;

public class ItemSearchAdmin {
	private String cate, model, info, fee, photo;	
	
	public ItemSearchAdmin(String cate, String model, String info, String fee, String photo) {
		super();
		this.cate = cate;
		this.model = model;
		this.info = info;
		this.photo = photo;
		this.fee = fee;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}	

}