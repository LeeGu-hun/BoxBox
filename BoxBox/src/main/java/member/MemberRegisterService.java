package member;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoMember;
import exception.AlreadyExistingMemberException;

public class MemberRegisterService {
	private DaoMember daoMember;

	public MemberRegisterService(DaoMember daoMember) {
		this.daoMember = daoMember;
	}

	public MemberRegisterService() {
	}

	@Transactional
	public void regist(RegisterRequest registerRequest) {
		Member member = daoMember.selectByEmail(registerRequest.getEmail());
		if (member != null) {
			throw new AlreadyExistingMemberException(registerRequest.getEmail()+" 와 동일한 회원이 존재합니다.");
		}
		Member newMember = new Member(registerRequest.getEmail(), registerRequest.getName(),
				registerRequest.getPassword(), registerRequest.getPhone(), registerRequest.getType());
		daoMember.insert(newMember);
	}
}