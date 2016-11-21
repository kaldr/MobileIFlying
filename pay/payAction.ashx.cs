using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Xml;

namespace WeChat.NewIflying.pay
{
    /// <summary>
    /// payAction 的摘要说明
    /// </summary>
    public class payAction : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string retStr = "";
            double payMoney = GetParam<double>("pay", 0);
            string orderId = GetParam("order", "");
            string openid = GetParam("openid", "");
            if (payMoney > 0 && orderId != "" && openid != "")
            {
                if (context.Request.HttpMethod.ToLower() == "post")
                {
                    Stream s = System.Web.HttpContext.Current.Request.InputStream;
                    byte[] b = new byte[s.Length];
                    s.Read(b, 0, (int)s.Length);
                    string postStr = Encoding.UTF8.GetString(b);
                    if (!string.IsNullOrEmpty(postStr))
                    {
                        JObject _obj = (JObject)JsonConvert.DeserializeObject(postStr);
                        if (_obj != null && _obj.Count > 0)
                        {
                            var md5 = MD5.Create();

                            string ipStr = context.Request.UserHostAddress;
                            string nonStr = Guid.NewGuid().ToString().Replace("-", "");
                            string noStr = string.Format("{0}{1}{2}", "1219632001", DateTime.Now.ToString("yyyyMMddHHmmss"), new Random().Next(999));
                            string postData = "appid=wxd438ca7726cbc438&attach=" + orderId + "&body=" + _obj["PBASTitle"].ToString() + "&mch_id=1219632001&nonce_str=" + nonStr + "&notify_url=http://m.iflying.com/pay/paySuccess.ashx"
                                + "&openid=" + openid + "&out_trade_no=" + noStr + "&spbill_create_ip=" + ipStr + "&total_fee=" + (payMoney * 100) + "&trade_type=JSAPI";
                            postData += "&key=FEIYANG4000365666IFLYING27666666";//FY4000365666NBFLYING057427666666
                            var bs2 = md5.ComputeHash(Encoding.UTF8.GetBytes(postData));
                            var sb2 = new StringBuilder();
                            foreach (byte bb in bs2)
                            {
                                sb2.Append(bb.ToString("x2"));
                            }
                            //所有字符转为大写
                            postData = sb2.ToString().ToUpper();
                            string orderXml = "<xml>"
                                + "<appid>wxd438ca7726cbc438</appid>"
                                + "<attach>" + orderId + "</attach>"
                                + "<body>" + _obj["PBASTitle"].ToString() + "</body>"
                                + "<mch_id>1219632001</mch_id>"
                                + "<nonce_str>" + nonStr + "</nonce_str>"
                                + "<notify_url>http://m.iflying.com/pay/paySuccess.ashx</notify_url>"
                                + "<openid>" + openid + "</openid>"
                                + "<out_trade_no>" + noStr + "</out_trade_no>"
                                + "<spbill_create_ip>" + ipStr + "</spbill_create_ip>"
                                + "<total_fee>" + (payMoney * 100) + "</total_fee>"
                                + "<trade_type>JSAPI</trade_type>"
                                + "<sign>" + postData + "</sign>"
                                + "</xml>";

                            string retStr2 = WeChatClass.Command.command.PostJsonData("https://api.mch.weixin.qq.com/pay/unifiedorder", orderXml);
                            string prepay_id = "";
                            if (retStr2 != "" && retStr2.IndexOf("prepay_id") > 0)
                            {
                                try
                                {
                                    XmlDocument doc = new XmlDocument();
                                    doc.LoadXml(retStr2);
                                    XmlNodeList list = doc.GetElementsByTagName("xml");
                                    XmlNode xn = list[0];
                                    prepay_id = xn.SelectSingleNode("//prepay_id").InnerText;
                                }
                                catch
                                {

                                }
                            }
                            if (prepay_id != "")
                            {
                                string nonceStr = Guid.NewGuid().ToString().Replace("-", "");
                                int timespan = ConvertDateTimeInt(DateTime.Now);
                                string timeSpanStr = timespan.ToString();

                                string postStr2 = "appId=wxd438ca7726cbc438&nonceStr=" + nonceStr + "&package=prepay_id=" + prepay_id + "&signType=MD5&timeStamp=" + timeSpanStr;
                                postStr2 += "&key=FEIYANG4000365666IFLYING27666666";//FY4000365666NBFLYING057427666666

                                var bs = md5.ComputeHash(Encoding.UTF8.GetBytes(postStr2));
                                var sb = new StringBuilder();
                                foreach (byte bb in bs)
                                {
                                    sb.Append(bb.ToString("x2"));
                                }
                                //所有字符转为大写
                                string signStr = sb.ToString().ToUpper();

                                retStr = "{\"appId\":\"wxd438ca7726cbc438\", \"timeStamp\":\"" + timeSpanStr + "\",\"nonceStr\":\"" + nonceStr + "\",\"package\":\"prepay_id=" + prepay_id + "\","
                                    + "\"signType\":\"MD5\", \"paySign\":\"" + signStr + "\"}";
                            }
                        }
                    }
                }
            }
            else
            {
                retStr = "";
            }
            ResponseWrite(retStr);
        }
        private int ConvertDateTimeInt(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            return (int)(time - startTime).TotalSeconds;
        }
    }
}