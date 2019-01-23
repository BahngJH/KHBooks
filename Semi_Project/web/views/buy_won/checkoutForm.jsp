<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<%@ include file="/views/common/header.jsp"%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>


#buy_info_table{
    border: 2px solid #9999ff;
}




</style>

<title>주문/결제 -KH북스</title>
</head>



<body>

 <div class='container'>
        <!-- <div class='container-fluid'> -->
        <div id="books_contets">

            <div class="col-sm-7 col-md-7">
                <div class="order_list_wrapper">

                    <article class="order_list">
                        <h3>주문 목록<span class="list_count">도서 갯수</span></h3>

                        <ul class="book_order_list_wrapper">
                            <table class="table table-striped">
                                <!-- 도서목록 리스트 -->
                                <li class="book_order_list js_order_list" data-id="321001874">

                                    <!-- n 번째 주문도서 매크로 정보 -->
                                    <div class="book_macro_60 book_macro_landscape book_macro_metadata_portrait">


                                        <!-- 주문도서 이미지 썸네일 -->
                                        <!-- 부트스트랩 이미지 -->

                                        <!-- 화면이 클때, 작을때, 각각 그리드와 로우를 지정해주고 만들어야 한다.
                                    각 도서 정보가 로우 한칸에 들어가고, 각각의 정보는 하나의 div 안에 각각 들어간다. (그리드값 각자 줘야함) -->

                                        <div class="row">
                                            <!-- 책 그림 마우스 갖다대면 요약 정보 뜨게 hover 이용하기 -->

                                            <div class="book_thumbnail col-xs-4 col-md-3">

                                                <a href="#" class="thumbnail">
                                                    <img src="https://misc.ridibooks.com/cover/754024947/xxlarge">
                                                </a>


                                            </div>


                                            <div class="book_metadata_wrapper col-xs-8 col-md-9">

                                                <h3 class="book_metadata meta_title ">
                                                    <a class="title_link " href="/v2/Detail?id=321001874"
                                                        data-track-params="" data-track-type="">
                                                        <span class="title_text">
                                                            <p>고백의 이유</p>
                                                        </span>
                                                    </a>
                                                </h3>


                                                <p class="book_metadata author ">
                                                    <a class="js_author_detail_link author_detail_link" href="  /search?q=%EC%84%9C%EC%9D%80%EC%88%98">서은수</a>
                                                </p>

                                                <div class="js_book_price_wrapper book_price_wrapper " data-book-id="321001874">
                                                    <ul class="js_book_price">
                                                        <li class="ebook_price">
                                                            <span class="discount_percent js_discount_rate">
                                                                <span class="discount_none">-</span>
                                                            </span>
                                                            <strong><span class="museo_sans">5,000</span>원</strong>
                                                        </li>

                                                    </ul>
                                                </div>


                                            </div>



                                        </div>
                                         <div class="row">
                                            <!-- 책 그림 마우스 갖다대면 요약 정보 뜨게 hover 이용하기 -->

                                            <div class="book_thumbnail col-xs-4 col-md-3">

                                                <a href="#" class="thumbnail">
                                                    <img src="https://misc.ridibooks.com/cover/754024947/xxlarge">
                                                </a>


                                            </div>


                                            <div class="book_metadata_wrapper col-xs-8 col-md-9">

                                                <h3 class="book_metadata meta_title ">
                                                    <a class="title_link " href="/v2/Detail?id=321001874"
                                                        data-track-params="" data-track-type="">
                                                        <span class="title_text">
                                                            <p>고백의 이유</p>
                                                        </span>
                                                    </a>
                                                </h3>


                                                <p class="book_metadata author ">
                                                    <a class="js_author_detail_link author_detail_link" href="  /search?q=%EC%84%9C%EC%9D%80%EC%88%98">서은수</a>
                                                </p>

                                                <div class="js_book_price_wrapper book_price_wrapper " data-book-id="321001874">
                                                    <ul class="js_book_price">
                                                        <li class="ebook_price">
                                                            <span class="discount_percent js_discount_rate">
                                                                <span class="discount_none">-</span>
                                                            </span>
                                                            <strong><span class="museo_sans">5,000</span>원</strong>
                                                        </li>

                                                    </ul>
                                                </div>


                                            </div>



                                        </div>
                                         <div class="row">
                                            <!-- 책 그림 마우스 갖다대면 요약 정보 뜨게 hover 이용하기 -->

                                            <div class="book_thumbnail col-xs-4 col-md-3">

                                                <a href="#" class="thumbnail">
                                                    <img src="https://misc.ridibooks.com/cover/754024947/xxlarge">
                                                </a>


                                            </div>


                                            <div class="book_metadata_wrapper col-xs-8 col-md-9">

                                                <h3 class="book_metadata meta_title ">
                                                    <a class="title_link " href="/v2/Detail?id=321001874"
                                                        data-track-params="" data-track-type="">
                                                        <span class="title_text">
                                                            <p>고백의 이유</p>
                                                        </span>
                                                    </a>
                                                </h3>


                                                <p class="book_metadata author ">
                                                    <a class="js_author_detail_link author_detail_link" href="  /search?q=%EC%84%9C%EC%9D%80%EC%88%98">서은수</a>
                                                </p>

                                                <div class="js_book_price_wrapper book_price_wrapper " data-book-id="321001874">
                                                    <ul class="js_book_price">
                                                        <li class="ebook_price">
                                                            <span class="discount_percent js_discount_rate">
                                                                <span class="discount_none">-</span>
                                                            </span>
                                                            <strong><span class="museo_sans">5,000</span>원</strong>
                                                        </li>

                                                    </ul>
                                                </div>


                                            </div>



                                        </div>



                                        <!-- 부재도서 알람 -->
                                        <div class="alert_wrapper">



                                        </div>

                                    </div>
                                </li>
                            </table>
                        </ul>
                    </article>
                </div>

            </div>

        </div>


        <!-- 구매 영수증 -->
        <div class="col-sm-5 col-md-5">
            <div id="order_receipt_wrapper">
                <form id="order_form" name="pgForm" action="" method="POST">
                    <!-- <div class="hidden_input_wrapper">

                        <input type="hidden" name="Amt" value="1000">
                        <input type="hidden" name="BuyerName" value="홍길동">
                        <input type="hidden" name="OrderName" value="결제테스트">


                        <input type="hidden" name="_token" value="I9Bl5WTRRWkicplNrcQhCrOlHD4tdrMc8P5ogedFOYMPXvnZl1hPurVgJ9iRBkv9" />
                        <input type="hidden" name="return_url" value="" />
                        <input type="hidden" name="return_url_at_fail" value="http://ridibooks.com/order/checkout?act=buy&amp;b_ids%5B%5D=321001874&amp;t=1544158389" />
                        <input type="hidden" name="object" value="2" />
                        <input type="hidden" name="b_ids[]" value="321001874" />
                        <input type="hidden" class="order_items" data-id="321001874" data-price="5000"
                            data-regular-price="5000" />
                    </div>

                    <script>
                        IMP.request_pay({
                            amount: 1000,
                            buyer_name: '홍길동',
                            name: '결제테스트'
                        }, function (response) {
                            //결제 후 호출되는 callback함수
                            if (response.success) { //결제 성공
                                console.log(response);
                            } else {
                                alert('결제실패 : ' + response.error_msg);
                            }
                        });
                    </script> -->

                    <article class="order_list">
                        <h3>결제 정보</h3>

                        <div class="col-sm-8 col-md-4"></div>
                        <div class="buy_info">
                            <table class="table table-striped" id="buy_info_table">
                                <tr>
                                    <td>총 주문 금액</td>
                                    <td></td>

                                </tr>

                                <tr>
                                    <td>사용 가능 마일리지</td>
                                    <td></td>

                                </tr>

                                <tr>
                                    <td>적립 마일리지</td>
                                    <td></td>

                                </tr>

                                <tr>
                                    <td><label><h3> 수단</h3></label></td>
                                    <td></td>
                                </tr>



                                <tr>


                                    <td>
                                        <div class="checks"> <input type="radio" id="ex_chk" name="order_chk_radio">
                                            <label for="ex_chk"> 네이버페이</label></div>
                                        <div class="checks"> <input type="radio" id="ex_chk" name="order_chk_radio">
                                            <label for="ex_chk"> 카카오페이</label></div>
                                        <div class="checks"> <input type="radio" id="ex_chk" name="order_chk_radio">
                                            <label for="ex_chk"> 페이코</label></div>
                                    </td>


                                    <td>
                                        <div class="checks"> <input type="radio" id="ex_chk" name="order_chk_radio">
                                            <label for="ex_chk"> 신용카드</label></div>
                                        <div class="checks"> <input type="radio" id="ex_chk" name="order_chk_radio">
                                            <label for="ex_chk">계좌이체</label></div>
                                        <div class="checks"> <input type="radio" id="ex_chk" name="order_chk_radio">
                                            <label for="ex_chk">도서문화상품권</label></div>
                                    </td>


                                </tr>


                            </table>


                        </div>

                    </article>


                    <article class="order_check">
                        <h3>구매 동의</h3>
                        <div class="checks"> <input type="checkbox" id="order_chk_box"> <label for="order_chk">
                                상품, 가격, 할인 정보, 유의 사항 등을 확인하였으며 구매에 동의합니다.</label></div>

                        <br>

                        <p>

                            <button type="button" class="btn btn-primary btn-lg btn-block"> 확인</button>

                        </p>

                    </article>
                </form>
            </div>
        </div>




</body>
</html>





<%@ include file="/views/common/footer.jsp"%>