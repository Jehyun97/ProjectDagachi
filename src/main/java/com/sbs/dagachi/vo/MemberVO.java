package com.sbs.dagachi.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	

	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_address;
	private Date member_regdate;
	private String member_phone;
	private int member_department;
	private int member_team;
	private String member_reak;
	private int member_status;
	private Date member_deldate;
	private Date birth;
	private int member_auth;
	private String member_pic;

}