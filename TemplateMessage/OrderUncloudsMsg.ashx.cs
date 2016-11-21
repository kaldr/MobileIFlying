using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// OrderUncloudsMsg 的摘要说明
    /// </summary>
    public class OrderUncloudsMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string orderId = GetParam("order", "");
            string proName = GetParam("productname", "");
            string startData = GetParam("start", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if (!string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(orderId) && !string.IsNullOrEmpty(proName) && !string.IsNullOrEmpty(startData))
            {
                string paramStr = msgCommad.GetParamMsg("first", msgContent, "#000000") + "," + msgCommad.GetParamMsg("OrderID", orderId, "#173177") + "," + msgCommad.GetParamMsg("PkgName", proName, "#173177") +
                    "," + msgCommad.GetParamMsg("TakeOffDate", startData, "#173177") + "," + msgCommad.GetParamMsg("remark", remark, "#000000");
                string msg = msgCommad.GetMsgContent("KeuRORJUjC_lRBmD9cJZkw8KZ_VPuPkWHhW3UHhaF9Y", openId, url, paramStr);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}