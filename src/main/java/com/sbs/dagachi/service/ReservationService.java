package com.sbs.dagachi.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.dagachi.repository.ReservationRepository;
import com.sbs.dagachi.vo.Reservation;


@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	public ReservationService( ReservationRepository reservationRepository) {
		this.reservationRepository = reservationRepository;
		
	}
	
	public List<Reservation> getReservationList() {
		return reservationRepository.getReservationList();
	}

	public int getReservationCount(int reservation_code, String searchKeywordTypeCode, String searchKeyword) {
		// TODO Auto-generated method stub
		return 0;
	}


}
