package com.sbs.dagachi.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dagachi.vo.Reservation;

@Mapper
public interface ReservationRepository {

	public List<Reservation> getForPrintReservations(int room_code, int limitStart, int limitTake,
			String searchKeywordTypeCode, String searchKeyword);

	public int getReservationCount(int room_code, String searchKeywordTypeCode, String searchKeyword);


}
