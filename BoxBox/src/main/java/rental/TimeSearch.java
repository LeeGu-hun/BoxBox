package rental;

public class TimeSearch {
	private String rentalId,placeName,orderDate,cate,model,info,photo,fee,rentalFull,startTime,endTime,gu;

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
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

	public String getRentalFull() {
		return rentalFull;
	}

	public void setRentalFull(String rentalFull) {
		this.rentalFull = rentalFull;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public TimeSearch(String rentalId, String placeName, String orderDate, String cate, String model,
			String info, String photo, String fee, String rentalFull, String startTime, String endTime,String gu) {
		super();
		this.rentalId = rentalId;
		this.placeName = placeName;
		this.orderDate = orderDate;
		this.cate = cate;
		this.model = model;
		this.info = info;
		this.photo = photo;
		this.fee = fee;
		this.rentalFull = rentalFull;
		this.startTime = startTime;
		this.endTime = endTime;
		this.gu=gu;
	}
	
	
}
