using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeChat.Interface
{
    /// <summary>
    /// creatBut 的摘要说明
    /// </summary>
    public class creatBut : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            string menuStr = " {   "
     + "\"button\":["
     + "{	"
          + "\"type\":\"click\","
          + "\"name\":\"猫旅行\","
          + "\"key\":\"V1_tripMore\""
      + "},"
       + "{	"
          + "\"type\":\"click\","
          + "\"name\":\"近期活动\","
          + "\"key\":\"V2_Active\""
      + "},"
       + "{	"
          + "\"name\":\"我的猫舍\","
          + "\"sub_button\": ["
           + "{	"
          + "\"type\":\"click\","
          + "\"name\":\"在线客服\","
          + "\"key\":\"V3_ServerOline\""
      + "},"
       + "{	"
          + "\"type\":\"click\","
          + "\"name\":\"每日优惠\","
          + "\"key\":\"V4_PreDay\""
      + "},"
       + "{	"
          + "\"type\":\"click\","
          + "\"name\":\"关于我们\","
          + "\"key\":\"V5_About\""
      + "}"
      + "]}"
      + "]}";
            ResponseWrite(WeChatClass.Command.command.PostJsonData("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + WeChatClass.Command.command.GetAccessToken(), menuStr));
        } 
        
    }
}