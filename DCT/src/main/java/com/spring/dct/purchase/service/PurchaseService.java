package com.spring.dct.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.purchase.mapper.IPurchaseMapper;
import com.spring.dct.vo.PurchasesVO;

@Service
public class PurchaseService implements IPurchaseService {

	@Autowired
	private IPurchaseMapper mapper;
	
	@Override
	public void addPurchase(PurchasesVO vo) {
		mapper.addPurchase(vo);
	}

	@Override
	public List<PurchasesVO> listPurchase(int userNo) {
		return mapper.listPurchase(userNo);
	}

}
