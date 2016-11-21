using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeChat.Interface
{
    /// <summary>
    /// checkIsSub 的摘要说明
    /// </summary>
    public class checkIsSub : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string openid = GetParam("openid", "");
            if (openid != "")
            {
                if (WeChatClass.Command.command.CheckIsSub(openid))
                {
                    ResponseWrite("1");
                }
            }
            ResponseWrite("0");
        }
    }
}