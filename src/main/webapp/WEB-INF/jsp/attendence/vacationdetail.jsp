<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/WEB-INF/jsp/include/openhead.jspf" %>
		<div class="small-box" style="background-color:#36394d;">
		<div class="inner">
			<div class="vacation" style="margin-top:20px; text-align:center; color:white;">
			<div class="yearvacation">
				<span style="margin-right:10px;">총 연차 횟수 : ${vacationYear }</span>
				<span class="delYear">잔여 연차 횟수 : ${vacationYear -  DelYear }</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span >사용 연차 횟수 : ${DelYear }</span>
			</div>
			<div class="monthvacation">
				<span style="margin-right:10px;">총 월차 횟수 : ${vacationMonth }</span>
				<span>잔여 월차 횟수 : ${vacationMonth - DelMonth }</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span >사용 월차 횟수 : ${DelYear }</span>
			</div>
		</div>
		</div>
		<div class="icon">
		</div>
	
		</div>
	
	
		
	<div class="content-list" style="margin:10px;">
		<div class="mt-3">
	      <table class="table table-fixed w-full">
	      	<thead>
				<tr>
					<th>연/월차 생성일(생성갯수)</th>
					<th>연/월차 사용일</th>
					<th>연/월차 사용개수</th>
					<th>사유</th>
				</tr>
				<thead>
				<tbody>
				<c:forEach items="${vacation }" var="vacation">
					<tr>
						<td><fmt:formatDate value="${vacation.year_vacation_regDate }" pattern="yyyy-MM-dd" /><fmt:formatDate value="${vacation.month_vacation_regDate }" pattern="yyyy-MM-dd" />(연차:${vacationYear }개/월차:${vacationMonth }개)</td>
						<td><fmt:formatDate value="${vacation.vacation_updateDate }" pattern="yyyy-MM-dd" /></td>
						<td>연차:${vacation.del_year_vacation_count }개/월차:${vacation.del_month_vacation_count }개</td>
						<td>
							<c:if test="${vacation.del_year_vacation_count > 0}">
							<button type="button" style="background-color:#81c147; border:none;">연차</button>
							</c:if>
							<c:if test="${vacation.del_month_vacation_count > 0}">
							<button type="button" style="background-color:#ffd400; border:none;">월차</button>
							</c:if>
						${vacation.vacation_reason }
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
	</div>


<%@include file="/WEB-INF/jsp/include/openfoot.jspf" %>