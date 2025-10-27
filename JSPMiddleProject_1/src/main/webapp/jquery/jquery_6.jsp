<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let position = parseInt($('#qmenu').css('top'))
	$(window).scroll(function(){
		let pos = $(window).scrollTop()
		$('#qmenu').stop().animate({"top":pos+position +"px"},1000)
		
	
	})
	$('#sendMsg').keydown(function(key){
		if(key.keyCode===13){ //enter
			let msg=$('#sendMsg').val()
			if(msg.trim() === ""){
				$('#sendMsg').focus()
				return
			}
			$('#recvMsg').append(msg+"<br>")
			$('#sendMsg').val("")
			$('#sendMsg').focus()
			
			// 스크롤바
			let ch=$('#chatArea').height()
			let m = $('#recvMsg').height()-ch
			$('#chatArea').scrollTop(m)
		}
	})

})

</script>
<style type="text/css">
#chatArea{
	width: 200px;
	height: 200px;
	overflow-y:auto;
	border : 1px solid black;
}
body{
	text-align: center;
	
}
#wrap{
	text-align:left;
	margin:0px auto;
	width:600px;
}
#qmenu{
	background: #CCCCFF;
	position: absolute;
	width: 200px;
	top: 100px;
	right: 10px;
}
</style>

</head>
<body>
	<div id="wrap">
		<pre>
			한화는 이대진 퓨처스팀 감독을 필두로 선수 28명으로 팀을 꾸려 일본 
			미야자키 피닉스 교육리그에 참가하기로 했다. 오는 27일까지 현지에 
			머물며 총 18경기를 소화하는 일정이었다.
			김경문 감독이 이끄는 1군 선수단은 플레이오프(PO)에 직행해 
			포스트시즌을 준비했다. 
			윤산흠은 플레이오프 엔트리에 들지 못해 교육리그로 향했다. 
			그곳에서 투구를 이어가고 있었다.
			한화는 플레이오프서 삼성 라이온즈를 시리즈 전적 3승2패로
			 물리치고 LG 트윈스가 기다리고 있는 한국시리즈(KS)에 올랐다. 
			 엔트리에 변화를 줬다. 투수 엄상백, 내야수 권광민을 제외하고 투수 윤산흠, 
			 김종수를 새로 합류시켰다.
			 한화는 이대진 퓨처스팀 감독을 필두로 선수 28명으로 팀을 꾸려 일본 
			미야자키 피닉스 교육리그에 참가하기로 했다. 오는 27일까지 현지에 
			머물며 총 18경기를 소화하는 일정이었다.
			김경문 감독이 이끄는 1군 선수단은 플레이오프(PO)에 직행해 
			포스트시즌을 준비했다. 
			윤산흠은 플레이오프 엔트리에 들지 못해 교육리그로 향했다. 
			그곳에서 투구를 이어가고 있었다.
			한화는 플레이오프서 삼성 라이온즈를 시리즈 전적 3승2패로
			 물리치고 LG 트윈스가 기다리고 있는 한국시리즈(KS)에 올랐다. 
			 엔트리에 변화를 줬다. 투수 엄상백, 내야수 권광민을 제외하고 투수 윤산흠, 
			 김종수를 새로 합류시켰다.
			 한화는 이대진 퓨처스팀 감독을 필두로 선수 28명으로 팀을 꾸려 일본 
			미야자키 피닉스 교육리그에 참가하기로 했다. 오는 27일까지 현지에 
			머물며 총 18경기를 소화하는 일정이었다.
			김경문 감독이 이끄는 1군 선수단은 플레이오프(PO)에 직행해 
			포스트시즌을 준비했다. 
			윤산흠은 플레이오프 엔트리에 들지 못해 교육리그로 향했다. 
			그곳에서 투구를 이어가고 있었다.
			한화는 플레이오프서 삼성 라이온즈를 시리즈 전적 3승2패로
			 물리치고 LG 트윈스가 기다리고 있는 한국시리즈(KS)에 올랐다. 
			 엔트리에 변화를 줬다. 투수 엄상백, 내야수 권광민을 제외하고 투수 윤산흠, 
			 김종수를 새로 합류시켰다.
			 한화는 이대진 퓨처스팀 감독을 필두로 선수 28명으로 팀을 꾸려 일본 
			미야자키 피닉스 교육리그에 참가하기로 했다. 오는 27일까지 현지에 
			머물며 총 18경기를 소화하는 일정이었다.
			김경문 감독이 이끄는 1군 선수단은 플레이오프(PO)에 직행해 
			포스트시즌을 준비했다. 
			윤산흠은 플레이오프 엔트리에 들지 못해 교육리그로 향했다. 
			그곳에서 투구를 이어가고 있었다.
			한화는 플레이오프서 삼성 라이온즈를 시리즈 전적 3승2패로
			 물리치고 LG 트윈스가 기다리고 있는 한국시리즈(KS)에 올랐다. 
			 엔트리에 변화를 줬다. 투수 엄상백, 내야수 권광민을 제외하고 투수 윤산흠, 
			 김종수를 새로 합류시켰다.
			 한화는 이대진 퓨처스팀 감독을 필두로 선수 28명으로 팀을 꾸려 일본 
			미야자키 피닉스 교육리그에 참가하기로 했다. 오는 27일까지 현지에 
			머물며 총 18경기를 소화하는 일정이었다.
			김경문 감독이 이끄는 1군 선수단은 플레이오프(PO)에 직행해 
			포스트시즌을 준비했다. 
			윤산흠은 플레이오프 엔트리에 들지 못해 교육리그로 향했다. 
			그곳에서 투구를 이어가고 있었다.
			한화는 플레이오프서 삼성 라이온즈를 시리즈 전적 3승2패로
			 물리치고 LG 트윈스가 기다리고 있는 한국시리즈(KS)에 올랐다. 
			 엔트리에 변화를 줬다. 투수 엄상백, 내야수 권광민을 제외하고 투수 윤산흠, 
			 김종수를 새로 합류시켰다.
			 한화는 이대진 퓨처스팀 감독을 필두로 선수 28명으로 팀을 꾸려 일본 
			미야자키 피닉스 교육리그에 참가하기로 했다. 오는 27일까지 현지에 
			머물며 총 18경기를 소화하는 일정이었다.
			김경문 감독이 이끄는 1군 선수단은 플레이오프(PO)에 직행해 
			포스트시즌을 준비했다. 
			윤산흠은 플레이오프 엔트리에 들지 못해 교육리그로 향했다. 
			그곳에서 투구를 이어가고 있었다.
			한화는 플레이오프서 삼성 라이온즈를 시리즈 전적 3승2패로
			 물리치고 LG 트윈스가 기다리고 있는 한국시리즈(KS)에 올랐다. 
			 엔트리에 변화를 줬다. 투수 엄상백, 내야수 권광민을 제외하고 투수 윤산흠, 
			 김종수를 새로 합류시켰다.
		</pre>
	</div>
	<div id="qmenu">
		<ul style="list-style:none;">
			<li>홈</li>
			<li>영화</li>
			<li>뮤직</li>
			<li>뉴스</li>
			<li>커뮤니티</li>
		</ul>
	</div>
	<table class=table>
		<tr>
			<td>
				<div id="chatArea">
					<div id="recvMsg"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td >
				<input type=text size=20 id="sendMsg">
			</td>
		</tr>
	</table>
</body>
</html>