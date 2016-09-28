package member;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ChangeInfoCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ChangeInfoCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "name", "empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "newPassword", "required");
	}

}