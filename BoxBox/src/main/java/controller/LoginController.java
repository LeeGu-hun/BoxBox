package controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import exception.AlreadyExistingMemberException;
import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import login.AuthInfo;
import login.AuthService;
import login.LoginCommand;
import login.LoginCommandValidator;
import member.MemberRegisterService;
import member.RegisterRequest;
import member.RegisterRequestValidator;
import place.Place;
import place.PlaceService;
import rental.MyRental;
import rental.OrderInsert;
import rental.TimeSearch;

@Controller
public class LoginController {
	private AuthService authService;
	private MemberRegisterService memberRegisterService;
	private PlaceService placeService;

	public void setPlaceService(PlaceService placeService) {
		this.placeService = placeService;
	}

	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}

	@RequestMapping("/")
	public String homepage2(RegisterRequest rr, Errors errors, Model model) {
		if (rr.getEmail() != null && !rr.getEmail().equals("")) {
			System.out.println("콤보박스 세팅");
			List<Place> place = placeService.comboPost();
			model.addAttribute("place", place);
			new RegisterRequestValidator().validate(rr, errors);
			if (errors.hasErrors())
				return "main";
			try {
				memberRegisterService.regist(rr);
				return "main";
			} catch (AlreadyExistingMemberException ex) {
				model.addAttribute("errMsg", "이미 존재하는 회원입니다.");
				errors.rejectValue("email", "duplicate");
				return "main";
			}
		} else {
			return "main";
		}
	}
	@RequestMapping(value = "/myrental", method = RequestMethod.POST)
	public String myrental(HttpSession session, HttpServletRequest request,Model model) {
		System.out.println("/myrental 컨트롤러");
		String userId = request.getParameter("userId");
		List<MyRental> rentalInfo = placeService.myrental(userId);
		model.addAttribute("RentalInfo",rentalInfo);
		return "dirMem/rentalInfo";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpSession session, HttpServletRequest request,Model model) {
		System.out.println("/delete 컨트롤러");
		String orderListId = request.getParameter("orderListId");
		System.out.println(orderListId);
		placeService.delete(orderListId);
		String userId = request.getParameter("userId");
		List<MyRental> rentalInfo = placeService.myrental(userId);
		model.addAttribute("RentalInfo",rentalInfo);
		return "dirMem/rentalInfo";
	}
	// @RequestMapping(value="/payment1" ,method=RequestMethod.POST)
	// public String payment1(Model model,HttpServletRequest request,HttpSession
	// session){
	// String rentalId=request.getParameter("rentalId");
	// String orderDate = request.getParameter("orderDate");
	// String orderDate1 = request.getParameter("orderDate1");
	// String startTime = request.getParameter("startTime");
	// String endTime = request.getParameter("endTime");
	// System.out.println(rentalId+"/"+orderDate+"/"+orderDate1+"/"+startTime+"/"+endTime);
	// TimeSearch timeSearch = placeService.timeSearch(rentalId, startTime,
	// endTime, orderDate, orderDate1);
	// model.addAttribute("TimeSearch",timeSearch);
	// return "boxUser/rentalOrder";
	// }
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(Model model, HttpServletRequest request, HttpSession session) {
		String placeName = request.getParameter("pname");
		System.out.println(placeName);
		TimeSearch timeSearch = placeService.timeSearch(placeName);
		model.addAttribute("TimeSearch", timeSearch);

		return "boxUser/rentalOrder";
	}

	@RequestMapping("/join")
	public String join(RegisterRequest rr) {
		
		return "dirMem/join1";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String form(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setEmail(rCookie.getValue());
			loginCommand.setRememberEmail(true);
		}
		
		return "dirMem/join";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String form(LoginCommand loginCommand, Errors errors, Model model,
			// BoardCommand boardCmd,
			HttpSession session, HttpServletResponse response) {
		System.out.println("login 컨트롤러 접속");
		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			System.out.println("에러발생");
			return "main";
		}
		try {
			// List<Place> place = placeService.comboPlace();
			// model.addAttribute("place", place);
			System.out.println("콤보박스 세팅");
			List<Place> place = placeService.comboPost();
			model.addAttribute("place", place);
			System.out.println("로그인 시도");
			AuthInfo authInfo = authService.authenticate(loginCommand.getEmail(), loginCommand.getPassword());
			session.setAttribute("authInfo", authInfo);

			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getEmail());
			rememberCookie.setPath("/");
			if (loginCommand.isRememberEmail()) {
				rememberCookie.setMaxAge(60 * 5);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			System.out.println("로그인");
			return "main";
		} catch (MemberNotFoundException e) {
			System.out.println("멤버못찾음");
			errors.rejectValue("email", "memberNotFound");
			return "main";
		} catch (IdPasswordNotMatchingException e) {
			System.out.println("비밀번호 불일치");
			errors.rejectValue("password", "idPasswordNotMatching");
			return "main";
		}
	}

	@RequestMapping(value = "/orderRegist", method = RequestMethod.POST)
	public String orderRegist(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		System.out.println("login 컨트롤러  orderRegist접속");
		List<Place> place = placeService.comboPost();
		model.addAttribute("place", place);
		String rentalId = request.getParameter("rentalId1");
		String userId = request.getParameter("userId1");
		String startTime = request.getParameter("startTime1");
		String endTime = request.getParameter("endTime1");
		String orderPrice = request.getParameter("orderPrice1");
		String password = String.valueOf((Math.round(9999 * Math.random()) + 1000));
		System.out.println(password);
		try {
			placeService.orderInsert(rentalId, userId, startTime, endTime, orderPrice, password);
			System.out.println("주문완료");
			return "dirMem/orderRegist";
		} catch (Exception e) {
			System.out.println("주문 에러");
			e.printStackTrace();
			return "dirMem/orderRegist";
		} finally{
			place = placeService.comboPost();
			model.addAttribute("place", place);
			return "dirMem/orderRegist";
		}
	}
	@RequestMapping("/main")
	public String main(HttpSession session,Model model) {
		System.out.println("main리퀘스트매핑");
		List<Place> place = placeService.comboPost();
		model.addAttribute("place", place);
		return "main";
	}
	@RequestMapping("/main.jsp")
	public String main1(HttpSession session,Model model) {
		System.out.println("main.jsp리퀘스트매핑");
		List<Place> place = placeService.comboPost();
		model.addAttribute("place", place);
		return "main";
	}
	@RequestMapping("/logout")
	public String form(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
