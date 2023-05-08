package com.sbs.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dagachi.vo.Reservation;

@Mapper
public interface ReservationRepository {

	
	public List<Reservation> getReservationList();
	

}
