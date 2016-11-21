using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// WeatherMsg 的摘要说明
    /// </summary>
    public class WeatherMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string startWeather = GetParam("startweather", "");
            string endWeather = GetParam("endweather", "");
            string remind = GetParam("remind", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if(!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(startWeather) && !string.IsNullOrEmpty(endWeather) && !string.IsNullOrEmpty(remind))
            {
                string param = msgCommad.GetParamMsg("first",msgContent,"#000000")+","+msgCommad.GetParamMsg("keyword1",startWeather,"#173177")+","+msgCommad.GetParamMsg("keyword2",endWeather,"#173177")
                    +","+msgCommad.GetParamMsg("keyword3",remind,"#173177") + "," + msgCommad.GetParamMsg("remark", remark, "#000000");

                string msg = msgCommad.GetMsgContent("l4zP92HO5WR-XED1xwhsuJV_zzVA8sxncKpv3Z-cF9I", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}