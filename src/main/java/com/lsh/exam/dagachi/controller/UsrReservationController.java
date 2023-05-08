package com.lsh.exam.dagachi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lsh.exam.dagachi.service.ReservationService;
import com.lsh.exam.dagachi.vo.Reservation;
import com.lsh.exam.demo.vo.Article;

@Controller
public class UsrReservationController {
	
	public ReservationService reservationService;
	
	public UsrReservationController(ReservationService reservationService) {
		this.reservationService = reservationService;
	}

	@RequestMapping("/usr/reservation/list")
	public String showList(int reservation_code, Model model, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "reservation_start, reservation_member") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {
		
		List<Reservation> list = reservationService.getReservationList();
		
		model.addAttribute("reservation", list);
		
		int reservationCount = reservationService.getReservationCount(reservation_code, searchKeywordTypeCode, searchKeyword);
		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) reservationCount / itemsCountInAPage);
		
		List<Reservation> reservationList = reservationService.getForPrintReservation(searchKeywordTypeCode, searchKeyword, itemsCountInAPage, page);
		
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("reservationCount", reservationCount);
		
		return "usr/reservation/list";
	}
	
	
	
	  
}
