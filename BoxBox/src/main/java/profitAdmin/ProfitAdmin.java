package profitAdmin;

public class ProfitAdmin {
	private String email, name, model, info, startTime, endTime, price;

	public ProfitAdmin(String email, String name, String model, String info, String startTime, String endTime,
			String price) {
		super();
		this.email = email;
		this.name = name;
		this.model = model;
		this.info = info;
		this.startTime = startTime;
		this.endTime = endTime;
		this.price = price;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

}
