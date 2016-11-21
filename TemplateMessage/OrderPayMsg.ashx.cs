using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// OrderPayMsg 的摘要说明
    /// </summary>
    public class OrderPayMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string orderId = GetParam("orderid", "");
            string proName = GetParam("productname", "");
            string payMoney = GetParam("payMoney", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if(!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(orderId) && !string.IsNullOrEmpty(proName) && !string.IsNullOrEmpty(payMoney))
            {
                string param = msgCommad.GetParamMsg("first", msgContent, "#000000") + "," + msgCommad.GetParamMsg("keyword1", orderId, "#173177") + "," + msgCommad.GetParamMsg("keyword2", proName, "#173177")
                   + "," + msgCommad.GetParamMsg("keyword3", payMoney, "#173177") + "," + msgCommad.GetParamMsg("remark", remark, "#000000");
                string msg = msgCommad.GetMsgContent("1UIw3Wez8KZn6Apm03BKiSmUvWxp06f4o31GpPG5YI4", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}