using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// OrderStatusMsg 的摘要说明
    /// </summary>
    public class OrderStatusMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string orderId = GetParam("orderid", "");
            string orderPrice = GetParam("price", "");
            string orderStatus = GetParam("status", "");
            string proName = GetParam("productname", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if(!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(orderId) && !string.IsNullOrEmpty(orderPrice) && !string.IsNullOrEmpty(orderStatus)
                && !string.IsNullOrEmpty(proName))
            {
                string param = msgCommad.GetParamMsg("first",msgContent,"#000000")+","+msgCommad.GetParamMsg("orderId",orderId,"#173177")+","+msgCommad.GetParamMsg("orderPrice",orderPrice,"#173177")
                    +","+msgCommad.GetParamMsg("orderStatus",orderStatus,"#173177")+","+msgCommad.GetParamMsg("productName",proName,"#173177") + "," + msgCommad.GetParamMsg("remark", remark, "#000000");
                string msg = msgCommad.GetMsgContent("D91STuD9SEGzznUrPZaGdpxk0WMmhgIVRaXz5p3yeLs", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}