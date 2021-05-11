<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>票房可视化</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/image/071.ico"
          media="screen"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/style/admin.css" media="all">
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>
    <style>
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
<!-- 主体部分 -->
<div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 60px;">
        <div class="white">
            <div class="white-insert">
                <div id="main" style="height:600px;width: 1100px; margin-left: 30px ;margin: 20px auto;"></div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>

<script>
    var movies = [];
    var counts = [];
    $.ajax({
        type: "get",
        async: false, //是否异步
        url: "${pageContext.request.contextPath}/sysOrder/calculateBoxOffice",
        contentType: "application/json;charset=UTF-8",
        dataType: "json", //跨域json请求一定是json
        success: function (response) {
            for (var index = 0; index < response.length; index += 1) {
                movies.push(response[index].movieName);
                counts.push(response[index].count);
            }

        },
        error: function (response) {
            console.log("请求失败")
        }
    });
    //Echarts展示数据
    $(function () {
        {
            // 基于准备好的dom，初始化echarts图表
            var myChart = echarts.init(document.getElementById('main'));

            option = {
                title: {
                    text: '票房可视化柱状图'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
                    }
                },

                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                // grid: {
                //     left: '3%',
                //     right: '4%',
                //     bottom: '3%',
                //     containLabel: true
                // },
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: true,
                        data: movies
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '电影票房',
                        type: 'bar',
                        stack: '总票房',
                        smooth: true,
                        areaStyle: {},
                        data: counts,
                        barWidth : 50,//柱图宽度
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true, //开启显示
                                    position: 'top', //在上方显示
                                    textStyle: { //数值样式
                                        color: 'black',
                                        fontSize: 16
                                    }
                                },
                                // 这里是重点
                                color: function (params) {
                                    // 注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
                                    var colorList = ['#c23531', '#2f4554', '#61a0a8', '#d48265', '#91c7ae', '#749f83', '#ca8622'];
                                    return colorList[params.dataIndex]
                                }
                            }
                        }
                    }
                ]
            };


            // 为echarts对象加载数据
            myChart.setOption(option);
        }
    })
</script>
</body>
</html>
