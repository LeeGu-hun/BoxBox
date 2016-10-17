package memberAdmin;

public class Item {
	private String itemId,cate,model,info,fee,photo;

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

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Item(String itemId, String cate, String model, String info, String fee, String photo) {
		super();
		this.itemId = itemId;
		this.cate = cate;
		this.model = model;
		this.info = info;
		this.fee = fee;
		this.photo = photo;
	}
	

	
	
}
