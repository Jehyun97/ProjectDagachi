package com.sbs.dagachi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sbs.dagachi.repository.ReservationRepository;
import com.sbs.dagachi.vo.Reservation;

@Service
public class ReservationService {
	private ReservationRepository reservationRepository;
	
	public ReservationService(ReservationRepository reservationRepository) {
		this.reservationRepository = reservationRepository;
	}
	
	
	
	public List<Reservation> getForPrintReservations(int room_code,String searchKeywordTypeCode, String searchKeyword, int itemsCountInAPage, int page) {
	    int limitStart = (page - 1) * itemsCountInAPage;
	    int limitTake = itemsCountInAPage;
	    
	    List<Reservation> reservations = reservationRepository.getForPrintReservations(room_code, limitStart, limitTake, searchKeywordTypeCode, searchKeyword);
	    
	    return reservations;
	}

	public int getReservationCount(int room_code, String searchKeywordTypeCode, String searchKeyword) {
	    return reservationRepository.getReservationCount(room_code, searchKeywordTypeCode, searchKeyword);
	}

	

	
}