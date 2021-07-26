package com.happyshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyshop.dao.ProductDAO;
import com.happyshop.entity.Product;



@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping(value = {"", "/home"})
	public String index(Model model) {
		List<Product> list2 = pdao.findBySpecial(4);
		model.addAttribute("list", list2);
		List<Product> list3 = pdao.findBySpecial(0);
		model.addAttribute("list1", list3);
		return "home/index";
	}
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("/feedback")
	public String feedback() {
		return "home/feedback";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "home/faq";
	}
	@RequestMapping("/compare")
	public String compare(Model model) {
		List<Product> list = pdao.findAll();
		model.addAttribute("list", list);
		boolean kq = false;
		model.addAttribute("kq",kq);
		return "home/compare";
	}
	@PostMapping("/home/comparesubmit")
	public String comparesubmit(Model model, @RequestParam("slct1") String slct1, @RequestParam("slct2") String slct2) {
		List<Product> list = pdao.findAll();
		model.addAttribute("list", list);
		
		Product pro1 = pdao.findById(Integer.parseInt(slct1));
		Product pro2 = pdao.findById(Integer.parseInt(slct2));
		boolean kq = true;
		model.addAttribute("kq",kq);
		model.addAttribute("pro1",pro1);
		model.addAttribute("pro2",pro2);
		return "home/compare";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {

	}
}
