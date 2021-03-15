package com.zxl.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

import com.github.pagehelper.PageInfo;
import com.zxl.config.AlipayConfig;
import com.zxl.entity.TMovie;
import com.zxl.entity.TMovieorder;
import com.zxl.entity.TUserinfo;
import com.zxl.service.TMovieService;
import com.zxl.service.TMovieorderService;
import com.zxl.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class PayController {
    @Autowired
    private TMovieorderService tMovieorderService;
    @Autowired
    private TMovieService  tMovieService;

    private static String out_trade_no;

    @RequestMapping("/success")
    public String success(){
        //修改订单状态
        TMovieorder t=new TMovieorder();
        t.setOrderid(Integer.parseInt(out_trade_no));
        t.setStatus(1);
        tMovieorderService.update(t);
        return "redirect:/userorder/findorder?page=1&pagesize=2";
    }

    @RequestMapping("/pay")
    public void payController(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);


        //商户订单号，商户网站订单系统中唯一订单号，必填
        out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //付款金额，必填
        String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"), "UTF-8");
        //订单名称，必填
        String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"), "UTF-8");
        //商品描述，可空
        String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"), "UTF-8");



        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
        //		+ "\"total_amount\":\""+ total_amount +"\","
        //		+ "\"subject\":\""+ subject +"\","
        //		+ "\"body\":\""+ body +"\","
        //		+ "\"timeout_express\":\"10m\","
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

        //请求
        String form = "";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=" + AlipayConfig.charset);
        response.getWriter().write(form);//直接将完整的表单html输出到页面
        response.getWriter().flush();
        response.getWriter().close();
    }

    /**
     * 跳转模拟支付
     * @param request
     * @param modelMap
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/virtualPay")
    public String virtualPay(HttpServletRequest request, ModelMap modelMap) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        if (!StringUtils.isEmpty(out_trade_no)) {
            TMovieorder order = tMovieorderService.queryById(Integer.valueOf(out_trade_no));
            if (order != null) {
                modelMap.addAttribute("order",order);
                TMovie movie = tMovieService.queryById(order.getScheduleobj());
                modelMap.addAttribute("movie", movie);
            }
        } else {
            // 订单不存在
        }
        return "order_pay";
    }

    /**
     * 模拟支付，此处仅置订单状态
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/toPay")
    public String toPay(HttpServletRequest request) throws UnsupportedEncodingException {
        out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"), "UTF-8");
        // 出票后需要将状态置为待出票（状态为2），需要管理员去后台订单管理界面点击出票（出票后状态会变为2）
        TMovieorder order = tMovieorderService.queryById(Integer.valueOf(out_trade_no));
        if (order != null) {
            order.setStatus(1);
            tMovieorderService.update(order);
        }
        return "redirect:/userorder/findorder?page=1&pagesize=2";
    }
}
