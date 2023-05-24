<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="메인"/>

<%@include file="../include/openhead.jspf" %>

<div style="width:1200px; height:800px;">
  <div class="table" style="display:flex; margin-left:15px; width:100%; height:100%;">
         <div class="col-md-8" style="width:60%;">
            <table class="table-hover table-fixed w-full">
            <colgroup>   
             <col width="250"/>
             <col width="150"/>
             <col width="150"/>
             <col width="150"/>
             <col width="200"/>
             <col width="250"/>
           </colgroup>
                  <thead>
                    <tr>
                      <th>사진</th>
                      <th>직급</th>
                      <th>이름</th>
                      <th>출근여부</th>
                      <th>출근시간</th>
                      <th>월차(사유)/연차(사유)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>LSH</td>
                      <td>PL</td>
                      <td>이수현</td>
                      <td><span class="tag tag-success">출근</span></td>
                      <td>07:55</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>CWC</td>
                      <td>사원</td>
                      <td>최원천</td>
                      <td><span class="tag tag-warning">출근</span></td>
                      <td>08:00</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>JSH</td>
                      <td>사원</td>
                      <td>장시혁</td>
                      <td><span class="tag tag-primary">지각</span></td>
                      <td>09:05</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>PJH</td>
                      <td>사원</td>
                      <td>박제현</td>
                      <td><span class="tag tag-danger">연차</span></td>
                      <td></td>
                      <td>연차(집사행동)</td>
                    </tr>
                  </tbody>
                </table>
         </div>
         <div class="col-md-4" style="width:40%;">
         
            <table class="table table-head text-nowrap">
                  <thead>
                    <tr>
                      <th>정상</th>
                      <th>지각</th>
                      <th>결근</th>
                      <th>조퇴</th>
                      <th>출근률</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>10</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                      <td>100%</td>
                    </tr>
                  </tbody>
                </table>
                <table class="table table-head-fixed text-nowrap">
                  <thead>
                    <tr>
                      <th>날짜</th>
                      <th>출근</th>
                      <th>퇴근</th>
                      <th>근태상태</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>23-05-09</td>
                      <td>08:00</td>
                      <td>22:00</td>
                      <td>출근</td>
                    </tr>
                    
                  </tbody>
                </table>
         </div>
      </div>
     </div>
 
        


<%@include file="../include/openfoot.jspf" %>