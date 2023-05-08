package com.sbs.dagachi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.dagachi.service.ReservationService;
import com.sbs.dagachi.vo.Reservation;

@Controller
public class UsrReservationController {
	
	public ReservationService reservationService;
	
	public UsrReservationController(ReservationService reservationService) {
		this.reservationService = reservationService;
	}

	@RequestMapping("/reservation/list")
	public String showList(Model model,  @RequestParam(defaultValue = "1") int room_code,
	                       @RequestParam(defaultValue = "1") int page,
	                       @RequestParam(defaultValue = "room_code,reservation_member") String searchKeywordTypeCode,
	                       @RequestParam(defaultValue = "") String searchKeyword) {

	   
	    int reservationCount = reservationService.getReservationCount(room_code, searchKeywordTypeCode, searchKeyword);
	    int itemsCountInAPage = 10;
	    int pagesCount = (int) Math.ceil((double) reservationCount / itemsCountInAPage);

	    List<Reservation> reservations = reservationService.getForPrintReservations(room_code,
	    		searchKeywordTypeCode, searchKeyword, itemsCountInAPage, page);

	    model.addAttribute("room_code", room_code);
	    model.addAttribute("page", page);
	    model.addAttribute("pagesCount", pagesCount);
	    model.addAttribute("reservationCount", reservationCount);
	    model.addAttribute("reservations", reservations);

	    return "/reservation/list";
	}

	
	
	
	  
}
