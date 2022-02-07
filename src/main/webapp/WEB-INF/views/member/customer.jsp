<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<body>
	<div class="div1">
		<div class="div2">
			<div class="div3">칰칰폭폭 가이드</div>
			<a class="aaa">칰칰폭폭은 혼자 배달을 주문할 때 생기는 <br>1인 가구의 배달료 부담을
				해소하고, <br>배달음식에 대한 정보를 공유할 수 있는 <br>커뮤니티를 형성하고자 합니다.
			</a>

			<div class="div4">&nbsp;</div>
			<table border=1>


				<tr>
					<th><div type="button" class="th_1" id="list_btn_1">

							<img src="/resources/image/list_1.png" class="logo" /> 모집 게시판에서 직접
							파티장으로 파티원을 모집하거나 <br>만들어진 방을 <a class="bold">참가해 보세요</a> <img
								src="/resources/image/down_btn.png" class="logo_1" />
						</div></th>


				</tr>

				<tr>
					<td class="tr_1" id="list_list_1"><br>ㆍ<a class="bold">파티장</a>으로 시작한다면, 모집
						게시판에서 원하는 음식방을 만들어서 파티원을 모집해 주세요!<br> <br>ㆍ<a
						class="bold">파티원</a>으로 시작한다면, 모집 게시판에서 원하는 음식방에 '참여하기' 버튼을 누르기만 하면
						끝!</td>


				</tr>
				
				


				<tr>
					<th><div type="button" class="th_1" id="list_btn_2">

							<img src="/resources/image/list_2.png" class="logo" />귀찮은 요금계산 없이 바로 <a class="bold"> 볼 수 있어요</a> <img
								src="/resources/image/down_btn.png" class="logo_1" />
						</div></th>


				</tr>

				<tr>
					<td class="tr_1" id="list_list_2"><br><br>모집 게시판에서<a class="bold">'참여하기'</a>버튼을 누르면 본인 몫의 음식값과 배달료가 나와요!</td>


				</tr>
				
				
				
				
								<tr>
					<th><div type="button" class="th_1" id="list_btn_3">

							<img src="/resources/image/list_3.png" class="logo" />방에 참가를 하면 바로 채팅방에<a class="bold"> 참여를 할 수 있어요</a> <img
								src="/resources/image/down_btn.png" class="logo_1" />
						</div></th>


				</tr>

				<tr>
					<td class="tr_1" id="list_list_3"><br>ㆍ<a class="bold">'참여하기'</a>버튼을 누르면 같은 방에 사람들과 단체로 연락을 주고받을 수 있어요<br> <br>
					ㆍ파티장과 기존에 있는 파티원은 새로운 파티원이 들어오면 반갑게 맞이해주세요 :)</td>


				</tr>
				
				
								<tr>
					<th><div type="button" class="th_1" id="list_btn_4">

							<img src="/resources/image/list_4.png" class="logo" />원하는 지역과 음식을  <a class="bold">검색할 수 있어요</a> <img
								src="/resources/image/down_btn.png" class="logo_1" />
						</div></th>


				</tr>

				<tr>
					<td class="tr_1" id="list_list_4"><br><br>ㆍ'검색 버튼'을 통하여 지역 / 음식을 검색할 수 있어요!</td>
				</tr>
				
				
				
				<tr>
					<th><div type="button" class="th_1" id="list_btn_5">

							<img src="/resources/image/list_5.png" class="logo" /> 시간이 없다면 
					<a class="bold">상단</a>에 있는 방을 참여하세요! <img
								src="/resources/image/down_btn.png" class="logo_1" />
						</div></th>


				</tr>

				<tr>
					<td class="tr_1" id="list_list_5"><br>ㆍ모집 마감시간/ 모집인원이 적게 남아있는 순으로 정렬이 됩니다. 시간이 없거나 빨리 배달을 시키고 싶다면
위쪽에 있는 방에 참여를 하세요 ! </td>


				</tr>
				
				
				
				
				



			</table>
		</div>
	</div>
</body>
</html>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var check1 = true;
	var check2 = true;// display: none 상태
	$(document).ready(function() {

		$("#list_btn_1").click(function() {
			if (check1) {
				$('#list_list_1').fadeIn(1000, function() {
					$('#list_list_1').css('display', 'block');

					check1 = false;
				});
			} else {
				$('#list_list_1').fadeOut(1000, function() {
					$('#list_list_1').css('display', 'none');

					check1 = true;
				});
			}
		});


		$("#list_btn_2").click(function() {
			if (check1) {
				$('#list_list_2').fadeIn(1000, function() {
					$('#list_list_2').css('display', 'block');

					check1 = false;
				});
			} else {
				$('#list_list_2').fadeOut(1000, function() {
					$('#list_list_2').css('display', 'none');

					check1 = true;
				});
			}
		});

		
		$("#list_btn_3").click(function() {
			if (check1) {
				$('#list_list_3').fadeIn(1000, function() {
					$('#list_list_3').css('display', 'block');

					check1 = false;
				});
			} else {
				$('#list_list_3').fadeOut(1000, function() {
					$('#list_list_3').css('display', 'none');

					check1 = true;
				});
			}
		});
		
		
		
		$("#list_btn_4").click(function() {
			if (check1) {
				$('#list_list_4').fadeIn(1000, function() {
					$('#list_list_4').css('display', 'block');

					check1 = false;
				});
			} else {
				$('#list_list_4').fadeOut(1000, function() {
					$('#list_list_4').css('display', 'none');

					check1 = true;
				});
			}
		});
		
		
		
		$("#list_btn_5").click(function() {
			if (check1) {
				$('#list_list_5').fadeIn(1000, function() {
					$('#list_list_5').css('display', 'block');

					check1 = false;
				});
			} else {
				$('#list_list_5').fadeOut(1000, function() {
					$('#list_list_5').css('display', 'none');

					check1 = true;
				});
			}
		});
		
		

	}); // fun end
</script>