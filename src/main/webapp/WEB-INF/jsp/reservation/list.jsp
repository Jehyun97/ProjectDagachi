<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/jsp/common/head.jspf" %>

<div class="content-wrapper" >
<h2 style="margin:10px;">회의실 예약</h2>
<div class="insertbtn" style="margin:10px;">
	<button class="ml-2 btn btn-primary">신규등록</button>
</div>
  <div class="flex" style="margin-top:10px;">
     <div class="flex-grow"></div>
     <form class="flex" style="text-align:right;margin-right:10px;">
        <input type="hidden" name="reservation_code" value="${param.reservation_code}" />
        <select name="searchKeywordTypeCode" data-value="${param.searchKeywordTypeCode }" id="" class="select select-bordered">
           <option disabled="disabled">검색타입</option>
           <option value="room_code">회의실번호</option>
           <option value="reservation_member">등록자</option>
           <option value="room_code,reservation_member">회의실번호,등록자</option>
        </select>
        <input name="searchKeyword" type="text" class="ml-2 w-72 input input-bordered" placeholder="검색어" maxlength="20" value="${param.searchKeyword }" />
      <button type="submit" class="ml-2 btn btn-primary">검색</button>
     </form>
      <div style="margin:10px;">회의실 예약 : <span class="text-blue-700">${reservationCount }</span> 건</div>
  </div>
	<div class="content-list" style="margin:10px;">
		<div class="mt-3">
	      <table class="table table-fixed w-full">
	        <colgroup>   
	          <col width="50"/>
	          <col width="50"/>
	          <col width="50"/>
	          <col width="50"/>
	          <col width="50"/>
	          <col width="50"/>
	          <col />
	        </colgroup>
	        <thead>
	          <tr>
	            <th>번호</th>
	            <th>회의실번호</th>
	            <th>시작시간</th>
	            <th>끝나는시간</th>
	            <th>등록자</th>
	            <th>등록날짜</th>
	          </tr>
	        </thead>
	        <tbody>
	          <c:forEach var="reservation" items="${reservations}">
				    <tr class="hover">
				        <th>${reservation.reservation_code}</th>
				        <td>${reservation.room_code}</td>
				        <td><fmt:formatDate value="${reservation.reservation_start}" pattern="yyyy-MM-dd" /></td>
				        <td><fmt:formatDate value="${reservation.reservation_end}" pattern="yyyy-MM-dd" /></td>
				        <td>
				            <a class="btn-text-link block w-full truncate" href="../reservation/detail?id=${reservation.reservation_code}">${reservation.reservation_member}</a>
				        </td>
				        <td><fmt:formatDate value="${reservation.reservation_regtime}" pattern="yyyy-MM-dd" /></td>
				    </tr>
				</c:forEach>
	        </tbody>
	      </table>
    	</div>
	</div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jspf" %>