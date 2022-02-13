
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="ko">
  <head>
<style>


.table1 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #369;
  margin : 20px 10px;
}
.table1 th {
  width: 147px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #153d73;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
.table1 td {
  width: 349px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

<h1>회원 정보</h1>

<script type="text/javascript">
function memberDel(uid){
	location.href="/member/memberdelete?uid="+uid};
</script>


<form id="delete_form" method="GET">
 <table class="table1">
        <thead>
       
            <tr class="table2">
            	<th>성명</th>
            	<th>닉네임</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이메일</th>
                <th>우편번호</th>
                <th>도로명주소</th>
                <th>상세주소</th>
          		
            </tr>
        </thead>
        <tbody>
        	
            <c:forEach items="${memberview}" var="member">
              
                <tr>
               	 	<td>${member.name}</td>
            		<td>${member.nickname}</td>
            		 <td>${member.uid}</td>
                    <td>${member.upass}</td>
                    <td>${member.email}</td>   
                    <td>${member.postCode}</td>
                    <td>${member.address}</td>
                    <td>${member.addressSpecific}</td>
                
                  </tr>
                
            </c:forEach>
            
        </tbody>
    </table>

</form>

</body>
</html>