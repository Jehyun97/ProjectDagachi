package com.lsh.exam.dagachi.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Reservation {
	
	private int reservation_code;
	private int room_code;
	private Date reservation_start;
	private Date reservation_end;
	private String reservation_member;
	private Date reservation_regtime;
	

}
