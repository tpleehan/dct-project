package com.spring.dct.purchase.mapper;

import java.util.List;

import com.spring.dct.vo.PurchasesVO;

public interface IPurchaseMapper {

	// 구매내역 추가
	void addPurchase(PurchasesVO vo);
	
	// 구매내역 목록 얻어오기
	List<PurchasesVO> listPurchase(int userNo);
	
	
}
