using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace WeChat.Interface
{
    /// <summary>
    /// GetWeChatInfo 的摘要说明
    /// </summary>
    public class GetWeChatInfo : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string token = GetParam("token", "");
            if (token != "")
            {
                WeChatClass.Interface.UserInfo item = WeChatClass.Interface.GetUserInfo.Get(token);
                if (item != null)
                {
                    ResponseWrite(JsonConvert.SerializeObject(item));
                }
            }
            ResponseWrite("");
        }
    }
}