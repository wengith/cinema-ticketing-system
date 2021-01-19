<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/image/071.ico" media="screen" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/public/bootstrap-4.4.1/dist/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/static/public/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/public/bootstrap-4.4.1/dist/js/bootstrap.js"></script>
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

        .layui-form-item {
            margin-bottom: 8px;
        }

        .layui-form-label {
            width: 110px;
        }

        .files-photo {
            line-height: 32px;
            border: none;
        }
    </style>
</head>
<body>
<jsp:include page="sysheader.jsp"/>

<div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 60px;">
        <!-- 模态框 -->
        <form action="${pageContext.request.contextPath}/sysMovies/add" class="layui-form" method="post" enctype="multipart/form-data">
            <div class="layui-form-item">
                <label class="layui-form-label">电影名字：</label>
                <div class="layui-input-block">
                    <input type="text" name="moviename"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电影图片：</label>
                <div class="layui-input-block">
                    <input type="file" name="photo"
                           placeholder="请输入" autocomplete="off" class="layui-input files-photo">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">导演：</label>
                <div class="layui-input-block">
                    <input type="text" name="director"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">演员：</label>
                <div class="layui-input-block">
                    <input type="text" name="mainperformer"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">时长：</label>
                <div class="layui-input-block">
                    <input type="text" name="duration"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">区域：</label>
                <div class="layui-input-block">
                    <input type="text" name="area"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">上映日期：</label>
                <div class="layui-input-block">
                    <input id="test2" type="text" name="releasedate"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">票价：</label>
                <div class="layui-input-block">
                    <input type="text" name="price"
                           placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">简介：</label>
                <div class="layui-input-block">
                                    <textarea name="opera" placeholder="请输入"
                                              class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">类型：</label>
                <div class="layui-input-block">
                    <c:forEach items="${sorts}" var="sort">
                        <input type="checkbox" name="sortid" title="${sort.sorts}" value="${sort.id}">
                    </c:forEach>
                </div>
            </div>


            <!-- 模态框底部 -->
            <div>
                <input type="submit" class="btn btn-primary">
                <button data-dismiss="modal" class="btn btn-secondary">取消</button>
            </div>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>
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

<script>
    layui.use(['form','laydate'], function () {
        var form = layui.form
            ,laydate = layui.laydate;

        laydate.render({
            elem: '#test2' //指定元素
            ,type: 'datetime'
        });

    });

</script>

</body>
</html>
