<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script>
        $(document).ready(function () {
            $("#nav").load("navbar.html");
        });

        $(function () {
            var currentPosition = parseInt($("#cart").css("top"));
            //$('#cart').css('height', $(window).height()-100);
            $(window).scroll(function () {
                var width = $(window).width();
                if (width >= 992) {
                    var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
                    console.log(position);
                    $("#cart").stop().animate({
                        "top": position + currentPosition + "px"
                    }, 500);
                }
            });
        });
    </script>
    <style>
        /* div {
            border: 1px solid black;
        } */
        div #category {
            border: 1px solid blue;
        }

        .order-buttons {
            margin-left: 20px;
        }

        .order-buttons li {
            padding: 0px;
        }

        .order-buttons li a {
            text-decoration: none;
            color: black;
            padding-left: 8px;
            border-left: 1px solid gray;
        }

        div #search {
            border: 1px solid red;
        }

        div #cart {
            border: 1px solid green;

        }

        .category_title {
            border-bottom: 1px solid black;
            color: black;
            margin-bottom: 20px;
            padding-bottom: 20px;
            position: relative;
        }

        #category ul {
            list-style: none;
            padding: 0;
        }

        #category li {
            border-bottom: 1px dashed #e1e1e1;
            /* line-height: 45px; */
            text-align: left;
        }

        #category li span {
            float: right;
        }

        #category li a {
            color: #333;
            /* font-size: 14px;
            font-weight: 400; */
        }

        .result{
            border-bottom: 1px solid gray;
            margin-top: 15px;
            
        }
    </style>
</head>

<body>
    <section>
        <div class="container">
            <div id='category' class="col-xs-12 col-md-3">
                <h3 class="category_title">결과 내 카테고리</h3>
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                    <li class="list-group-item"><a href="#">소설<span class="badge">(3)</span></a></li>
                </ul>
            </div>
            <div id='search' class="col-xs-12 col-md-8">
                <div id="author" class="col-xs-12 col-md-12">
                    <h3>저자 검색</h3>
                </div>
                <div id="book" class="col-xs-12 col-md-12">
                    <h3>책 검색</h3>
                    <div id='order' class="row">
                        <ul class="order-buttons list-inline col-xs-12 col-md-12">
                            <!--첫번째는 padding-left 속성 빼주기-->
                            <li><a href="#">인기순</a></li>
                            <li><a href="#">최신순</a></li>
                            <li><a href="#">평점순</a></li>
                            <li><a href="#">리뷰 많은순</a></li>
                            <li><a href="#">낮은 가격순</a></li>
                        </ul>
                    </div>
                    <div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <h3 class='book_info'>
                                    <a href="#">
                                        <span>골든아워</span>
                                    </a>
                                </h3>
                                <p class="book_info"><a href="#"><span>이국종</span></a></p>
                                <p class="book_info"><a href="#"><span>이국종</span></a></p>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>
                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>0
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>
                        <div class='result row'>
                            <div class='result-image col-xs-3 col-sm-3 col-md-3 col-lg-3'>

                                <a href="#" class="thumbnail">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                        alt="">
                                </a>

                            </div>
                            <div class='result-info col-xs-9 col-sm-9 col-md-9 col-lg-9'>
                                <span>
                                    <p>골든아워</p>
                                </span>
                                <span>
                                    <p>이국종</p>
                                </span>
                            </div>
                        </div>


                    </div>
                </div>
                <!--페이지네이션-->
                <div class="paging col-xs-12" style="text-align: center">
                    <ul class="pagination pagination-lg">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>

                </div>
            </div>

            <div id='cart' class="col-xs-12 col-md-1">

                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <p class="text-center">최근 본 목록</p>
                    </div>
                </div>

                <div class='row'>
                    <div class="cartContent col-xs-2 col-xs-offset-1 col-md-12 col-md-offset-0">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>
                    <div class="cartContent col-xs-2 col-md-12">
                        <a href="#" class="thumbnail">
                            <img src="https://bookthumb-phinf.pstatic.net/cover/140/369/14036994.jpg?udate=20181114"
                                alt="">
                        </a>

                    </div>

                </div>
            </div>

        </div>
    </section>

<%@include file="/views/common/footer.jsp"%>