<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
</head>
<body>
	<div class="boxes">
		<div class="profilebox">
			<div class="profile-wrapper">
				<c:choose>
					<c:when test="${principal.memberdto.avatar eq 'slime' }">
						<c:choose>
							<c:when test="${level eq '1'}">
								<img class=profileimg src="/img/slime1.jpg">
							</c:when>
							<c:when test="${level eq '2'}">
								<img class=profileimg src="/img/slime2.jpg">
							</c:when>
							<c:when test="${level eq '3'}">
								<img class=profileimg src="/img/slime3.jpg">
							</c:when>
							<c:otherwise>
								<img class=profileimg src="/img/slime3.jpg">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${principal.memberdto.avatar eq 'human' }">
						<c:choose>
							<c:when test="${level eq '1'}">
								<img class=profileimg src="/img/human1.jpg">
							</c:when>
							<c:when test="${level eq '2'}">
								<img class=profileimg src="/img/human2.jpg">
							</c:when>
							<c:when test="${level eq '3'}">
								<img class=profileimg src="/img/human3.jpg">
							</c:when>
							<c:otherwise>
								<img class=profileimg src="/img/human3.jpg">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<img class=profileimg src="/img/select.png">
					</c:otherwise>
				</c:choose>

			</div>
			<div class="nick-level">
				<h1>${principal.memberdto.nickname}</h1>
				<h3>Level : ${level}</h3>
				<h4>Exp : ${expsum}</h4>
			</div>

			<div class="listContainer">
				<a href="/updateform" class="setting">
					<div class="sicon">
						<img class="imgicon" src="/img/pig.svg">
					</div>
					<div class="stext">
						<p>???????????? ????????????</p>
						<span class="circle"></span>
					</div>
					<div class="sright">
						<img class="imgicon" src="/img/setting.jpg">
					</div>
				</a> <a href="/passwordmodifyform" class="setting">
					<div class="sicon">
						<img class="imgicon" src="/img/pig.svg">
					</div>
					<div class="stext">
						<p>???????????? ????????????</p>
						<span class="circle"></span>
					</div>
					<div class="sright">
						<img class="imgicon" src="/img/setting.jpg">
					</div>
				</a> <a href="/deleteview" class="setting">
					<div class="sicon">
						<img class="imgicon" src="/img/pig.svg">
					</div>
					<div class="stext">
						<p>?????? ????????????</p>
						<span class="circle"></span>
					</div>
					<div class="sright">
						<img class="imgicon" src="/img/setting.jpg">
					</div>
				</a>

			</div>

		</div>

		<div class="challenge-box">
			<p><b>???????????? ?????????</b></p>
			<div class="challenge-ing">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:forEach items="${participate}" var="dto">
							<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
							<!-- ????????? ????????? ????????? ????????? -->
							<c:if test="${edate > today}">
								<div class="swiper-slide">
									<div class="slidetext" style="cursor: pointer;" onclick="location.href='/checkmorning?chnum=${dto.chnum}';">
										<div class="slidename">${dto.chname}</div>
										<img src="/checkimage/${dto.chimg}" class="slideimg" width="150px" height="150px">
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- ??????????????? -->
					<div class="swiper-button-next"></div>
					<!-- ?????? ?????? (???????????? ?????? ??????) -->
					<div class="swiper-button-prev"></div>
					<!-- ?????? ?????? -->

					<!-- ????????? -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
		

			<p><b>????????? ??????</b></p>
			<div class="challenge-ing">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:forEach items="${badge}" var="dto2" varStatus="status">
							<c:if test="${dto2.count == dto2.chsuccess}">
								<div class="swiper-slide">
									<div id="badgename">${dto2.chname}</div>
									<img id="badgein" src="img/badge/badge${(status.index)%3}.png" width="150px" height="150px">
								</div>
							</c:if>
						</c:forEach>
					</div>
					<!-- ??????????????? -->
					<div class="swiper-button-next"></div>
					<!-- ?????? ?????? (???????????? ?????? ??????) -->
					<div class="swiper-button-prev"></div>
					<!-- ?????? ?????? -->

					<!-- ????????? -->
					<div class="swiper-pagination"></div>
				</div>
			</div>

			<script>
				new Swiper('.swiper-container', {

					slidesPerView : 3, // ????????? ????????? ???????????? ??????
					spaceBetween : 30, // ??????????????? ??????
					slidesPerGroup : 3,

					// ???????????? ?????? ?????? ?????? ???????????? ?????????
					loopFillGroupWithBlank : true,

					loop : true, // ??????

					pagination : { // ?????????
						el : '.swiper-pagination',
						clickable : true, // ???????????? ???????????? ?????? ???????????? ??????, ????????? ????????? ?????? ?????? ??????
					},
					navigation : { // ???????????????
						nextEl : '.swiper-button-next', // ?????? ?????? ????????????
						prevEl : '.swiper-button-prev', // ?????? ?????? ????????????
					},
				});
			</script>
</body>
</html>