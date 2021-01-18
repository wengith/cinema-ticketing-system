<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>选座购票</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/image/07.ico" media="screen" />
    <!-- for-mobile-apps -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <!-- //for-mobile-apps -->
    <!-- <link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'> -->
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/public/bootstrap-4.4.1/dist/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/public/bootstrap-4.4.1/dist/js/bootstrap.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script src="${pageContext.request.contextPath}/static/js/jquery.seat-charts.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="content">
    <div class="main">
        <h2>选座购票</h2>
        <div class="demo">
            <div id="seat-map">
                <div class="front">屏幕</div>
            </div>
            <div class="booking-details">
                <ul class="book-left">
                    <li>电影名字: </li>
                    <li>放映时间: </li>
                    <li>选座规则:</li>
                    <li>数量:</li>
                    <li>总价:</li>
                    <li>座位:</li>
                </ul>
                <ul class="book-right">
                    <li>${msm.movieName}</li>
                    <li>${msm.scheduleDate} ${msm.scheduleTime}</li>
                    <li>${chooseRule}</li>
                    <li><span id="counter">0</span></li>
                    <li><b><i>￥</i><span id="total">0</span></b></li>
                </ul>
                <div class="clear"></div>
                <ul id="selected-seats" class="scrollbar scrollbar1"></ul>

                <form action="${pageContext.request.contextPath}/userorder/buy">
                    <input type="hidden" id="scheduleId" name="scheduleId">
                    <input type="hidden" id="form-input" name="rc">
                    <input type="hidden" id="price" name="price">
                    <button class="checkout-button" id="sub-btn" type="submit">购买</button>
                </form>
                <div id="legend"></div>
            </div>
            <div style="clear:both"></div>
        </div>
    </div>

</div>

<script type="text/javascript">
    var price = 10; //price
    $(document).ready(function() {
        var $cart = $('#selected-seats'), //Sitting Area
            $counter = $('#counter'), //Votes
            $total = $('#total'); //Total money
            $unavaarr = [];  //unavailable array
            $unavaarr2 = [];
            $url = 0;
            $urlID = 0;
            $scheduleId = 0;

        // 影厅排数
        $seatRow = 0;
        // 影厅列数
        $seatCol = 0;
        var $map = [];
        var $columns = [];
        // 选座规则 1-都可选 2-单排单号可选 3-单排双号可选
        $seatRule = 1;
        $unchoose = [];
        // Ajax
        function loadXMLDoc(){
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp = new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    var resText = JSON.parse(this.responseText)
                    console.log(resText)
                    // document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                    $unavaarr.push(resText.rc);
                    // console.log($unavaarr)

                    $scheduleId = resText.scheduleId;
                    price = resText.price;
                    $seatRow = resText.rows;
                    $seatCol = resText.cols;
                    if (resText.seatRule) {
                        $seatRule = resText.seatRule;
                    }
                    if ($seatRow > 0 && $seatCol > 0) {
                        for(var i=0;i<$seatRow;i++){
                            $map[i]="";
                            for(var j=0;j<=$seatCol;j++){
                                if (j === ($seatCol/2)) {
                                    $map[i]+="_";
                                } else {
                                    $map[i]+="a";
                                }
                                if ($seatRule === 2) {
                                    if (j%2 !== 0) {
                                        $unchoose.push(i+1 + "_" + (j+1));
                                    }
                                } else if ($seatRule === 3) {
                                    if (j%2 == 0) {
                                        $unchoose.push(i+1 + "_" + (j+1));
                                    }
                                }
                            }
                        }
                        for(var j=0;j<=$seatCol;j++){
                            $columns[j]="";
                            if (j < ($seatCol/2)) {
                                $columns[j]+= "" + (j+1) ;
                            } else if (j === ($seatCol/2)) {
                                $columns[j]+="A";
                            } else {
                                $columns[j]+= "" + j;
                            }
                        }
                    }
                    console.log($columns)
                    console.log($map)
                    console.log($unchoose);

                    initSeatCharts();
                    for (var i = 0; i < $unavaarr.length; i++) {
                        sc.get($unavaarr[i]).status('unavailable');
                    }

                    for (var i = 0; i < $unchoose.length; i++) {
                        sc.get($unchoose[i]).status('unallowchoose');
                    }
                }
            };
            //获取url
            $url = document.location.toString();
            var temp = $url.split('?')[1];
            var pram2 = new URLSearchParams('?'+temp);
            $urlID = pram2.get('id')
            console.log($url)
            xmlhttp.open("GET","${pageContext.request.contextPath}/userorder/addajax?id="+$urlID,true);
            xmlhttp.send();
        }
        var sc;
        //initSeatCharts();
        loadXMLDoc();

        function initSeatCharts() {
            sc = $('#seat-map').seatCharts({
                map: $map,
                naming : {
                    top : false,
                    left: true,
                    //columns: ['1','2','3','4','5','A','6','7','8','9','10'], //过道也要给个编号！！！
                    columns: $columns,
                    getLabel : function (character, row, column) {
                        return column;
                    }
                },
                legend : { //Definition legend
                    node : $('#legend'),
                    items : [
                        [ 'a', 'unallowchoose', '不可选择'],
                        [ 'a', 'available',   '可购买' ],
                        [ 'a', 'unavailable', '已购买'],
                        [ 'a', 'selected', '已选择']
                    ]
                },
                click: function () { //Click event
                    if (this.status() == 'available') { //optional seat
                        $('<li>'+(this.settings.row+1)+'排'+this.settings.label+' 座'+'</li>')
                            .attr('id', 'cart-item-'+this.settings.id)
                            .data('seatId', this.settings.id)
                            .appendTo($cart);

                        $counter.text(sc.find('selected').length+1);
                        $total.text(recalculateTotal(sc)+price);

                        return 'selected';
                    } else if (this.status() == 'selected') { //Checked
                        //Update Number
                        $counter.text(sc.find('selected').length-1);
                        //update totalnum
                        $total.text(recalculateTotal(sc)-price);

                        //Delete reservation
                        $('#cart-item-'+this.settings.id).remove();
                        //optional
                        return 'available';
                    } else if (this.status() == 'unavailable') { //sold
                        return 'unavailable';
                    } else {
                        return this.style();
                    }
                }
            });
            //sold seat
            sc.get($unavaarr2).status('unavailable');
        }



        $("#sub-btn").click(function(){
            //将已选择的座位加入到数组中
            $unavaarr2.push(sc.find('selected').seatIds);
            // console.log($unavaarr);

            //将已购买的作为变成红色
            sc.get(sc.find('selected').seatIds).status('unavailable');


            // 提交后台
            $("#scheduleId").val($scheduleId);
            $("#form-input").val($unavaarr2);
            $("#price").val(price);
            // console.log($("#form-input").val());
            // console.log($("#scheduleId").val());
            // console.log($("#price").val())

            // $counter.text(0)
            // $total.text(0)

        })



    });
    //sum total money
    function recalculateTotal(sc) {
        var total = 0;
        sc.find('selected').each(function () {
            total += price;
            // console.log(sc.find('selected').seatIds)
        });

        return total;
    }


    $(function(){

        // 设置登录按钮的显示隐藏效果
        $(".login").mouseenter(function(){
            $(this).children(".usrmess").stop();
            $(this).children(".usrmess").show(1000);
        })
        $(".login").mouseleave(function(){
            $(this).children(".usrmess").stop();
            $(this).children(".usrmess").hide(1000);
        })
    })
</script>

<script src="${pageContext.request.contextPath}/static/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</body>
</html>
