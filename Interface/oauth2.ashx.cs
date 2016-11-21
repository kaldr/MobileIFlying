using Feiyang.WebRequest.Help;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeChat.Interface
{
    /// <summary>
    /// oauth2 的摘要说明
    /// </summary>
    public class oauth2 : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string code = GetParam("code", "");
            string state = GetParam("state", "");
            if (code != "" && state != "")
            {
                string appId = "wxd438ca7726cbc438";
                string secret = "b9fa0e6b06701949786dd2a1a42f8673";
                string postUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appId + "&secret=" + secret + "&code=" + code + "&grant_type=authorization_code";
                ArrayList list = WebRequestHelp.GetHtmlData(postUrl, new System.Net.CookieContainer());
                if (list != null && list.Count > 1)
                {
                    JObject _obj = (JObject)JsonConvert.DeserializeObject(list[1].ToString());
                    if (_obj != null && _obj.Count > 0)
                    {
                        string openid = _obj["openid"].ToString();

                        if (state.IndexOf("?") > 0)
                        {
                            context.Response.Redirect("http://" + state + "&openid=" + openid);
                        }
                        else
                        {
                            context.Response.Redirect("http://" + state + "?openid=" + openid);
                        }

                    }
                }
            }
        }
    }
}