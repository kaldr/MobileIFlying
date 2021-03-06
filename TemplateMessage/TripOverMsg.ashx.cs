﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WeChatClass.TemplateMessage;

namespace WeChat.TemplateMessage
{
    /// <summary>
    /// TripOverMsg 的摘要说明
    /// </summary>
    public class TripOverMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openId = GetParam("openid", "");
            string msgContent = GetParam("msg", "");
            string trip = GetParam("trip", "");
            string endTime = GetParam("endtime", "");
            string remark = GetParam("remark", "");
            string url = GetParam("url", "");

            if(!string.IsNullOrEmpty(openId) && !string.IsNullOrEmpty(msgContent) && !string.IsNullOrEmpty(trip) && !string.IsNullOrEmpty(endTime))
            {
                string param = msgCommad.GetParamMsg("first",msgContent,"#000000")+","+msgCommad.GetParamMsg("keyword1",trip,"#173177")+","+msgCommad.GetParamMsg("keyword2",endTime,"#173177")
                    + "," + msgCommad.GetParamMsg("remark", remark, "#000000");

                string msg = msgCommad.GetMsgContent("Cc3Hb_Oke2RXQtvnZ7BKNUIYQGnKcm-wtSKGVAGfPbA", openId, url, param);

                string retStr = WeChatClass.Command.command.PostJsonData(WeChatClass.Command.command.GetTemplateUrl(), msg);

                ResponseWrite(retStr);
            }
        }
    }
}