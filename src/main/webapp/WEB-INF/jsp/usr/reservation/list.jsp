<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jspf" %>

<div class="content-wrapper">
	<div class="content-list">
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
	          <c:forEach var="reservation" items="${reservation}">
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

<%@include file="../common/foot.jspf" %>