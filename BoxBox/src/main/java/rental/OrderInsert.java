package rental;

public class OrderInsert {
	private String rentalId,userId,orderDate,startTime,endTime,orderPrice,rentalFull,password;

	public OrderInsert(String rentalId, String userId, String orderDate, String startTime, String endTime,
			String orderPrice, String rentalFull, String password) {
		super();
		this.rentalId = rentalId;
		this.userId = userId;
		this.orderDate = orderDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.orderPrice = orderPrice;
		this.rentalFull = rentalFull;
		this.password = password;
	}

	public String getRentalId() {
		return rentalId;
	}

	public void setRentalId(String rentalId) {
		this.rentalId = rentalId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getRentalFull() {
		return rentalFull;
	}

	public void setRentalFull(String rentalFull) {
		this.rentalFull = rentalFull;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	} 
}
