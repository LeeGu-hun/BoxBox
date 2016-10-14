package controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DaoMemberAdmin;
import exception.AlreadyExistingMemberException;
import exception.IdPasswordNotMatchingException;
import exception.MemberNotFoundException;
import login.AuthInfo;
import login.AuthService;
import member.ChangeInfoCommand;
import member.ChangeInfoCommandValidator;
import member.ChangeInfoService;
import member.MemberRegisterService;
import member.RegisterRequest;
import member.RegisterRequestValidator;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private DaoMemberAdmin daoMemberAdmin;
	private MemberRegisterService memberRegisterService;
	private ChangeInfoService changePasswordService;
	private AuthService authService;

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


	// @RequestMapping("/detail/{id}")
	// public String detail(@PathVariable("id") Long memId, Model model) {
	// Member member = daoMember.selectById(memId);
	// if (member == null) {
	// throw new MemberNotFoundException();
	// }
	// model.addAttribute("member", member);
	// return "member/memberDetail";
	// }

	@RequestMapping(value = "/changeInfo", method = RequestMethod.GET)
	public String form(@ModelAttribute("command") ChangeInfoCommand pwdCmd, Errors errors, HttpSession session) {
		session.getAttribute("authInfo");
		return "dirMem/changeInfoForm";
	}

	@RequestMapping(value = "/changeInfo", method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") ChangeInfoCommand pwdCmd, Errors errors, HttpSession session) {
		new ChangeInfoCommandValidator().validate(pwdCmd, errors);
		if (errors.hasErrors()) {
			return "dirMem/changeInfoForm";
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		try {
			changePasswordService.changePassword(authInfo.getEmail(), pwdCmd.getName(), pwdCmd.getCurrentPassword(),
					pwdCmd.getNewPassword());
			return "dirMem/changedInfo";
		} catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "dirMem/changeInfoForm";
		}
	}

	// @ExceptionHandler(TypeMismatchException.class)
	// public String handleTypeMismatchException(TypeMismatchException ex) {
	// return "member/invalidId";
	// }

	@ExceptionHandler(MemberNotFoundException.class)
	public String handleNotFoundException() throws IOException {
		return "member/noMember";
	}

}
