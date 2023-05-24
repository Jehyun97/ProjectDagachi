package com.sbs.dagachi.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationVO {
	
	private int reservation_Code;
	private int room_Code;
	private Date reservation_Start;
	private Date reservation_End;
	private Date reservation_Regtime;
	private String reservation_Member;
	
	
	
}
