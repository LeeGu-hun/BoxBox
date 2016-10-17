package member;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import dao.DaoMember;
import exception.AlreadyExistingMemberException;
import rental.MyRental;

public class MemberRegisterService {
	private DaoMember daoMember;

	public MemberRegisterService(DaoMember daoMember) {
		this.daoMember = daoMember;
	}

	public MemberRegisterService() {
	}


	@Transactional
	public void regist(RegisterRequest registerRequest) {
		System.out.println("멤버 레지스터 서비스");
		Member member = daoMember.selectByEmail(registerRequest.getEmail());
		if (member != null) {
			throw new AlreadyExistingMemberException(registerRequest.getEmail()+" 와 동일한 회원이 존재합니다.");
		}
		Member newMember = new Member(registerRequest.getEmail(), registerRequest.getName(),
				registerRequest.getPassword(), registerRequest.getPhone(),Integer.parseInt(registerRequest.getType()));
		System.out.println("Insert 시작");
		daoMember.insert(newMember);
		System.out.println("Insert 완료");
	}
}