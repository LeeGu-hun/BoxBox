package rental;

public class Rental {
	private String id, itemId, cate, model, info, fee;

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public Rental(String cate, String model) {
		super();
		this.cate = cate;
		this.model = model;
	}

	public Rental(String itemId, String info, String fee) {
		super();
		this.itemId = itemId;
		this.info = info;
		this.fee = fee;
	}

	public Rental() {
		super();
	}

	public Rental(String info) {
		super();
		this.info = info;
	}

	public Rental(String id, String itemId, String cate, String model, String info) {
		super();
		this.id = id;
		this.itemId = itemId;
		this.cate = cate;
		this.model = model;
		this.info = info;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

}
