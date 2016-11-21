using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;
using WeChatClass.TemplateMessage;

namespace WeChat.NewIflying.pay
{
    /// <summary>
    /// paySuccess 的摘要说明
    /// </summary>
    public class paySuccess : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string retStr = "";
            if (context.Request.HttpMethod.ToLower() == "post")
            {
                Stream s = System.Web.HttpContext.Current.Request.InputStream;
                byte[] b = new byte[s.Length];
                s.Read(b, 0, (int)s.Length);
                string postStr = Encoding.UTF8.GetString(b);
                if (!string.IsNullOrEmpty(postStr))
                {
                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(postStr);
                    XmlNodeList list = doc.GetElementsByTagName("xml");
                    XmlNode xn = list[0];
                    if (xn != null)
                    {
                        string ret = xn.SelectSingleNode("//result_code").InnerText;
                        string orderId = xn.SelectSingleNode("//attach").InnerText;
                        string totalFee = xn.SelectSingleNode("//total_fee").InnerText;
                        string openid = xn.SelectSingleNode("//openid").InnerText;
                        string transaction_id = xn.SelectSingleNode("//transaction_id").InnerText;
                        double price = 0;
                        try
                        {
                            price = Convert.ToDouble(totalFee);
                            price = price / 100;
                        }
                        catch { }
                        if (WeChatClass.pay.PaySuccess.InnerMoney(orderId, price, "1219632001", transaction_id, openid,postStr,ret))
                        {
                            retStr = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
                            //触发模板消息
                            //string param = msgCommad.GetParamMsg("first", "您已成功为订单[" + _data["OrderNo"].ToString() + "]支付金额。", "#000000") + "," + msgCommad.GetParamMsg("keyword1", _data["OrderNo"].ToString(), "#173177") + "," + msgCommad.GetParamMsg("keyword2", _data["ProductTitle"].ToString(), "#173177")
                            //          + "," + msgCommad.GetParamMsg("keyword3", price.ToString(), "#173177") + "," + msgCommad.GetParamMsg("remark", "点击查看订单详情", "#000000");
                            //string msg = msgCommad.GetMsgContent("Ej22lKKW0G_vHjIj4NOyoLCpdfya6LTLrXifTXQ3yr8", openid, "http://tripmore.iflying.com/OrderPublic/orderDetail.html?order=" + orderId, param);

                            //WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);
                        }
                        else
                        {
                            retStr = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
                        }                       
                    }
                }
            }
            if (retStr == "")
            {
                retStr = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[参数错误]]></return_msg></xml>";
            }
            ResponseWrite(retStr);
        }
    }
}