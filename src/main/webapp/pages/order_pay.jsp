<%--
  Created by IntelliJ IDEA.
  User: wen
  Date: 2021/3/14
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单支付详情</title>
</head>
<body>
<div class="shoppingCart">
    <div class="cart-header">
        <div class="cart-header-content">
            <p>
                <i class="" style="color:#ff6700; font-weight: 600;"></i>
                订单支付详情
            </p>
            <span>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快支付</span>
        </div>
    </div>
    <div class="content">
        <ul>
            <li class="header">
                <div class="pro-img"></div>
                <div class="pro-name">商品名称</div>
                <div class="pro-price">单价</div>
                <div class="pro-num">数量</div>
                <div class="pro-total">小计</div>
            </li>

            <li class="product-list">
                <div class="pro-img">
                    <img src="${pageContext.request.contextPath}${movie.moviephoto}" alt="">
                </div>
                <div class="pro-name">
                    ${movie.moviename}
                </div>
                <div class="pro-price">${order.price}元</div>
                <div class="pro-num">
                    <label>1</label>
                </div>
                <div class="pro-total pro-total-in">${order.price}元</div>
            </li>
            <!-- 购物车列表END -->
        </ul>
        <div style="height:20px;background-color: #f5f5f5"></div>
        <div class="cart-bar">
            <div class="cart-bar-left">
                 <span>
                    <a href="${pageContext.request.contextPath}/userorder/findorder?page=1&pagesize=2">订单列表</a>
                 </span>
                <span class="sep">|</span>
                <span class="cart-total">
                    共
                    <span class="cart-total-num">1</span> 件商品，已选择
                    <span class="cart-total-num">1</span> 件
              </span>
            </div>
            <div class="cart-bar-right">
                <span>
                    <span class="total-price-title">合计：</span>
                    <span class="total-price">${order.price}元</span>
                </span>
                <form action="${pageContext.request.contextPath}/toPay" class="btn-primary">
                    <input type="hidden" name="WIDout_trade_no" value="${order.orderid}">
                    <input type="hidden" name="WIDtotal_amount" value="${order.price}">
                    <button type="submit" class="btn-primary">结算</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<style>
    .shoppingCart {
        background-color: #f5f5f5;
        padding-bottom: 20px;
    }
    /* 购物车头部CSS */
    .shoppingCart .cart-header {
        height: 64px;
        border-bottom: 2px solid #ff6700;
        background-color: #fff;
        margin-bottom: 20px;
    }

    .shoppingCart .cart-header .cart-header-content {
        width: 1225px;
        margin: 0 auto;
    }

    .shoppingCart .cart-header p {
        font-size: 28px;
        line-height: 18px;
        float: left;
        font-weight: normal;
        color: #424242;
    }

    .shoppingCart .cart-header span {
        color: #757575;
        font-size: 12px;
        float: left;
        height: 20px;
        line-height: 20px;
        margin-top: 30px;
        margin-left: 15px;
    }

    .shoppingCart .content {
        width: 1225px;
        margin: 0 auto;
        background-color: #fff;
    }

    .shoppingCart .content ul {
        background-color: #fff;
        color: #424242;
        line-height: 85px;
    }

    .shoppingCart .content ul .header {
        height: 85px;
        padding-right: 26px;
        color: #424242;
    }

    .shoppingCart .content ul .product-list {
        height: 85px;
        padding: 15px 26px 15px 0;
        border-top: 1px solid #e0e0e0;
    }

    .shoppingCart .content ul .pro-check {
        float: left;
        height: 85px;
        width: 110px;
    }

    .shoppingCart .content ul .pro-check .el-checkbox {
        font-size: 16px;
        margin-left: 24px;
    }

    .shoppingCart .content ul .pro-img {
        float: left;
        height: 85px;
        width: 120px;
    }

    .shoppingCart .content ul .pro-img img {
        height: 80px;
        width: 80px;
    }

    .shoppingCart .content ul .pro-name {
        float: left;
        width: 380px;
    }

    .shoppingCart .content ul .pro-name a {
        color: #424242;
    }

    .shoppingCart .content ul .pro-name a:hover {
        color: #ff6700;
    }

    .shoppingCart .content ul .pro-price {
        float: left;
        width: 140px;
        padding-right: 18px;
        text-align: center;
    }

    .shoppingCart .content ul .pro-num {
        float: left;
        width: 150px;
        text-align: center;
    }

    .shoppingCart .content ul .pro-total {
        float: left;
        width: 120px;
        padding-right: 81px;
        text-align: right;
    }

    .shoppingCart .content ul .pro-total-in {
        color: #ff6700;
    }

    .shoppingCart .content ul .pro-action {
        float: left;
        width: 80px;
        text-align: center;
    }

    .shoppingCart .content ul .pro-action i:hover {
        color: #ff6700;
    }

    .shoppingCart .cart-bar {
        width: 1225px;
        height: 50px;
        line-height: 50px;
        background-color: #fff;
    }

    .shoppingCart .cart-bar .cart-bar-left {
        float: left;
    }

    .shoppingCart .cart-bar .cart-bar-left a {
        line-height: 50px;
        margin-left: 32px;
        color: #757575;
    }

    .shoppingCart .cart-bar .cart-bar-left a:hover {
        color: #ff6700;
    }

    .shoppingCart .cart-bar .cart-bar-left .sep {
        color: #eee;
        margin: 0 20px;
    }

    .shoppingCart .cart-bar .cart-bar-left .cart-total {
        color: #757575;
    }

    .shoppingCart .cart-bar .cart-bar-left .cart-total-num {
        color: #ff6700;
    }

    .shoppingCart .cart-bar .cart-bar-right {
        float: right;
    }

    .shoppingCart .cart-bar .cart-bar-right .total-price-title {
        color: #ff6700;
        font-size: 14px;
    }

    .shoppingCart .cart-bar .cart-bar-right .total-price {
        color: #ff6700;
        font-size: 30px;
    }

    .shoppingCart .cart-bar .cart-bar-right .btn-primary {
        float: right;
        width: 200px;
        height: 100%;
        text-align: center;
        font-size: 18px;
        margin-left: 50px;
        background: #ff6700;
        color: #fff;
    }

    .shoppingCart .cart-bar .cart-bar-right .btn-primary-disabled {
        float: right;
        width: 200px;
        text-align: center;
        font-size: 18px;
        margin-left: 50px;
        background: #e0e0e0;
        color: #b0b0b0;
    }

    .shoppingCart .cart-bar .cart-bar-right .btn-primary:hover {
        background-color: #f25807;
    }

    .shoppingCart .cart-empty {
        width: 1225px;
        margin: 0 auto;
    }

    .shoppingCart .cart-empty .empty {
        height: 300px;
        padding: 0 0 130px 558px;
        margin: 65px 0 0;
        background: url(../assets/imgs/cart-empty.png) no-repeat 124px 0;
        color: #b0b0b0;
        overflow: hidden;
    }

    .shoppingCart .cart-empty .empty h2 {
        margin: 70px 0 15px;
        font-size: 36px;
    }

    .shoppingCart .cart-empty .empty p {
        margin: 0 0 20px;
        font-size: 20px;
    }

</style>
</html>
