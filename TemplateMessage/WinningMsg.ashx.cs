using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// WinningMsg 的摘要说明
    /// </summary>
    public class WinningMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string time = GetParam("time", "");
            string prize = GetParam("prize", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if (!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(time) && !string.IsNullOrEmpty(prize))
            {
                string param = msgCommad.GetParamMsg("first", msgContent, "#000000") + "," + msgCommad.GetParamMsg("keyword1", time, "#173177") + "," + msgCommad.GetParamMsg("keyword2", prize, "#173177")
                    + "," + msgCommad.GetParamMsg("remark", remark, "#000000");

                string msg = msgCommad.GetMsgContent("Glz7LPmhXiTsE17nOMGxJa-pJ7K1WShfc0lgYVGhqX4", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}