using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// DirverMsg 的摘要说明
    /// </summary>
    public class DirverMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string dirverName = GetParam("dirvername", "");
            string carNo = GetParam("car", "");
            string startTime = GetParam("startTime", "");
            string startPlace = GetParam("startplace", "");
            string endPlace = GetParam("endplace", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if(!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(dirverName) && !string.IsNullOrEmpty(carNo) && !string.IsNullOrEmpty(startTime)
                && !string.IsNullOrEmpty(startPlace) && !string.IsNullOrEmpty(endPlace))
            {
                string param = msgCommad.GetParamMsg("first", msgContent, "#000000") + "," + msgCommad.GetParamMsg("keyword1", dirverName, "#173177") + "," + msgCommad.GetParamMsg("keyword2", carNo, "#173177")
                    + "," + msgCommad.GetParamMsg("keyword3", startTime, "#173177") + "," + msgCommad.GetParamMsg("keyword4", startPlace, "#173177") + "," + msgCommad.GetParamMsg("keyword5", endPlace, "#173177")
                    + "," + msgCommad.GetParamMsg("remark", remark, "#000000");
                string msg = msgCommad.GetMsgContent("Ej22lKKW0G_vHjIj4NOyoLCpdfya6LTLrXifTXQ3yr8", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}