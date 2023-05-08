package com.lsh.exam.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lsh.exam.dagachi.vo.Reservation;

@Mapper
public interface ReservationRepository {

	
	public List<Reservation> getReservationList();
	

}
