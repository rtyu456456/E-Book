package com.fp.eb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {


	// 이 폴더는 컨트롤러 넣어놓는 폴더입니다.
	// 각자가 만드는 기능에 따른 컨트롤러를 넣어주시면 됩니다
	// 이 컨트롤러 이름은 HomeController로 만든 이유는
	// 홈컨 쓰는 사람은 제 손에 죽는다는 겁니다.
	// 여긴 아무도 못써, 홈컨이라는 이름도 못써
	// HC도 못써
	
	@GetMapping("/sb")
	public String text() {
		return "index";
	}

}
