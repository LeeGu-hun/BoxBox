package rental;

public class RentalSearch {
	private String placeId, gu, place, cate, model, info, fee, photo;

	public RentalSearch(String placeId, String gu, String place, String cate, String model, String info, String fee,
			String photo) {
		super();
		this.placeId = placeId;
		this.gu = gu;
		this.place = place;
		this.cate = cate;
		this.model = model;
		this.info = info;
		this.fee = fee;
		this.photo = photo;
	}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
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

}
