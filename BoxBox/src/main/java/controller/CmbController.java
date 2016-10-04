package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import place.Place;
import place.PlaceService;

@Controller
public class CmbController {

	private PlaceService placeService;

	public void setPlaceService(PlaceService placeService) {
		this.placeService = placeService;
	}

//	@RequestMapping(value = "/cmbList", method = RequestMethod.POST)
//	public String handleStep3(Model model, HttpSession session, HttpServletRequest request,HttpServletResponse response) {
//		System.out.println("리퀘스트 매핑 /cmbList");
//		String postId = request.getParameter("post");
//		System.out.println(postId);
//		List<Place> place = placeService.comboPlace(postId);
//		model.addAttribute("postId", place);
//		 
//		String post = "<select class='cmbRental' id='place' name='place'> <c:forEach var='post' items='${requestScope.post}'>"
//				+ "<option value='<c:out value='${post.postId}'/>'><c:out value='${post.name}' /></option></c:forEach></select>";
//
//		return post;
//	}

}
