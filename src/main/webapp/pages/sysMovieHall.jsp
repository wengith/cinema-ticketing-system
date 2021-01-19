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
    <title>影厅管理</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/image/071.ico" media="screen" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/style/admin.css" media="all">

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
<div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 60px;">
        <div class="white">
            <div class="white-insert">
                <a id="open" class="layui-btn layui-btn-normal ">添加</a>
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="text-align: center;">放映厅ID</th>
                        <th style="text-align: center;">放映厅名字</th>
                        <th style="text-align: center;">排数</th>
                        <th style="text-align: center;">列数</th>
                        <th style="text-align: center;">状态</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${halls}" var="hall">
                        <tr>
                            <td>${hall.moviehallid}</td>
                            <td>${hall.moviehallname}</td>
                            <td>${hall.rows}</td>
                            <td>${hall.cols}</td>
                            <td>
                                <c:if test="${hall.status == 1}">
                                   开放
                                </c:if>
                                <c:if test="${hall.status == 0}">
                                    关闭
                                </c:if>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/sysHall/previewSeats?raw=${hall.rows}&clu=${hall.cols}&hall=${hall.moviehallname}"
                                   class="layui-btn  layui-btn-success layui-btn-sm">预览</a>
                                <c:if test="${hall.status == 1}">
                                    <a href="${pageContext.request.contextPath}/sysHall/updateStatus?id=${hall.moviehallid}&status=0"
                                       class="layui-btn  layui-btn-warm layui-btn-sm">关闭</a>
                                </c:if>
                                <c:if test="${hall.status == 0}">
                                    <a href="${pageContext.request.contextPath}/sysHall/updateStatus?id=${hall.moviehallid}&status=1"
                                       class="layui-btn  layui-btn-normal layui-btn-sm">开放</a>
                                </c:if>
                                <a href="${pageContext.request.contextPath}/sysHall/delete?id=${hall.moviehallid}"
                                   class="layui-btn  layui-btn-danger layui-btn-sm">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</div>


<script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form
            , $ = layui.$
            , admin = layui.admin
            , element = layui.element;

       $("#open").on('click', function () {
           var open_index =  layer.open({
                title: '选择分类'
                , type: 1
                , shadeClose: true
                , area: ['35%', '45%']
                , content: `<form method="post" action="${pageContext.request.contextPath}/sysHall/add">
                                    <div class="layui-form-item" style="margin-top:50px">
                                        <label class="layui-form-label">放映厅名字：</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="moviehallname" style="width:300px"
                                                placeholder="请输入名字" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">排数：</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="rows" style="width:300px"
                                                placeholder="请输入排数" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">列数：</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="cols" style="width:300px"
                                                placeholder="请输入列数" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div>
                                        <div style="width:100px" class="div-right">
                                            <button class="layui-btn layui-btn-sm layui-btn-normal" type="submit">提交<button/>
                                            <a class="layui-btn layui-btn-sm layui-btn-normal" onclick="formClose();">取消<a/>
                                        <div/>
                                    <div/>
                                <form/>`

            })
           window.formClose = function(){
               layer.close(open_index);     //执行关闭
           }
        })
    });
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
</body>

</html>
