package com.gym.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gym.domain.UserVO;
import com.gym.service.MailSendService;
import com.gym.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private MailSendService mailService;

	@RequestMapping(value = { "/login", "/join", "id_find", "/pw_find" }, method = RequestMethod.GET)
	public void replace() {
	}

//  로그인
	@PostMapping("/login")
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		if (service.login(vo, req)) {
			return "redirect:/";
		} else {
			ra.addFlashAttribute("loginfail", "F");
			return "redirect:/user/login";
		}

	}

	@RequestMapping(value = "/join_email", method = RequestMethod.POST)
	public void join_email() {

	}

//	이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

//  회원가입 폼으로 이동할 때 미리 입력한 이메일 가져오기
	@RequestMapping(value = "/join_form", method = RequestMethod.POST)
	public void join_form(@RequestParam("email") String email, Model model) {
		model.addAttribute("email", email);
	}

//  id 중복체크 
	@ResponseBody
	@RequestMapping(value = "/idchk", method = RequestMethod.POST)
	public String idchk(@RequestParam("userid") String userid) throws Exception {
		int result = service.idchk(userid);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

//	회원가입 완료
	@RequestMapping(value = "/join_complete", method = RequestMethod.POST)
	public String join_complete(UserVO vo, @RequestParam("userid") String userid) throws Exception {
		int result = service.idchk(userid);
		try {
			if (result != 0) {
				return "/join_form";
			} else {
				service.join(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/user/login";
	} 

//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest req, RedirectAttributes ra) {
		HttpSession session = req.getSession();
		session.invalidate();
		ra.addFlashAttribute("logout", "T");
		return "redirect:/";
	}
	
//	아이디 찾기
	@PostMapping("/findedid")
	public @ResponseBody UserVO postFindId(@RequestParam("username") String username, @RequestParam("email") String email) throws Exception {
		UserVO result = service.findId(username, email);
		if(result == null) {
			return null;
		}
		return result;
	}
	

}