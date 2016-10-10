package rental;

public class TimeSearch {
	private String rentalId,placeName,orderDate,orderTime,cate,model,info,photo,fee;
	
	public TimeSearch(String rentalId, String placeName, String orderDate, String orderTime, String cate, String model,
			String info, String photo, String fee) {
		super();
		this.rentalId = rentalId;
		this.placeName = placeName;
		this.orderDate = orderDate;
		this.orderTime = orderTime;
		this.cate = cate;
		this.model = model;
		this.info = info;
		this.photo = photo;
		this.fee = fee;
	}

	public String getRentalId() {
		return rentalId;
	}

	public void setRentalId(String rentalId) {
		this.rentalId = rentalId;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
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
