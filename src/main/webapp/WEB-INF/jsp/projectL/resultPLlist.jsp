<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="pl" items="${plList }">
<div class="card-body">
		<div class="col-12">
			<div class="info-box bg-success">
			<input type="hidden" name="pl_id_value" value="" />
				<div class="info-box-content">
					<h3>${pl.pl_Name }</h3>
					<span>현재 진헹율 70%</span>
					<div class="progress">
						<div class="progress-bar" style="width: 70%"></div>
					</div>
					<div class="row">
						<fmt:formatDate var="endDate" value="${pl.pl_EndDate }" pattern="yyyy년 MM월 dd일"/>
						<div class="col-sm-6">마감기한: ${endDate }</div>
						<div class="col-sm-6 text-right" >
						<a href="javascript:OpenWindow('moveAnotherTeamForm?pl_id=${pl.pl_Id }','업무관리',800,700)" style="color:white;">
							업무 설정
						</a>
						
						</div><!-- 여기다가 클릭시 다른 업무로 업무 파싱하기 -->
					</div>
					<div class="row">
					
					<div class="col-12">
						<div class="card card-warning collapsed-card">
						<div class="card-header">
						<h3 class="card-title">업무 상세보기</h3>
						<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse">
						<i class="fas fa-plus"></i>
						</button>
						</div>
						
						</div>
						
						<div class="card-body" style="display: none; color:black;">
							<ul style="max-height:200px;">
									<c:set var="pl_BodyArr" value="${fn:split(pl.pl_Body,'^')}"></c:set>
									<c:forEach var="per" items="${pl_BodyArr}">
										<li>
											${per }
										</li>
									</c:forEach>
							</ul>
						</div>
						
						</div>
						
						</div>
					</div>
				
				</div>
			
			</div>
		
		</div>
	</div>

				
</c:forEach>