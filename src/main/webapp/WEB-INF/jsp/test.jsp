<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="캘린더" />
<%@page import="com.sbs.dagachi.vo.ScheduleVO"%>
<%@include file="../jsp/include/head.jspf"%>
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js'></script>


<script>
  $(document).ready(function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      // 달력 설정 옵션을 추가합니다.
      // 예를 들어, 이벤트 데이터를 가져올 URL을 설정하고, 이벤트 데이터를 가공하여 표시하는 로직을 작성합니다.
    });

    calendar.render();
  });


  function deleteSchedule(arg) {
		var msg;
		if (confirm('일정을 삭제하시겠습니까?')) {
			$.post('../caln/doDeleteSchedule', {
				id : arg.event.id
			}, function(data) {
				if (data.success) {
					arg.event.remove();
					alert(data.msg);
				} else {
					if (data.msg) {
						alert(data.msg);
					}
				}
			}, 'json');
		}
		return msg;
	}
	function addSchedule(calendar, arg) {
		console.log(arg);
		
		$('#createEventModal').click();
		
		var title = prompt('Event Title:');
		if (title) {
			calendar.addEvent({
				title : title,
				start : arg.start,
				end : arg.end,
				allDay : arg.allDay
			})
		}
		calendar.unselect();
	}
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		$.get('../usr/caln/getCalendar', {
			isAjax : 'Y',
			dataType : "json"
		}, function(data) {
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				},
				businessHours : false, // 주말 선택여부
				navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable : true, // 수정 가능
				selectable : true,// 달력 일자 드래그 설정가능
				locale : 'ko', // 한국어 설정
				nowIndicator : true, // 현재 시간 마크
				dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)				
				events : data,
				eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},
				eventClick : function(arg) { // 생성된 이벤트 클릭 시 발생되는 이벤트 => 일정삭제
					deleteSchedule(arg);
				},
				select : function(arg) { // 달력 클릭, 드래그 시 발생되는 이벤트 => 일정생성
					addSchedule(calendar, arg);
				}
			});
			calendar.render();
		}, 'json');
	});
</script>









<div class="content-wrapper">
  <div id="calendar"></div>

<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label for="schedule_title" class="col-form-label">일정 제목</label>
          <input type="text" class="form-control" id="schedule_title" name="schedule_title" >
          <label for="schedule_start" class="col-form-label">시작 시간 설정</label>
          <input type="datetime-local" class="form-control" id="schedule_start" name="schedule_start">
          <label for="schedule_end" class="col-form-label">종료 시간 설정</label>
          <input type="datetime-local" class="form-control" id="schedule_end" name="schedule_end">
          <input type="hidden" id="schedule_start" name="schedule_start">
          <input type="hidden" id="reservation_end" name="reservation_end">
          <label for="schedule_content" class="col-form-label">일정 내용</label>
          <textarea name="calendar_content" id="shedule_content" cols="40" rows="10" placeholder="내용을 입력하세요"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-warning" id="addCalendar">추가</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 상세  -->
<div class="modal fade" id="calendarDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정 상세 정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label for="schedule_title_detail" class="col-form-label">일정 제목</label>
          <input type="text" class="form-control" id="schedule_title_detail" name="schedule_title" readonly>
          <label for="schedule_start_detail" class="col-form-label">시작 시간</label>
          <input type="text" class="form-control" id="schedule_start_detail" name="schedule_start" readonly>
          <label for="schedule_end_detail" class="col-form-label">종료 시간</label>
          <input type="text" class="form-control" id="reservation_end_detail" name="schedule_end" readonly>
          <label for="schedule_content_detail" class="col-form-label">일정 사유</label>
          <input type="text" class="form-control" id="calendar_content_detail" name="reservation_title" readonly>
        </div>
      </div>
      <div class="modal-footer">
         
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
       <c:if test="${loginUser.member_id ne reservation_member }">
          <button type="button" class="btn btn-warning" id="modifyButton" data-dismiss="modal">수정</button>
          <button type="button" class="btn btn-danger" id="deleteButton" data-dismiss="modal">삭제</button>
     </c:if>
      </div>
    </div>
  </div>
</div>



<!-- 수정,삭제  -->
<div class="modal fade" id="calendarModifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정 상세 정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label for="calendar_user_modify" class="col-form-label">사용자</label>
          <input type="text" class="form-control" id="calendar_user_modify" name="reservation_member" readonly>
          <label for="room_code_modify" class="col-form-label">회의실 명</label>
            <select class="form-control" id="room_code_modify" name="room_code">
            <c:forEach var="room" items="${room}">
              <option value="${room.room_code}">${room.room_name}</option>
            </c:forEach>
          </select>
          <label for="calendar_content_modify" class="col-form-label">일정 사유</label>
          <input type="text" class="form-control" id="calendar_content_modify" name="reservation_title" >
           <label for="reservation_start_modify" class="col-form-label">시작 날짜</label>
          <input type="datetime-local" class="form-control" id="reservation_start_modify" name="reservation_start">
          <label for="reservation_end_modify" class="col-form-label">종료 날짜</label>
          <input type="datetime-local" class="form-control" id="reservation_end_modify" name="reservation_end">
          <input type="hidden" id="reservation_code" name="reservation_code">
        </div>
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-warning" id="modifyButton" data-dismiss="modal">수정</button>
        <button type="button" class="btn btn-danger" id="deleteButton" data-dismiss="modal">삭제</button>

      </div>
    </div>
  </div>
</div>
</div>

<%@include file="../jsp/include/foot.jspf"%>