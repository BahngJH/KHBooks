<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
	
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<%@ include file='/views/common/header.jsp'%>


<style>
body {
/* 	margin-top:40px; */
	background-color: silver;
}

.container {
	border: 1px solid darkgray;
	background-color: white;
}

.booktitle {
	font-size: 20px;
	font-family: '돋움체 보통';
	font-weight: bold;
	color: black;
	position: relative;
	margin-top: 30px;
}

.booktitle small {
	font-family: 'Courier New', Courier, monospace;
	font-weight: bold;
	color: rgb(59, 56, 56);
}

.writer {
	font-size: 12px;
}

.cover {
	margin-top: 35px;
}

.bookcover {
	size: 100px;
	width: 175px;
	height: 250px;
}

.sell_price strong {
	font-size: 25px;
	color: red;
}

.nom_point strong {
	font-size: 18px;
	color: red;
}

li {
	list-style: none;
}

.priceinfor {
	font-size: 12px;
}

.listprice {
	padding: 0;
}

.bookpicture {
	width: 175px;
	height: 250px;
}

.all {
	margin-left: 40px;
}

.pluslate {
	position: relative;
	top: 10px;
	width: 175px;
}

.pluslate .plus {
	margin-left: 25px;
	font-family: 'Courier New', Courier, monospace;
	color: black;
	background-color: white;
	border-color: white;
	text-shadow: 0;
	border: 0;
	font-size: 11px;
	text-align: center;
}

.pluslate .late {
	font-family: 'Courier New', Courier, monospace;
	color: black;
	background-color: white;
	border-color: white;
	text-shadow: 0;
	border: 0;
	font-size: 11px;
}

.choiceTab {
	position: relative;
	left: 215px;
	color: white;
	text-shadow: 0;
	font-size: 20px;
}

.jangba {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 95pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}

.buy {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 95pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}

.date {
	position: relative;
	top: 5px;
}

.lating {
	position: relative;
	top: 10px;
}

.lating .starlating {
	color: red;
	border: 0;
	padding: 0;
	background-color: white;
}

.reviewCount {
	color: black;
	border: 0;
	padding: 0;
	background-color: white;
}

.reviewWrite {
	color: black;
	border: 0;
	padding: 0;
	background-color: white;
}

.priceinfor {
	position: relative;
	top: -8px;
}

.wrline {
	display: inline-block;
	width: 1030px;
	white-space: inherit;
}

.wrline1 {
	display: inline-block;
	width: 1008px;
	white-space: inherit;
}

.biline {
	display: inline-block;
	width: 1030px;
	white-space: inherit;
}

.bsline {
	display: inline-block;
	width: 1030px;
	white-space: inherit;
}

.snline {
	display: inline-block;
	width: 200px;
	white-space: inherit;
}

.reviewpre {
	display: inline-block;
	width: 1030px;
	border: 1px solid gray;
	white-space: inherit;
}

input[type='checkbox'] {
	display: none;
}

label {
	color: royalblue;
	margin-top: 10px;
	cursor: pointer;
	display: inline-block;
}

label:after {
	content: '펼쳐보기';
}

input:checked ~ label:after {
	content: '닫기';
}

.inner1 {
	max-height: 60px;
	overflow: hidden;
	transition: all .2s ease;
	width: 1010px;
}

input:checked+.inner1 {
	max-height: 1000px;
}

.inner2 {
	max-height: 60px;
	overflow: hidden;
	transition: all .2s ease;
	width: 1010px;
}

input:checked+.inner2 {
	max-height: 1000px;
}

.inner3 {
	max-height: 60px;
	overflow: hidden;
	transition: all .2s ease;
	width: 1010px;
}

input:checked+.inner3 {
	max-height: 1000px;
}

.inner4 {
	max-height: 60px;
	overflow: hidden;
	transition: all .2s ease;
	width: 1010px;
}

input:checked+.inner4 {
	max-height: 1000px;
}

.writereview {
	float: right;
}

.allreview {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	font-size: 5px;
}

.reviewwrite {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	font-size: 5px;
}

.reviewtable {
	margin-bottom: 35px;
}

.sections {
	position: relative;
	margin-left: 10px;
}
</style>

<script language='javascript'>
	function change1(obj) {
		obj.style.background = 'rgb(66, 66, 66)';
		obj.style.color = 'white';
	}
	function change2(obj) {
		obj.style.background = 'black';
		obj.style.color = 'white';
	}
</script>

<section>
	<div class='container'>
		<div class='row section'>
			<div class='sections'>
				<div class='bookpicture col-sm-4'>
					<!-- 대표이미지 -->
					<div class='cover'>
						<div class='bookcover'>
							<a href='#' onclick=''> <img src='photo/bookpic/어린왕자.jpg'
								width='175' height='250'
								onerror="javascript:noImage(this,'L','KOR');' alt="어린왕자'>
							</a>
						</div>
						<div class='pluslate'>
							<button class='plus btn-link' onclick="location.href='#'">크게보기</button>
							<span>|</span>
							<button class='late btn-link' onclick="location.href='#'"">평점보기</button>
						</div>
					</div>
				</div>
				<div class='all col-sm-4'>
					<div class='alltitle'>
						<!--책제목,작가이름,관심작가등록,지음,옮김,출판사,출간일 -->
						<h1 class='booktitle'>
							<!-- 책 제목 -->
							<strong> 어린왕자<small>(a little prince)</small>
							</strong>
						</h1>
						<div class='writer'>
							<!-- 작가이름,관심작가등록,지음,옮김,출판사,출간일 -->
							<span class='name'> <!-- 작가이름, 관심작가등록 --> <span
								class='popup_load'> <a href='#'>앙투안 드 생텍쥐페리</a>
									<div class='tooltip' style='display: none;'>
										<a href='#'>작가상세정보</a> <span class='line'>|</span>
										<!-- 라인 -->
										<a href='#'>관심작가등록</a> <span class='arrow'></span>
									</div>
							</span>
							</span> 지음 <span class='line'>|</span>
							<!-- 라인 -->
							<span class='name'>이정서</span>
							<!-- 옮긴이 -->
							옮김 <span class='line'>|</span>
							<!-- 라인 -->
							<span class='name' title='출판사'> <!-- 출판사정보 --> <a href='#'>새움</a>
							</span> <br> <span class='date' title='출간일'> <!-- 출간일 -->
								2017년 09월 22일 출간
							</span> <span class='lating'>
								<p>
									<button class='starlating btn-link' onclick="location.href='#'">
										★★★★★</button>
									<span class='line'>|</span>
									<button class='reviewCount btn-link'
										onclick="location.href='#'">
										리뷰 <span class='counting'>1</span>개
									</button>
									<span class='line'>|</span>
									<button class='reviewWrite btn-link'
										onclick="location.href='#'">리뷰쓰러가기</button>
								</p>
							</span>
						</div>
					</div>
					<!--  -->
					<hr>
					<!--  -->
					<div class='priceinfor'>
						<!-- 가격정보 -->
						<ul class='listprice'>
							<li>정가 : <span class='org_price'> 6,000 원 </span> <br>
								판매가 : <span class='sell_price' title='판매가'> <strong>
										5,400 </strong> 원
							</span>
							</li>
							<li>
								<!-- 포인트 -->
								<div class='inkpoint'>
									<span class='all_inkpoint'>통합포인트 : </span> <span
										class='nom_point'> [포인트적립] <strong>300</strong>원 적립 [<strong>5</strong>%
										적립]
									</span> <br> <span class='earn_point'>[추가적립] 5만원 이상 구매 시
										2천원 추가적립</span> <br> <span class='earn_point'>[회원혜택] 우수회원
										5만원 이상 구매 시 2~3% 추가적립</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class='choiceTab'>
			<!-- <input type='button' value='^_^' onmouseout='change2(this)' onmouseover='change1(this)' style='background-color:white;'><br>
                마우스 올라오면 바뀌는 버튼<br><br> -->
			<button class='jangba btn-lg' onmouseout='change2(this)'
				onmouseover='change1(this)' onclick="location.href='#'">
				<strong>장바구니 담기</strong>
			</button>
			<button class='buy btn-lg' onmouseout='change2(this)'
				onmouseover='change1(this)' onclick="location.href='#">
				<strong>구매하기</strong>
			</button>
		</div>
		<hr>
		<div class='col-sm-12'>
			<div class='inforstorywr'>
				<table>
					<thead class='writerinfor'>
						<strong>저자소개</strong>
					</thead>
					<br>
					<br>
					<ul>
						<pre class='wrline'>
							<small>
                    <pre class='wrline1' style='border: 1px solid gray;'>
									<small><strong>
                    저자 : 앙투안 드 생텍쥐페리
                    </strong></small>
								</pre><br>
                    저자 앙투안 드 생텍쥐페리(Antoine de Saint-Exupery)는 프랑스 리옹 출생. 
                    1920년 공군에 입대, 1929년 장편소설 [남방 우편기]로 작가로 데뷔. 
                    두 번째 소설 [야간 비행]으로 페미나상을 수상, 이후 [인간의 대지]로 아카데미 프랑세즈 소설 대상 수상.
                    [인간의 대지]는 같은 해 미국에서 [바람, 모래와 별들]이라는 제목으로 영문판이 번역·출간되어 베스트셀러가되었다. 
                    1940년에 나치 독일에 의해 프랑스 북부가 점령되자 미국으로 망명했다. 
                    이 시기에 [어린 왕자]를 집필해 1943년 미국 Reynal & Hitchcock 출판사에서 영문판과 불문판으로 출간했다.
                    [어린 왕자]는 1946년 프랑스 Gallimard 출판사에서 다시 출간되었다. 
                    생텍쥐페리는 1943년에 프랑스로 돌아가 공군 조종사로 활동했으며, 1944년 지중해 상공에서 마지막 정찰비행 중 실종되었다.
                    이후에 친구들이 생텍쥐페리의 녹음본과 초벌 원고를 정리하여 [성채]를 출간했다.
                </small>
						</pre>
						<ul>
							<br>
							<br>
				</table>
			</div>

			<div class='inforstorybi'>
				<table>
					<thead class='bookinfor'>
						<strong>책소개</strong>
					</thead>
					<br>
					<br>
					<ul>
						<pre class='biline'>
							<small>
                    『어린 왕자』는 하나하나의 문장이 시(詩)만큼 간결하고 정교하게 구축된 작품이다. 
                    작품 전체가 주는 감동과 여운은 생텍쥐페리의 그 같은 시적 정서에 크게 의존한다.
                    이정서는 불어·영어·한국어 번역 비교를 통해 [어린 왕자]의 세계를 정밀하고 섬세하게 파고들었다. 
                    기존 역자들이 tu와 vous의 구분을 무시한 채 임의로 번역했던 것을 바로잡아 불어의 뉘앙스를 그대로 살렸으며, 
                    아침의 ‘Bonjour’도 ‘안녕’ 저녁의 ‘Bonsoir’도 ‘안녕’ 하는 식으로 번역함으로써 작품의 시간적 배경을 배제시켜온 기존 번역의 오류도 바로잡았다. 
                    이제 바르고 정확한 문장들로 쓰인 번역을 통해 생텍쥐페리가 [어린 왕자]를 통해 지구인들에게 선사하려던 메시지와 감동을 온전하게 파악하고 깊게 느낄 수 있다.
                </small>
						</pre>
					</ul>
					<br>
					<br>
				</table>
			</div>

			<div class='inforstorybs'>
				<thead class='bookstroy'>
					<strong>줄거리</strong>
				</thead>
				<br> <br>
				<ul>
					<pre class='bsline'>
						<small>
                    비행기 고장으로 사막에 불시착한 조종사는 한 소년을 만난다. 소년은 자신이 사는 작은 별에 사랑하는 장미를 남겨 두고 세상을 보기위해 여행을 온 어린 왕자였다.

                    어린 왕자는 몇 군데의 별을 돌아다닌 후 지구로 와 뱀, 여우, 조종사와 친구가 된다. 어느덧 여우와 어린 왕자는 서로를 길들여 ‘세상에서 하나밖에 없는 꼭 필요한 존재’로 남는다. 그리고 어린 왕자는 자신만의 특별한 존재인 장미를 떠올리며 떠나온 별로 다시 돌아가기로 결심한다.
                    
                    엔진 고장으로 사막에 불시착한 ‘나’는 어린 왕자를 만나게 된다. 
                    화가라는 직업을 포기하고 비행기 조종사가 된 ‘나’는 엔진 고장으로 사하라 사막에 불시착한다. 이때 어린 왕자가 나타나 양 한 마리를 그려달라고 조른다. ‘나’는 그 부탁을 들어주면서 어린 왕자의 별엔 화산이 셋 있고, 바오밥나무, 그가 사랑하는 꽃, 그 별에서의 생활들을 듣는다.
                    
                    그리고 같이 살고 있던 장미의 거짓말과 오만함 때문에 어린 왕자가 자신의 별을 떠나 여행을 하게 된 이유 등을 알게 된다.
                    
                    어린 왕자는 자신의 별과 이웃해 있던 별들을 방문하면서 다양한 어른들을 만난다. 
                    어린 왕자는 이웃한 여러 별을 여행한다. 권위만 내세우는 왕과 젠체하는 사람, 자책만 일삼는 술꾼과 소유하는 것만이 중요하다고 생각하는 부자, 책상을 떠나지 않으면서 세상의 지도를 그리는 지리학자와 일에 중독되어 있는 가로등 켜는 사람 등 다양한 사람들과 만나게 되고 그들의 잘못된 가치관에서 석연치 않음을 느낀다.
                    
                    마지막 별로 어린 왕자는 지구로 가게 되고, 뱀과 장미꽃을 만나고 사람을 찾으며 외로워한다. 
                    어린 왕자는 일곱 번째 별인 지구로 간다. 지구에 발을 들여놓았을 때 어린 왕자는 뱀과 꽃을 차례로 만나고, 사람들을 찾아 높은 산에 올라가 내 친구가 되어달라며 외롭다고 외친다. 그러나 들려오는 것은 메아리 뿐이다.
                    
                    그러다 한 정원에 5천 송이도 넘게 피어있는 장미꽃을 보고 놀란다. 자기가 가지고 있는 장미꽃이 세상에서 하나뿐이 아니라는 사실에 어린 왕자는 슬퍼하며 운다.
                    
                    어린 왕자는 여우를 만나서 길들인다는 것에 대한 의미를 알게 된다. 
                    풀숲에 엎드려 울고 있을 때 여우가 나타난다. 어린 왕자는 이리 와서 나와 같이 놀자고 한다. 그러나 여우는 길들여져 있지 않아서 너와 놀 수 없다고 한다. 여우는 길들인다는 것은 관계를 만든다는 것이고, 네가 나를 길들인다면 나는 너에게 이 세상에 오직 하나밖에 없는 존재가 된다는 이야기를 해 준다.
                    
                    그리고 여우는 중요한 것은 눈에 보이지 않으며, 너의 장미꽃을 소중하게 만든 건 그 꽃을 위해 네가 소비한 시간이고, 너는 네 장미에 대해 책임이 있다고 알려준다.
                    
                    뱀의 도움으로 어린 왕자는 자기 별로 돌아간다. 
                    어린 왕자는 뱀에게 도움을 청해 그의 별로 돌아가고자 한다. 때마침 비행기 엔진 수리를 마친 나는 어린 왕자와의 이별을 몹시 서글퍼하며 그가 모래언덕에서 사라지는 것을 지켜본다. 시간이 지나 ‘나’는 밤하늘을 바라보면서 어린 왕자의 별과 그의 장미꽃에 대해 생각한다.
                    
                    그리고 어떤 마음으로 바라보느냐에 따라 세상이 달라질 수 있다는 것을 깨달으며 어린 왕자를 그리워한다.
                </small>
					</pre>
				</ul>
				<br> <br>
			</div>
			<div class='inforstorysn'>
				<table>
					<thead class='storynum'>
						<strong>목차</strong>
					</thead>
					<br>
					<br>
					<ul>
						<pre class='snline'>
							<small>
                    이 책은 목차가 없습니다.
                </small>
						</pre>
					</ul>
					<br>
					<br>
				</table>
			</div>

			<div class='reviewtable'>
				<thead class='reviewth'>
					<strong>회원리뷰</strong>
				</thead>
				<br> <br>
				<ul>
					<pre class='reviewpre'>
                    <div class='writereview'>
                        <button class='reviewwrite btn-xs'
								onclick="location.href='#'">
								<strong>리뷰쓰기</strong>
							</button>
                    </div>
                    <br>
                    <div class='reviewtitle'>
                        <strong>
                        만번을 읽는다 해도 항상 마음을 울릴 소설
                        </strong>
                        <small>
                        <span class='info'>hw**g3324</span>
                        <span class='line'>|</span>
                        <span class='reviewdate'>2017-04-21</span>
                        <span class='line'>|</span>
                        <span class='reviewchoice'>추천 : 0</span>
                        <span class='line'>|</span>
                        <img src='photo/rating/star05.gif'>
                        </small>
                    </div>
                    <div class='content'>
                        <small>
                            <input type='checkbox' id='readmore1' /> 
                            <div class='inner1'>
                                화가가 꿈이었는데 코끼리를 삼킨 보아뱀을 6살적에 그렸는데 순수함을 무시하고 어른들은 그 그림을 모자라고 하며 다른 길을 택하라고 하여,
                                화가의 꿈을 접고 비행사의 길을 가게 된 어린왕자의 마지막처럼 비행기를 몰다 실종되어 버린 너무도 유명한 작가 생텍쥐페리의 자전적 소설 
                                어린왕자는 읽는 이에게 삶의 많은 방향타를 제시해준다. 
                                어린왕자가 소혹성B612를 떠나 다른 소혹성을 여행하고, 일곱 번째 별 지구에서 왕, 
                                술주정꾼, 사업가, 지리학자, 여우, 장미들을 만나며 세상에서 가장 소중한 것을 발견하고,
                                지구에 온지 딱 1년이 되는 날 자기 왔던 곳에서 다시 사라져 버렸던 아니 죽었던 아주 평범하면서 너무도 가르침이 큰 소설이다. 
                                그 많은 사람들이 자신밖에 모르고 다른 사람과의 관계를 무시하여 그것을 도저히 이해할 수 없었던 작은 어린왕자, 
                                여우를 만나 길들여진다는 것의 의미와 관계의 의미를 절실히 깨닫게 되고, 중요한 것은 절대 눈에 보이지 않고 마음으로 보아야 보인다는 사실을 알게 되고, 
                                소혹성에 있는 가시 네 개 달린 장미꽃 한송이를 위해 마음으로 정성을 다하고, 장미꽃 한송이를 지키기 위해 다시 여행을 마무리하고 B612로 가려 했던
                                너무도 순수한 소년 어린왕자, 그 어린왕자가 모든 세상사람들의 마음속에는 담겨져 있다. 
                                하지만 우리는 자라면서 순수성이 사라져서 자신만을 생각하는 이기심만 가득한 왕, 술주정꾼, 사업가, 지리학자가 되어 버렸다.
                                아주 작은 장미꽃 한송이를 위해 장미꽃과의 관계를 위해 마지막에 그 별로 가기 위해 목숨을 던진 어린왕자의 순수성을 모두가 상실해 버렸다. 
                                생텍쥐페리는 어린왕자를 통해 세상은 관계와 길들여짐에 있다고, 관계란 바로 아무리 작은 것일지라고 온 정성을 다해 마음으로 바라본다면
                                그 소중한 작은 것에 길들여지기게 되고, 상대가 소중해질 수 밖에 없고, 그러면 이 세상 모든 것들이 소중할 수 밖에 없다고 우리들에게 외치고 있다. 
                                한송이 꽃에 바치는 어린왕자의 성실한 마음, 비록 잠이 들어도 그의 마음속에서 등불처럼 밝게 타오르는 한송이 장미꽃의 영상을 떠 올리는 순수한 마음 얼마나 아름다운 마음인가?
                                내가 사는 별나라로 가게 되더라도, 길들여졌다면 하늘에 떠있는 수많은 별들을 보고도 그 모든별들 중에 하나의 별에 내가 살고 있어서 내가 생각이나고 보고 싶그 그리워지게 되며,
                                설레이게 되고 그것이 바로 관계이고 길들여졌다는 것으로 어린왕자에서는 그려지고 있다. 
                                이렇게 어린왕자는 아무리 작은 것일지라도 순수한 마음으로 바라보아야하며 진실한 마음을 
                                담아 상대를 바라볼 때 세상은 변할 수 있다고 어린왕자를 통해 외치고 있는 것 같다. 
                                마지막에 죽음 조차도 자기가 사는 행복한 별 소혹성 B612로 가서 작은 장미꽃 한송이를 위하려는 그 작은 
                                마음이 행복이다라고 외치고 있다. 죽으면서도 그 작은 장미꽃을 생각하는 어린왕자의 마음이 그 어려운 시대에 필요했던 것은 아닌지 외치고 있다. 
                                그 작은 장미꽃을 생각하며 죽음을 맞이한 그 순수한 마음이 행복이고, 천국으로 가는 길임을 이야기 하고 있다. 
                                우리가 사는 세상 참으로 어지럽고 힘들다고들 외치고 있다. 하지만 작은 것 하나에 온 정성을 다하는 어린왕자 같은 순수성이 넘친다면 
                                이 세상은 바로 천국이 아닐까 한다. 생텍쥐페리는 그렇게 세상에 외치고 있다.
                            </div> 
                            <label for='readmore1'></label>
                        </small>
                    </div>
                    <hr style='border-top: 1px dotted black'>


                    <div class='reviewtitle'>
                        <strong>
                            어린 왕자
                        </strong>
                        <small>
                            <span class='info'>ni**nina</span>
                            <span class='line'>|</span>
                            <span class='reviewdate'>2016-02-26</span>
                            <span class='line'>|</span>
                            <span class='reviewchoice'>추천 : 0</span>
                            <span class='line'>|</span>
                            <img src='photo/rating/star05.gif'>
                        </small>
                    </div>
                    <div class='content'>
                        <small>
                            <input type='checkbox' id='readmore2' />
                            <div class='inner2'>
                                정말이지, 어린 왕자는 전 세계가 사랑하는 아름다운 이야기라는 타이틀이 딱 맞다. 집집마다 한 권씩은 있을 것이다. 오래 전에 처음 본 건 세로 쓰기로 되어 있는 작은 책이었고, 그 다음은 여러 다른 디자인이었는데 그래도 제일 기억 나는 건, 세로 쓰기 작은 책이다. 작고 귀여운 어린 왕자와 여우, 뱀 그림을 보면서 신기하고 혼자 몰래 보는 재미가 있었다. 


                                여러 번 봤는데 볼 때마다, 또 시간에 따라(나이 대에 따라) 느낌이 달랐다. 처음엔 무작정 좋았는데 어떨 땐 괜히 삐뚤어지게 보면서 너무 착하게 쓴 이야기라서 싫다고 느낀 적도 있었다. 하지만 그냥 좋은 어린 왕자이다. 
                                    
                                
                                    
                                    
                                    
                                소행성 B612에 살던 어린 왕자가 애써서 키우던 장미 꽃을 두고 혼자 지구로 날아 왔다. 아프리카 사막에. 그러다가 비행기가 고장나서 오도가도 못하는 비행사와 만나서 양 그림을 그려달라고 한다. 이렇게 그려도 저렇게 그려도 마음에 들어하지 않던 어린 왕자는 조그만 상자에 들어 있는 보이지 않는 양 그림을 그려주니 자기가 원하는 거라며 좋아한다. 조그만 상자 속에 있는 양이 자신이 원하는거라니! (어쩌면 우리 모두는 자신의 눈에만 보이는, 멋지고 알맞은 자신 만의 것이 있는지도 
                                모르겠다.) 
                                    
                                    
                                바오바브나무 싹을 잘라줘야 하는데 이제는 어린 왕자가 양을 가지게 됐으니 걱정 없다. 그냥 내버려두면 소행성 B612 는 바오바브 나무에 점령 당해 버릴거다. 
                                    
                                
                                    
                                    
                                    
                                '어느 날 난 마흔 네번이나 해넘이를 보았어! ' 
                                어린 왕자는 얼마 외로웠으면 의자를 움직여가며 해넘이를 보았을까? 해 지는 저녁을 보며 슬퍼 했던걸까? (어쩌면 우리도 이렇지 않나? 나만의 시간, 공간에서 혼자 외롭고 슬프니까 말이다.)​ 
                                    
                                    
                                
                                    
                                    
                                '어느 날 네 별이 너무 그립거든, 내가 널 도와줄 수 있어. 내가 해줄 수....' 뱀은 이렇게 말하는데 어린 왕자는 무슨 말인지 잘 몰라 수수께끼 같다고 한다. 뱀이 하는 말에 대해 잘 몰랐었는데 이번에는 의미있게 다가온다. 늘 여우에 대한 생각만 했는데....​ 
                                    
                                여우는 길들여진다거나 설레인다거나 하는 서로의 관계나 현실적인 이야기였다면 뱀은 죽음, 어린 왕자가 자기 별로 돌아가고자 할 때 도와줄 수 있다. 어쩌면 나이가 어릴 때는 현실에 관심이 더 많았기 때문인지도 모르겠다. 이제는 뱀의 이야기나 뱀의 방식으로 도와주는 게 조금은 이해가 된다. 조금은 공감하는지도 모르겠다. 
                                    
                                    
                                어린 왕자와 여우의 대화, 어린 왕자와 뱀의 대화, 어린 왕자와 비행사의 대화를 통해서 서로의 관계와 우정, 눈에 보이지 않는 게 얼마나 소중한지에 대해서, 죽음, 나만의 별이 웃고 있다는 이야기 등 어쩌면 선문답 같기도 하다. 대화를 통해 깨닫게 되는 소중함, 그건 어쩌면 서로 길들여져 시간이 오래 지나도 서로 멀리 있어도 그리워하는게 아닐까..........생각해 본다. 
                                    
                                
                                
                                    
                                    
                                마지막에 어린 왕자가 쓰러지는 그림과 어린 왕자가 없는 사막 그림을 보면 생텍쥐베리는 죽음으로 사랑하는 가족이나 사람을 잃어 본 적이 있을 것이다. 경험을 통해 그 슬픔과 허무함을 그림으로, 어린 왕자라는 이야기로 표현하고 싶었던 거다. ​ 
                                ​ 
                                '아저씨가 밤에 하늘을 바라볼 때면, 내가 그 별들 중의 어느 별에서 살고 있을 테니까, 그 별들 중의 어느 별에서 웃고 있을 테니까, 아저씨에겐 모든 별들이 웃고 있는 것으로 보일 거야. 아저씨는 웃을 줄 아는 별들을 가지게 되는 거지!' 110p 
                                    
                                ​밤에 하늘을 보면, 반짝이는 별을 보면, 어린 왕자를 생각하고 빙그레 웃게 되겠지.
                            </div>
                            <label for='readmore2'></label>
                        </small>
                    </div>
                    <hr style='border-top: 1px dotted black'>


                    <div class='reviewtitle'>
                        <strong>
                            ‘어린왕자’란
                        </strong>
                        <small>
                            <span class='info'>bo**buri</span>
                            <span class='line'>|</span>
                            <span class='reviewdate'>2016-02-04</span>
                            <span class='line'>|</span>
                            <span class='reviewchoice'>추천 : 0</span>
                            <span class='line'>|</span>
                            <img src='photo/rating/star04.gif'>
                        </small>
                    </div>
                    <div class='content'>
                        <small>
                            <input type='checkbox' id='readmore3' />
                            <div class='inner3'>
                                읽으라고 추천하는 책은 이상하게 읽고 싶지 않다. 
                                코끼리를 삼킨 보아뱀 그림이 나오는 부분만 되면 시시해져서 책을 덮었었다. 
                                항상. 언제나. 
                                    
                                심심해서 기다리던 약속장소에 꽂혀있던 단 하나의 소설이 어린왕자라 시간을 죽일겸 책을 들었다. 
                                역시나 코끼리가 나오자 읽기 싫어졌다. 
                                꾹꾹 참고 얼른 페이지를 넘겼다. 
                                    
                                장미가 핀 나의 별을 떠나 우주를 떠도는 순간부터 숨죽이고 읽어내렸다. 
                                책장을 넘길수록 가슴이 찡해졌다. 
                                책을 덮었을 때는 마음이 아렸다.  
                                어딘가 있을 어린왕자의 별처럼 내가 하는 사랑들이 아스라히 멀리있는 것 처럼 느껴졌기 때문이다. 
                                소중한건 눈에 보이지 않기에 마음을 더듬어 보려 눈을 감았는데, 쪽팔린 것도 모르고 질질 짰다. 
                                    
                                왜 이제야 읽었을까? 
                                어릴적 아빠가 그리도 읽으라 노래를 부를 때 한 번이라도 읽어볼 걸 그랬다. 
                                    
                                사랑하는 사람들에게 선물하고픈 사랑담은 책이다. 
                                    
                                    
                                살면서 꼭 한 번은 읽을만 한 것 같다.
                            </div>
                            <label for='readmore3'></label>
                        </small>
                    </div>
                    <hr style='border-top: 1px dotted black'>


                    <div class='reviewtitle'>
                        <strong>
                            [내인생의 책]앙투안 드 생텍쥐페리, 어린왕자(열린책들)
                        </strong>
                        <small>
                            <span class='info'>yu**y72222</span>
                            <span class='line'>|</span>
                            <span class='reviewdate'>2015-12-14</span>
                            <span class='line'>|</span>
                            <span class='reviewchoice'>추천 : 0</span>
                            <span class='line'>|</span>
                            <img src='photo/rating/star03.gif'>
                        </small>
                    </div>
                    <div class='content'>
                        <small>
                            <input type='checkbox' id='readmore4' />
                            <div class='inner4'>
                                「어린 왕자」 너무나도 유명한 이야기이다. 그래서 서평을 쓰는 내내 스포할 내용이 없어 솔직히 마음이 아주 편안했다. 「어린 왕자」는 아주 어릴 적에 읽었지만 아직까지도 내용이 기억나는 작품이다. 자기 별에 두고 온 장미를 사랑하고 지구에서 만난 여우와 꽤 철학적인 대화를 주고 받던 소년 아니던가? 

                                어린 왕자의 이야기는 그때나 지금이나 한결같이 활자로 남아있지만, 독자인 나는 어느덧 서른을 앞둔 처녀가 되어 있었다. 사실 이번에 책을 다시 읽기 전까지도 어린 왕자는 내게 있어 어느 동화책 주인공과 다름 없는 보편적인 인물이었다.  
                                    
                                
                                하지만 더 이상 어리다는 말을 들을 수 없게 된 나이가 되면서 「어린 왕자」를 처음 접했던 그 시절이 유난히 그립고 뭉클해지는 것이었다. 그 감정과 상응한걸까. 막연히 그립고 슬픈 기분이 들게 하는 작은 소년을 나의 마지막 유년 시절의 친구로 만들고 싶었다. 
                                이제는 내가 여우처럼 어린왕자에게 길들여질 차례인가보다. 마지막 페이지를 넘기면 찾아올 그 깊은 고독을 감당해야 할지라도 말이다. 
                                    
                                
                                
                                
                                
                                    
                                그러나 늘 이런 대답이었다. 모자로구먼.(9쪽) 
                                    
                                「어린 왕자」에 실린 삽화 중에서 유달리 많은 생각을 품게 한 그림이다. 화자인 '나'는 어른이 되어서도 어릴 적 그린 그림을 주변 사람들에게 보여주었다. 독자라면 이 그림이 코끼리를 소화하는 보아뱀이란 걸 쉬이 알 것이다. 물론 책 속의 어른들은 알아차리지 못 한다. 하지만 그 어른들도 한때는 어린 아이였고, '나'와 마찬가지로 오직 자신만 해석할 수 있는 창의력을 발휘했을 것이다. 그럼에도 그림이 모자일 수밖에 없는 이유는 '상식'을 벗어난 답변이 환영받지 못한 사회 때문 아닐까? 
                                    
                                그렇다면 지금 우리 현실에 사는 사람들에게 이 그림을 보여주면 다들 뭐라고 할 것인가?  
                                이번에는 「어린 왕자」에 실린 답변(코끼리를 소화하는 보아뱀)이 책 읽은 지식인의 상식이 되어 또 다시 우리의 창의력을 방해할 것인가? 
                                그림의 정체가 무엇인지는 계속해서 자문해야 할 것이다. 
                                    
                                
                                어느날 '나'는 비행기 사고로 사하라 사막에 홀연히 남는다. 마실 물은 일주일치밖에 남지 않았고 도움을 요청할 사람도 없어 그야말로 생사의 갈림길에 놓였다. 그런 그가 걱정에 지쳐 겨우 잠이 들었을 때 누군가 불러 깨운다. 
                                    
                                「저……양 한 마리를 그려 줘!」 
                                    
                                나참, 얼마나 뜬금없는 소리였을까? 몸도 마음도 외롭고 추위에 벌벌 떨며 자는데 갑자기 양을 그려달라니! 별안간 이 모든 상황이 꿈인줄 알고 엉겁결에 고개를 끄덕였을 것이다. 사막의 모래알도 예상하지 못한 만남이었다. 소년이 드넓은 사막 한 가운데에서 양을 그려 줄 조종사를 찾은 건 마치 운명이었다. '나'를 깨우기 전부터 어린 왕자는 단순히 지구를 뛰노는 흔한 어린아이가 아니었다. '나'를 발견해 준 유일한 소년인 것이다.  
                                
                                    
                                    
                                
                                어찌되었든 '나'는 양을 그려달라는 어린 왕자에게 구멍이 뚫린 상자를 그려준다. 나름 미술학도를 꿈꾼 적이 있거늘 애써 그려준 양이 병약해보인다느니 하도 면박을 줘서 에라, 모르겠다식으로 그려준 그림이다. 하지만 놀랍게도 어린 왕자는 그 안에서 자신이 원한 양 한마리를 발견했다. 나도 그 상자를 아주 오랫동안 정성을 들여 노려보았지만 아무것도 보이지 않았다. 그렇다면 왜 어린 왕자의 눈에만 보인 것일까? 물론 어린 왕자는 보이지 않는 걸 보인다고 천역덕스럽게 거짓말을 한 게 아니다. 
                                누구든 다른 사람보다 간절히 원하는 게 있지만 만족하는 데 필요한 임계점이 다르다. 
                                그 간격이 나와 어린 왕자의 차이점이 아닐까싶다.  
                                    
                                어린 왕자는 양을 매어 두지 않으면 안 된다는 '나'의 조언에도 불구하고 우울한 목소리로 말한다. 
                                「앞으로 곧장 가봐야 별로 멀리 갈 수도 없어.」어린 왕자는 사는 별이 정말 작아서 한 말이겠지만, '우울한 목소리'라는 표현은 나를 좀 헷갈리게 했다. 천진난만하고 순수한 줄만 알았던 어린 왕자도 작은 별은 그리 만족스럽지 않은 평수였을까? 그렇지 않다면 왜 그리 모호한 어조로 미련 남는 대사를 한 것일까. 나는 한동안 멍하니 그 문구를 쳐다보며 곱씹었다. 
                                    
                                애초에 어린 왕자가 사는 소행성은 무엇을 의미할까? 
                                왜 작가는 처음부터 소년을 작은 별에 살게 하면서 '어린 왕자'라는 외로운 칭호를 붙인 걸까? 
                                    
                                어린 왕자가 사는 소행성은 사회라는 광활한 우주에서 유일하게 주어진 소년의 자유라고 생각한다. 코끼리를 소화한 보아뱀을 그린 그림이 무시될 염려 없는 자유로운 세계, 어린 아이의 상상력이 허용되고 통용되는 순수한 세계. 나는 소행성을 그런 세계를 비유한 게 아닐까싶다. 그렇다면 어린 왕자의 목소리가 우울했던 것도 이해가 된다.  
                                    
                                    
                                    
                                이윽고 어린 왕자는 '나'에게 소행성에서 있었던 일과 지구로 오기까지의 여정을 차근차근 들려주기 시작한다. 
                                    
                                어린 왕자가 소행성에 머물던 마지막 날, 그동안 그에게 얄궂게 굴었던 장미는 눈물을 참으며 사랑을 고백했다. 가시 네 개를 자랑스럽게 내세우며 그동안 벌레를 막아주었던 유리 덮개를 치워달라고 부탁한다. 어릴 적에는 장미의 태도가 새침하게만 보였는데 지금 다시 만난 장미는 어쩐지 가슴을 먹먹하고 쓰라리게 했다. 실은 자신이 약하고 불완전한 존재라는 걸 알면서도 초연히 운명을 맞는 모습이 우리를 닮았기 때문이다. 어린 왕자를 보내고 혼자 감당해야 할 모든 일이 얼마나 무서웠을까? 하지만 장미는 강한 척하지도 그를 붙잡지도 않았다. 
                                그녀는 어린 왕자를 잡을 만큼 뻔뻔하지 못 했다. 그저 미안하고 사랑했기에. 
                                    
                                그렇게 어린 왕자가 자신이 살던 소행성을 떠나 만난 여섯 개 별에는 한 사람씩 살고 있었다.  
                                    
                                첫 번째 별에서 만난 왕은 어린 왕자에게 대신이라는 직위를 내려주면서까지 어떻게든 자신의 명령을 시달받기를 원했다. 
                                두 번째 별에서 만난 허영쟁이는 의미없는 박수를 유도하며 숭배를 바라는 일종의 나르시스트였다, 
                                세 번째 별에서 만난 술꾼은 술을 마시는 게 부끄럽다고, 부끄러운 감정을 잊으려고 다시 술을 마시는 주정뱅이였다. 
                                네 번째 별에서 만난 사업가는 가보지도 않은 별을 관리랍시고 세고 또 세보면서 단순히 소유했다고 기뻐했다.다섯 번째 별에서 만난 가로등지기는 평생에 하고 싶은 일이 뭔지 알면서도 규율에 사로잡혀 앉을 틈이 없었다. 
                                여섯 번째 별에서 만난 지리학자는 정작 자신의 별에 무엇이 있는지 모르면서 다른 별의 영원한 것을 기록하는 데 열중했다. 
                                    
                                그들은 자신이 사는 별의 유일한 주인이었지만, 감히 어린 왕자처럼 떠나지 못 하여 마치 갇혀 있는 것처럼 보였다. 그들은 자신을 한가운데 두고 정교하게 쌓아올린 성안에 살고 있었다. 어린 왕자가 만난 왕, 허영쟁이, 술꾼, 사업가, 가로등지기, 지리학자는 사실 우리 주변에 있고 또 우리로서 대변되는 인물들이었다. 나는 가끔 왕이기도 했고 허영쟁이기도 했다. 결코 한 사람에 머물지 않고, 어린 왕자가 그토록 이상한 어른이라고 치부한 존재들을 한번씩 거치며 살아온 것이다. 지금 이 글을 쓰는 나 역시 허영쟁이와 사업가, 그리고 지리학자를 버무려놓은 듯한 기분이다.  
                                    
                                    
                                    
                                아무튼 어린 왕자가 일곱 번째로 방문한 별은 지구였다. 
                                이곳에서 만난 '잎을 셋 가진 꽃 한 송이'는 사람들이 어디있느냐는 어린 왕자의 질문에 이렇게 대답한다. 
                                    
                                「사람들?-(생략)-바람이 그들을 몰고 다니지. 그들은 뿌리가 없어서 아주 곤란을 겪는 거야.」 
                                    
                                와, 정말 멋진 문구가 아닌가?! 예전에는 무심히 넘어갔던 문구를 재발견하여 참 뿌듯했다. 보통은 땅에 뿌리가 박힌 식물이 오히려 자유롭지 못한 생물이라고 생각했다. 그래서 바람에 홑씨를 뿌리는 민들레가 유독 인상적인 소재로 쓰인 것도 사실이고. 
                                그래서인지 '잎을 셋 가진 꽃 한 송이'의 말은 솔직히 충격이었다. 뿌리가 없어서 바람이 부는 대로 곤란을 겪는다라, 참 재미있고 재치있는 발상이다. 정말 꽃들의 입장에는 그리 보이겠다. 우리가 꽃들을 그렇게 보는 것처럼. 
                                「어린 왕자」에 나오는 명대사 중에 가장 귀엽고 순수한 대사였다. 
                                    
                                ​ 
                                한편 어린 왕자가 수천 송이가 핀 장미 정원을 보고 자신의 꽃이 엄청 흔하다는 사실에 충격을 받아 엉엉 울 때였다. 이때만큼은 나도 적잖이 당황했다. 어떻게 할 위로할 틈도 없이 대성통곡을하니 말이다. 그때 등장한 여우는 어린 왕자가 소행성에 두고 온 꽃을 단순히 보편적인 존재로만 보지 않게 도와줬다. 조금 전 잔디밭에 엎드려 원통하게 운 만큼 아쉽다는 건 그 장미가 이미 어린 왕자와 특별한 관계를 구축했다는 뜻이었다. 
                                사과 나무 밑에서 만난 여우는 어린 왕자에게 길들인다는 것이 무엇인지 알려줬다. 그건 평범하고 흔해빠진 존재를 세상에서 하나밖에 없는 소중한 존재로 만드는 관계였다. 무언가를 길들인다는 건 자신이 무언가에게 소비하는 시간과도 같았다. 그 만남이 길어질수록 존재는 각별해지고 뜬금없이 생각이 나서 결코 잊혀지지 않는 그런 것이었다. 
                                    
                                「네가 길들인 것에 너는 언제까지나 책임이 있어.」  
                                「나는 내 장미한테 책임이 있어....」 
                                ​책임이라, 어쩐지 그동안 생각한 책임보다 더 무겁게 다가오는데 신기하게도 기쁨이 차오르는 단어였다. 내가 길들인 것에 책임이 있다라. 가슴이 미어지고 뭉클하게 만드는 단어였다. 곰곰이 생각하면 가족을 제외하고 누군가를 길들여 본 적이 없는 것 같다. 아니, 이 말은 어쩌면 책임을 회피하려는 발언일까? 갑자기 내가 누군가에게 길들여지고 싶은 기분이 드는 대목이었다. 생각해보면 예전보다 지금은 확실히 삭막한 세계가 되었다. 길들이지 않더라도 조금의 접선이 책임을 질 상황까지 벌어지는 무서운 현실이 된 것이다. 그렇기 때문에 여우가 말하는 길들인다는 건 왠지 꿈처럼 달콤하고 포근하고 따뜻하고 안정된 느낌이었다. 
                                ​ 
                                그후 '나'를 만나기까지 어린 왕자는 ​전철수나 약장수를 만나며 어른들의 이상한 행동에 고개를 갸우뚱했다. 어른들의 결정은 겉으로는 아무런 문제가 없었고 오히려 시간을 효율적으로 소비했지만, 중심이 아닌 자꾸 주변을 겉돌았다. 진실로 원하는 것을 직접 잡으려고 하지 않고, 그저 꿈에 도달하는 데 방해되는 것들만 손보는데 급급했다. 이번에도 역시 내쪽이 뜨끔해서 쓴웃음을 지었다. 많은 직장인들이 공감하지 않을까싶다. 지금 우리가 하는 일은 그저 꿈이라는 중심을 겉돌기만 하는 궤도에 불과한 것이 아닐까? 
                                    
                                어린 왕자는 지구를 떠나기 전 우물을 찾는 '나'에게 이런 말을 했다. 
                                유명한 대사라 이제는 진부할지 모르지만 책을 읽는 만큼은 메아리처럼 가슴을 여러 번 찡하게 울리는 표현이었다. 
                                    
                                「사막이 아름다워, 어딘가 우물을 숨기고 있기 때문이야.」「별들이 아름다워, 보이지 않는 꽃 한 송이가 있기 때문이야.」화자인 '나'도 독자인 나도 앞으로 밤하늘을 볼 때면 습관처럼 아름답다고 말할 수 있겠지. 
                                눈에는 보이지 않을 어딘가 나를 길들여준 어린 왕자가 있을 테니깐.
                            </div>
                            <label for='readmore4'></label>
                        </small>
                    </div>
                    <hr style='border-top: 1px dotted black'/>
                    </pre>
				</ul>
			</div>
		</div>
	</div>
</section>

<%@include file='/views/common/footer.jsp'%>