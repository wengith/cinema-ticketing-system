package com.zxl.config;
import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
public class AlipayConfig {
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016103100780646";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCd2jjntJS6ulgNyHa+zNL/2fm9B9Mn/c/lpbU6cpHQ0CfAQymJ6qfZnHUUEnb9kF252VnDM3RumXoPsGXrV5fUpEjDgUorndUDdS8PsCD3C6A3yyIX9Mv7yuhjHODuq3zLecbunifMXBT7D23AcBSgKTANguJ7zMAVmADSmUqto9fyY0l4EAsHvsvYbWI2qn0Izg9iuFgLAUlh90u6cjwVEw3eUE3GrC4nrHFaOrqyR7Z7fpTtjJL/NAmdaRfuiDB6sFf8BIONbmNXEculxrQYguZxsFDcQKWzueV6wKjwqbin0Y5sKKqb8Vm9M9CBcYCxc+zQyJmNZ+WCvroyaZFjAgMBAAECggEAMSXBs/rYl+7u/ZOdzThOtdRzWnS2POxcr37Rl1oWpnI4/jarF0LVcf6xwUcifz5UwEm5FfrOVKU6iOn+QbErF8zyztRReJUSvpncxkCrct/OybBYdCcG3+XERx+1tPn1yBCpbKAXehxtd+HM5S7AbUGFsZ8/zxXn9JE4KFoME1XDwjnGvsW6awD++M9AX+Zea8bzT4jBq1axog6kk4qP+Hh3kCZ9syY9AB6Wzz+bTZI/a7dnVLNcX5orHQiDPfXPEwYsDv8mMEJqWiLLJyb3AVnQoVS+3ovxIKeFXpWf5xtK0SzbCxs+K383WhogjhpT9KHjozy7DlQ8m3jg49Vk6QKBgQDU/dOkginHVp4K61kXQW5CkX4ZYUi707CCKppzq1CNeHGzC8UdvIFPMPvk8lpI9Dh8KkQsuwMqHpbZ1JSUlalVRTF5UQXZkqAus0svMb2qGqYoKoFOr6W3AKqCltk3dXe/p/DV5kJbp7CAI66heyIhikE6nt1TuBAUM8DQ38bTXQKBgQC9uhcdqH9iojFtb23H3QzGjWBBzVgox5bfa6aUwqZWIy4YQioPD5nDPsI6AYv6Y/9uvBWL46oNpMz6THEYdlpVQg0NTJJG+XsH6BL5hQ8Ffwmez522HfdppGktZJztQ0zyiFGuhj9RhEnY6xAYwLGuVMEaCUP7QnBbuBVHrAJrvwKBgFqrj3xZuOVWF0N4ut1uijymaTLuuiLTVDGlZ0jUZh9DZcuduBUXmUiYBrOJBCxIYv9gktMj7Y3xpbAnkfTK3WIiaZRGjKH5jF01EE2P9DjEzXUN2ywfFAGas/uRsfis9gRNvvWf5yHTegyipAW0QGxcybXlyTyJf7bJ7Uw95ws1AoGAZvNVm8hU50avn3x5i5xNVGhetRYiIm67VZzqlYpSDCem2Y79l5KVkza42hUAyev9LS9uWaw+GI02lRNpwyZluiHPR0onjc/OjOnHchJbplXa+IwcPjhgirimQfV4md6NIIYMHLHIJgmssMJMx8G4KKrg5anlc7AHnB11nqCd560CgYAWHpu2ALUulbm6noE+JlC8GzZa1LfAqE+xx1/2DL/x4WSBTpW7ZxD30+TU4WccKKa01aEoEDqACR93IMb/KeFIreYrLQ7Qx/5UpMGIp1HhNNs4hK5TvNks9SkTBZX1VKtKlLqpVaPZ890FS/5o2PcfSaSs5FadApuKAP6jqORUAw==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAndo457SUurpYDch2vszS/9n5vQfTJ/3P5aW1OnKR0NAnwEMpieqn2Zx1FBJ2/ZBdudlZwzN0bpl6D7Bl61eX1KRIw4FKK53VA3UvD7Ag9wugN8siF/TL+8roYxzg7qt8y3nG7p4nzFwU+w9twHAUoCkwDYLie8zAFZgA0plKraPX8mNJeBALB77L2G1iNqp9CM4PYrhYCwFJYfdLunI8FRMN3lBNxqwuJ6xxWjq6ske2e36U7YyS/zQJnWkX7ogwerBX/ASDjW5jVxHLpca0GILmcbBQ3ECls7nlesCo8Km4p9GObCiqm/FZvTPQgXGAsXPs0MiZjWflgr66MmmRYwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/ssm_model_war_exploded/success";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
