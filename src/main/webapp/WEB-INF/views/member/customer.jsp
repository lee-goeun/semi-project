<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
	

<body>
	<div class="div1">
		<div class="div2">
		<div class="div3">칰칰폭폭 가이드</div>
		<a class="aaa">칰칰폭폭은 혼자 배달을 주문할 때 생기는 
		<br>1인 가구의 배달료 부담을 해소하고,
		<br>배달음식에 대한 정보를 공유할 수 있는
		<br>커뮤니티를 형성하고자 합니다. </a>
		
		<div class="div4">&nbsp;</div>
		<table border=1>
		
		
			<tr>
				<th><div type="button" class="th_1"><img src="/resources/image/logo.png" class="logo" />
				빠른매칭은 파티장과 파티원을<br><a class="bold">자동으로 매칭해줘요</a></div></th>
		

			</tr>

			<tr class="tr_3">
				<td class="tr_1"><br>ㆍ<a class="bold">파티장</a>으로 시작한다면, 구독하는 서비스의 계정을 칰칰폭폭에 등록하세요.
									<br><br>ㆍ<a class="bold">파티원</a>으로 시작한다면,"빠른 매칭 시작하기"버튼을 누르기만 하면 끝!</td>
	

			</tr>
			
			
			
			
	<!-- 		<tr>
				<th><button class="th_2">이렇게 하는게 궁금합니다.</button></th>
		

			</tr>

			<tr class="tr_2">
				<td class="tr_2">위치기반 서비스로 전 지역을 못봐요 .</td> -->
	

			</tr>
		</table>
		</div>
	</div>
</body>
</html>

<script>


	var check1 = true;
	var check2 = true;// display: none 상태
	$(document).ready(function() {

		$(".th_1").click(function() {
			if (check1) {
				$('.tr_1').css('display', 'inline-block');
				check1 = false;
			} else {
				$('.tr_1').css('display', 'none');
				check1 = true;
			}
		});
		

			$(".th_2").click(function() {
				console.log("click")
				if (check2) {
					$('.tr_2').css('display', 'inline-block');
					check2 = false;
				} else {
					$('.tr_2').css('display', 'none');
					check2 = true;
				}

			});
			
			
			
			
			
		});  // fun end 

</script>