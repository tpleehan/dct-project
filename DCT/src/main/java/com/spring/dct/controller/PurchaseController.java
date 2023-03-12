package com.spring.dct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dct.purchase.service.IPurchaseService;
import com.spring.dct.vo.PurchasesVO;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	private IPurchaseService service;

	@PostMapping("/paymentCompleted")
	public String paymentCompleted(PurchasesVO vo) {
		System.out.println("paymentCompleted POST");
		
		service.addPurchase(vo);
		
		return "redirect:/";
	}
	
}
