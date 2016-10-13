package rentalItemAdmin;

public class ItemItemUpdateAdmin {
	private String itemId, cate, model, info, photo;
	private int fee;

	public ItemItemUpdateAdmin(String itemId, String cate, String model, String info, String photo, int fee) {
		super();
		this.itemId = itemId;
		this.cate = cate;
		this.model = model;
		this.info = info;
		this.photo = photo;
		this.fee = fee;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
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

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

}
