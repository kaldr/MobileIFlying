using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeChat.Interface
{
    /// <summary>
    /// oauth 的摘要说明
    /// </summary>
    public class oauth : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string rectUrl = GetParam("url", "");

            context.Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd438ca7726cbc438&redirect_uri=http%3a%2f%2fm.iflying.com%2flove%2foauth2.ashx&response_type=code&scope=snsapi_base&state=" + rectUrl + "#wechat_redirect");
        }
    }
}