using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// LeaderMsg 的摘要说明
    /// </summary>
    public class LeaderMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string leaderStr = GetParam("leader", "");
            string name = GetParam("name", "");
            string phone = GetParam("phone", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if(!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(leaderStr) && !string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(phone))
            {
                string param = msgCommad.GetParamMsg("type", leaderStr, "#173177") + "," + msgCommad.GetParamMsg("name", name, "#173177") + "," + msgCommad.GetParamMsg("Number", phone, "#173177")
                    + "," + msgCommad.GetParamMsg("remark", remark, "#000000");
                string msg = msgCommad.GetMsgContent("4wsc2EmiNmTINHxHWQNvsESsc45rt-_JooA2-JlLnqU", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}