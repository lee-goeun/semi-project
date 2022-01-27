<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<h1>관리자용</h1>

<script type="text/javascript">
function memberDel(uid){
	location.href="/member/memberdelete?uid="+uid}
	
	; // 쿼리스트링 방식을 이용하여 num값이 주소에 get방식으로 붙어 넘어가도록 지정한다.
</script>


<form id="delete_form" method="GET">
 <table>
        <thead>
       
            <tr>
            	<th>닉네임</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>성명</th>
                <th>이메일</th>
                <th>우편번호</th>
                <th>도로명주소</th>
                <th>상세주소</th>
                <th>가입날짜</th>
                
            
            </tr>
        </thead>
        <tbody>
        
            <c:forEach items="${memberview}" var="member">
             
                <tr>
            		<td>${member.nickname}</td>
                    <td>${member.upass}</td>
                    <td>${member.name}</td>
                    <td>${member.email}</td>
                    <td>${member.uid}</td>
                    <td>${member.postCode}</td>
                    <td>${member.address}</td>
                     <td>${member.addressSpecific}</td>
                     <td>${member.signupDate}</td>
                   <!--  <td><input type="button" class="del_btn" value="삭제" onclick="memberDel(${membervo.uid})"> </td>           
                 --></tr>
                
            </c:forEach>
            
        </tbody>
    </table>

</form>

</body>
</html>