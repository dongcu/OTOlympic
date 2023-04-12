package com.gym.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.Page;
import com.gym.domain.ReplyPage;
import com.gym.domain.ReplyVO;
import com.gym.domain.UserVO;
import com.gym.service.FreeBoardService;

@Controller
@RequestMapping("/free/*")
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;

	// 게시물 목록, 개수 세기
	@GetMapping("/freelist")
	public String getFreelist(String keyword, Model model, int num, String searchType) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.getSearchCnt(keyword, searchType));

		List<FreeBoardVO> list = service.getFreelist(keyword, searchType, page.getDisplayPost(), page.getPostNum());

		model.addAttribute("freelist", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("keyword", keyword);

		return "/board/freeboard_list";
	}

	// 게시물 조회
	@GetMapping("/freedetail")
	public String getFreeDetail(String keyword, int b_num, Model model, int reply_num, HttpServletRequest req) throws Exception {
		FreeBoardVO vo = service.getFreeDetail(b_num);
		model.addAttribute("freedetail", vo);
		model.addAttribute("keyword", keyword);

		String userid = ((UserVO) req.getSession().getAttribute("loginUser")).getUserid();
		if (!userid.equals(vo.getB_writer())) {
			service.freeViewCnt(b_num);
		}
		
		// 댓글 조회
		ReplyPage page = new ReplyPage();
		page.setNum(reply_num);
		page.setCount(service.getReplyCnt(b_num)); // 이거는 b_num에 대한 reply 개수

		List<ReplyVO> reply = service.freeReplylist(b_num, page.getDisplayPost(), page.getPostNum());
		model.addAttribute("page", page);
		model.addAttribute("reply", reply);
		model.addAttribute("select", reply_num);

		return "/board/freeboard_detail";
	}
	
	// 게시물 글쓰기 get 메소드
	@GetMapping("/freewrite")
	public String getFreeWrite() throws Exception {
		return "/board/freeboard_write";
	}

	// 게시물 글쓰기 post 메소드
	@PostMapping("/freewrite")
	public String postFreeWrite(FreeBoardVO vo) throws Exception {
		service.freeWrite(vo);
		return "redirect:/free/freelist?searchType=T&keyword=&num=1";
	}

	// 게시물 수정 get메소드
	@GetMapping("/freemodify")
	public String getFreeModify(@RequestParam("b_num") int b_num, Model model) throws Exception {
		FreeBoardVO vo = service.getFreeDetail(b_num);
		model.addAttribute("freedetail", vo);
		return "/board/freeboard_modify";
	}

	// 게시물 수정 post 메소드
	@PostMapping("/freemodify")
	public String postFreeModify(FreeBoardVO vo) throws Exception {
		service.freeModify(vo);
		int b_num = vo.getB_num();
		return "redirect:/free/freedetail?reply_num=1&b_num=" + b_num;
	}

	// 게시물 삭제
	@PostMapping("/freedelete")
	public String getDelete(int b_num) throws Exception {
		service.freeDelete(b_num);
		return "redirect:/free/freelist?searchType=T&keyword=&num=1";
	}

	// 댓글 작성
	@PostMapping("/replywrite")
	public String freeReplyWrite(ReplyVO vo) throws Exception {
		service.freeReplyWrite(vo);
		int b_num = vo.getB_num();
		return "redirect:/free/freedetail?reply_num=1&b_num=" + b_num;
	}

	// 댓글 삭제
	@PostMapping("/replydelete")
	public String replyDelete(int c_num, int b_num, int select) throws Exception {
		service.replyDelete(c_num);
		int[] number = new int[2];
		number[0] = b_num;
		number[1] = select;
		return "redirect:/free/freedetail?b_num=" + number[0] + "&reply_num=" + number[1];
	}

	// 댓글 수정 뷰
	@PostMapping("/result")
	public @ResponseBody ReplyVO replyModify(@RequestParam("c_num") int c_num) throws Exception {
		ReplyVO result = service.replyDetail(c_num);
		return result;
	}

	// 댓글 수정
	@PostMapping("/replyModify")
	public String replyModify(ReplyVO vo, int reply_num) throws Exception {
		service.replyModify(vo);
		int b_num = vo.getB_num();
		return "redirect:/free/freedetail?reply_num=" + reply_num + "&b_num=" + b_num;
	}

}