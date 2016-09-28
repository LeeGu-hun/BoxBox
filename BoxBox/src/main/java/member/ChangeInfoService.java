package member;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoMember;
import exception.MemberNotFoundException;

public class ChangeInfoService {
	private DaoMember daoMember;

	public ChangeInfoService(DaoMember daoMember) {
		super();
		this.daoMember = daoMember;
	}

	@Transactional
	public void changePassword(String email,String name, String oldPw, String newPw) {
		Member member = daoMember.selectByEmail(email);
		if (member == null) {
			throw new MemberNotFoundException();
		}
		member.changePassword(name,oldPw, newPw);
		daoMember.update(member);
	}
}
