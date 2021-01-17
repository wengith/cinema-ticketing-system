<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 49020
  Date: 2020/10/18
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>座位预览2</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/image/07.ico" media="screen" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/style/admin.css" media="all">

    <link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href="https://cdn.bootcss.com/font-awesome/5.8.0/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/public/bootstrap-4.4.1/dist/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/public/bootstrap-4.4.1/dist/js/bootstrap.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script src="${pageContext.request.contextPath}/static/js/jquery.seat-charts.js"></script>

    <style>
        .white {
            padding: 10px;
        }

        .white .white-insert {
            padding: 15px;
            background-color: white;
            overflow: hidden;
        }

        .btn {
            float: right;
        }

        table {
            text-align: center;
        }

        .div-right {
            float: right;
        }

        .div-right :nth-of-type(even) {
            border: 1px solid white;
        }

    </style>

</head>

<body>
<jsp:include page="sysheader.jsp"/>
<div style="margin-left: 200px" class="content">
    <!-- 内容主体区域 -->
    <div style="padding: 60px;">
        <div class="white">
<%--            <h2>选座购票</h2>--%>
            <div class="demo">
                <div id="seat-map">
                    <div class="front">屏幕</div>
                </div>
                <div class="booking-details">
                    <ul class="book-left">
                        <li>电影名字: </li>
                        <li>放映时间: </li>
                        <li>数量:</li>
                        <li>总价:</li>
                        <li>座位:</li>
                    </ul>
                    <ul class="book-right">
                        <li>电影名字</li>
                        <li>放映时间</li>
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
</div>


<script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>
<script>
    var price = 10; //price
    $(document).ready(function() {
        var $cart = 50, //Sitting Area
            $counter = 10, //Votes
            $total = 100; //Total money
        $unavaarr = [];  //unavailable array
        $unavaarr2 = [];
        $url = 0;
        $urlID = 0;
        $scheduleId = 0;

        // 影厅排数
        $seatRow = 10;
        // 影厅列数
        $seatCol = 10;
        var $map = [];
        var $columns = [];
        // Ajax
        <%--function loadXMLDoc(){--%>
        <%--    var xmlhttp;--%>
        <%--    if (window.XMLHttpRequest)--%>
        <%--    {--%>
        <%--        //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码--%>
        <%--        xmlhttp = new XMLHttpRequest();--%>
        <%--    }--%>
        <%--    else--%>
        <%--    {--%>
        <%--        // IE6, IE5 浏览器执行代码--%>
        <%--        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");--%>
        <%--    }--%>
        <%--    xmlhttp.onreadystatechange=function()--%>
        <%--    {--%>
        <%--        if (xmlhttp.readyState==4 && xmlhttp.status==200)--%>
        <%--        {--%>
        <%--            var resText = JSON.parse(this.responseText)--%>
        <%--            console.log(resText)--%>
        <%--            // document.getElementById("myDiv").innerHTML=xmlhttp.responseText;--%>
        <%--            $unavaarr.push(resText.rc);--%>
        <%--            // console.log($unavaarr)--%>

        <%--            $scheduleId = resText.scheduleId;--%>
        <%--            price = resText.price;--%>
        <%--            $seatRow = resText.rows;--%>
        <%--            $seatCol = resText.cols;--%>

        <%--            if ($seatRow > 0 && $seatCol > 0) {--%>
        <%--                for(var i=0;i<$seatRow;i++){--%>
        <%--                    $map[i]="";--%>
        <%--                    for(var j=0;j<=$seatCol;j++){--%>
        <%--                        if (j === ($seatCol/2)) {--%>
        <%--                            $map[i]+="_";--%>
        <%--                        } else {--%>
        <%--                            $map[i]+="a";--%>
        <%--                        }--%>
        <%--                    }--%>
        <%--                }--%>
        <%--                for(var j=0;j<=$seatCol;j++){--%>
        <%--                    $columns[j]="";--%>
        <%--                    if (j < ($seatCol/2)) {--%>
        <%--                        $columns[j]+= "" + (j+1) ;--%>
        <%--                    } else if (j === ($seatCol/2)) {--%>
        <%--                        $columns[j]+="A";--%>
        <%--                    } else {--%>
        <%--                        $columns[j]+= "" + j;--%>
        <%--                    }--%>
        <%--                }--%>
        <%--            }--%>
        <%--            console.log($columns)--%>
        <%--            console.log($map)--%>
        <%--            initSeatCharts();--%>
        <%--            for (let i = 0; i < $unavaarr.length; i++) {--%>
        <%--                sc.get($unavaarr[i]).status('unavailable');--%>
        <%--            }--%>
        <%--        }--%>
        <%--    };--%>
        <%--    //获取url--%>
        <%--    $url = document.location.toString();--%>
        <%--    var temp = $url.split('?')[1];--%>
        <%--    var pram2 = new URLSearchParams('?'+temp);--%>
        <%--    $urlID = pram2.get('id')--%>
        <%--    console.log($url)--%>
        <%--    xmlhttp.open("GET","${pageContext.request.contextPath}/userorder/addajax?id="+$urlID,true);--%>
        <%--    xmlhttp.send();--%>
        <%--}--%>
        var sc;
        initSeatCharts();
        loadXMLDoc();

        console.log('jiazai');
        function initSeatCharts() {
            //初始化座位
            if ($seatRow > 0 && $seatCol > 0) {
                for(var i=0;i<$seatRow;i++){
                    $map[i]="";
                    for(var j=0;j<=$seatCol;j++){
                        if (j === ($seatCol/2)) {
                            $map[i]+="_";
                        } else {
                            $map[i]+="a";
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

<script>
    layui.config({
        base: '${pageContext.request.contextPath}/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
<!-- 百度统计 -->
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script src="${pageContext.request.contextPath}/static/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</body>

</html>
