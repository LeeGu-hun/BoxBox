package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DaoMemberAdmin;
import login.AuthService;
import member.ChangeInfoService;
import member.MemberRegisterService;
import memberAdmin.Item;
import place.City;
import place.Place;
import place.PlaceAdminService;
import place.PlaceService;

@Controller
public class AdminController {
	private DaoMemberAdmin daoMemberAdmin;
	private MemberRegisterService memberRegisterService;
	private ChangeInfoService changePasswordService;
	private AuthService authService;
	private PlaceService placeService;
	
	//★★★★★★★★★★★★★★★아래 수정★★★★★★★★★★★★★★★
	private PlaceAdminService placeAdminService;
	
	
	
	
	public void setPlaceAdminService(PlaceAdminService placeAdminService) {
		this.placeAdminService = placeAdminService;
	}

	public void setPlaceService(PlaceService placeService) {
		this.placeService = placeService;
	}

	public void setChangePasswordService(ChangeInfoService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}

	public void setDaoMemberAdmin(DaoMemberAdmin daoMemberAdmin) {
		this.daoMemberAdmin = daoMemberAdmin;
	}

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	@RequestMapping(value = "/adminPlace")
	public String adminPlace(HttpSession session, HttpServletRequest request,Model model) {
		System.out.println("/adminPlace 컨트롤러");
		List<Place> place = placeService.comboPost();
		List<City> city = placeService.selectCity();
		model.addAttribute("place", place);
		model.addAttribute("City",city);
		return "admin/rentalPlaceDisplay";
	}
	
	@RequestMapping(value = "/adminRental")
	public String adminRental(HttpSession session, HttpServletRequest request,Model model) {
		System.out.println("/adminRental 컨트롤러");
		List<Place> place = placeService.placeAll();
		List<Item> item= placeService.itemAll();
		model.addAttribute("place", place);
		model.addAttribute("item", item);
		return "admin/rentalItemUpdate";
	}
	
	@RequestMapping(value = "/adminMember")
	public String adminMember(HttpSession session, HttpServletRequest request,Model model) {
		return "admin/memberDisplay";
	}
	
	@RequestMapping(value = "/adminProfit")
	public String adminProfit(HttpSession session, HttpServletRequest request,Model model) {
		return "admin/profit";
	}
}