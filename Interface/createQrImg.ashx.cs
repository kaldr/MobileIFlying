using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace WeChat.Interface
{
    /// <summary>
    /// createQrImg 的摘要说明
    /// </summary>
    public class createQrImg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            int scene_id = GetParam<int>("scene", 0);
            if (scene_id > 0)
            {
                string accessToken = WeChatClass.Command.command.GetAccessToken();
                string postData = "{\"expire_seconds\": 1800,\"action_name\": \"QR_LIMIT_SCENE\",\"action_info\": {\"scene\": {\"scene_id\": " + scene_id + "}}}";
                string postUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + accessToken;

                string retStr = WeChatClass.Command.command.PostJsonData(postUrl, postData);
                if(retStr!="" && retStr.IndexOf("ticket") > 0)
                {
                    JObject _obj = (JObject)JsonConvert.DeserializeObject(retStr);
                    if(_obj!=null && _obj.Count > 0)
                    {
                        string ticket = _obj["ticket"].ToString();
                        if (ticket != "")
                        {
                            context.Response.Redirect("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket);
                        }
                    }
                }
            }
        }
    }
}