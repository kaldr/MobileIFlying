using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

namespace WeChat.Interface
{
    /// <summary>
    /// getMsg 的摘要说明
    /// </summary>
    public class getMsg : Enthos.UI.BaseHttpHandler
    {
        public override void DoAction(HttpContext context)
        {
            //ResponseWrite(context.Request.QueryString["echostr"]);
            if (context.Request.HttpMethod.ToLower() == "post")
            {
                Stream s = System.Web.HttpContext.Current.Request.InputStream;
                byte[] b = new byte[s.Length];
                s.Read(b, 0, (int)s.Length);
                string postStr = Encoding.UTF8.GetString(b);
                if (!string.IsNullOrEmpty(postStr))
                {
                    ResponseMsg(postStr);
                }
            }
        }
        /// <summary>
        /// 返回信息结果(微信信息返回)
        /// </summary>
        /// <param name="weixinXML"></param>
        private void ResponseMsg(string weixinXML)
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(weixinXML);
            XmlNodeList list = doc.GetElementsByTagName("xml");
            XmlNode xn = list[0];
            string FromUserName = xn.SelectSingleNode("//FromUserName").InnerText;
            string ToUserName = xn.SelectSingleNode("//ToUserName").InnerText;
            string msgType = xn.SelectSingleNode("//MsgType").InnerText;

            if (msgType == "event")
            {
                string eventContent = xn.SelectSingleNode("//Event").InnerText;
                string eventKey = xn.SelectSingleNode("//EventKey").InnerText;
                if (eventContent == "subscribe")   //关注
                {

                    string tempKey = eventKey.Replace("qrscene_", "");
                    //关注回复
                    ResponseWrite(GetMsgContent("终于等到你/::P", ToUserName, FromUserName));
                }
                else
                {
                    EventAction(FromUserName, eventKey, ToUserName);
                }
            }
            else if (msgType == "text")
            {
                string content = xn.SelectSingleNode("Content").InnerText;
                TextAction(FromUserName, content, ToUserName);
            }
            else if (msgType == "image")
            {

            }
            else if (msgType == "voice")
            {

            }
        }

        private void EventAction(string token, string eventKey, string fromUser)
        {
            switch (eventKey)
            {
                case "V1_tripMore":
                    ResponseWrite(GetMsgContent("\ue137\ue137\ue137施工中...", fromUser, token));
                    break;
                case "V2_Active":
                    ResponseWrite(GetMsgContent("\ue411\ue411\ue411暂无下期活动哦...", fromUser, token));
                    break;
                case "V3_ServerOline":
                    ResponseWrite(GetMsgContent("\ue411\ue411\ue411客服妹子不在线...", fromUser, token));
                    break;
                case "V4_PreDay":
                    ResponseWrite(GetMsgContent("\ue411\ue411\ue411暂无优惠哦...", fromUser, token));
                    break;
                case "V5_About":
                    ResponseWrite(GetPicMsgContent("关于我们","TripMore的故事", "http://mp.weixin.qq.com/s?__biz=MzIwNjE0MzgwMA==&mid=502047382&idx=1&sn=11806798bf129a897337bee114d19442#rd", "http://tripmore.iflying.com/images/321.jpg", fromUser, token));
                    break;
                default:
                    break;

            }
        }

        private void TextAction(string token, string content, string fromUser)
        {
            switch (content)
            {
                case "redparket":
                    
                    break;
                default: 
                    if (content.IndexOf("@@") > 0)
                    {
                        GetShipImage(content, fromUser, token);
                    }
                    if (content.IndexOf("TD") >= 0)
                    {
                        string teamNum = content.Replace("TD", "");
                        string code = WeChatClass.LuckyDraw.GetLuckTeam.GetTeamCode(teamNum, token);
                        if (code != "")
                        {
                            ResponseWrite(GetMsgContent("本次抽奖口令[" + code + "]", fromUser, token));
                        }
                        else
                        {
                            ResponseWrite(GetMsgContent("团队不存在", fromUser, token));
                        }
                    }
                    if (content.Length == 6)
                    {
                        int tempNum = 0;
                        try
                        {
                            tempNum = Convert.ToInt32(content);
                        }
                        catch{}
                        if (tempNum > 0)
                        {
                            Hashtable luckInfo = WeChatClass.LuckyDraw.GetLuckTeam.GetLuckInfo(content);
                            if(luckInfo!=null && luckInfo.Count > 0)
                            {
                                ResponseWrite(GetPicMsgContent("TripMore抽奖大作战", "更多快乐的旅行体验,就在TripMore。", "http://tripmore.iflying.com/luckydraw/index.aspx?openid=" + token + "&luck=" + luckInfo["ID"].ToString() + "&team=" + luckInfo["TeamID"].ToString() + "", "http://tripmore.iflying.com/images/303.jpg", fromUser, token));

                            }
                            else
                            {
                                ResponseWrite(GetMsgContent("抽奖口令不正确", fromUser, token));
                            }
                        }
                    }
                    break;
            }
        }
        private void GetShipImage(string str, string fromUser, string token)
        {
            string[] strList = Regex.Split(str, "@@");
            if (strList.Length > 1)
            {
                string str1 = strList[0];
                string str2 = strList[1];
                if (str1 != "" && str2 != "")
                {
                    Bitmap bmp = new Bitmap(this.Context.Server.MapPath("loveimage") + "\\aaa1.jpg");
                    Graphics g = Graphics.FromImage(bmp);

                    Font font = new Font("微软雅黑", 1800);
                    SolidBrush sbrush = new SolidBrush(Color.Black);
                    //判断字数
                    if (str1.Length > 10)
                    {
                        string s1 = str1.Substring(0, 10);
                        string s2 = str1.Substring(10, str1.Length - 10);
                        g.DrawString(s1, font, sbrush, new PointF(100, 40));
                        g.DrawString(s2, font, sbrush, new PointF(100, 70));
                    }
                    else
                    {
                        g.DrawString(str1, font, sbrush, new PointF(100, 40));
                    }

                    if (str2.Length > 10)
                    {
                        string s1 = str2.Substring(0, 10);
                        string s2 = str2.Substring(10, str2.Length - 10);
                        g.DrawString(s1, font, sbrush, new PointF(320, 375));
                        g.DrawString(s2, font, sbrush, new PointF(320, 410));
                    }
                    else
                    {
                        g.DrawString(str2, font, sbrush, new PointF(320, 375));
                    }

                    string fileName = this.Context.Server.MapPath("loveimage") + "\\" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + (new Random()).Next().ToString().Substring(0, 4) + ".jpg";
                    bmp.Save(fileName);
                    //ResponseWrite(GetMsgContent(fileName, fromUser, token));
                    string m_id = WxUpLoad(fileName, WeChatClass.Command.command.GetAccessToken());
                    if (m_id != "")
                    {
                        //ResponseWrite(GetMsgContent(GetImgContent(m_id, fromUser, token), fromUser, token));
                        ResponseWrite(GetImgContent(m_id, fromUser, token));
                    }
                    else
                    {
                        ResponseWrite(GetMsgContent("图片生成失败,请重试/::</::</::<", fromUser, token));
                    }
                }
                else
                {
                    ResponseWrite(GetMsgContent("指令错误,正确指令xxxxxx@@xxxxxxx，PS:每段文字不要超过20个字哦！", fromUser, token));
                }
            }
            else
            {
                ResponseWrite(GetMsgContent("指令错误,正确指令xxxxxx@@xxxxxxx，PS:每段文字不要超过20个字哦！", fromUser, token));
            }
        }

        private string WxUpLoad(string filepath, string token)

        {

            using (WebClient client = new WebClient())

            {
                try
                {

                    byte[] b = client.UploadFile(string.Format("https://api.weixin.qq.com/cgi-bin/media/upload?access_token={0}&type={1}", token, "image"), filepath);//调用接口上传文件

                    string retdata = Encoding.Default.GetString(b);//获取返回值

                    if (retdata.Contains("media_id"))//判断返回值是否包含media_id，包含则说明上传成功，然后将返回的json字符串转换成json

                    {

                        JObject _obj = (JObject)JsonConvert.DeserializeObject(retdata);
                        if (_obj != null && _obj.Count > 0)
                        {
                            return _obj["media_id"].ToString();
                        }

                    }
                }
                catch { }

            }

            return "";

        }

        private string GetMsgContent(string content, string fromUser, string toUser)
        {
            string retStr = string.Empty;
            if (!string.IsNullOrEmpty(content) && !string.IsNullOrEmpty(fromUser) && !string.IsNullOrEmpty(toUser))
            {
                retStr += "<xml><ToUserName><![CDATA[" + toUser + "]]></ToUserName>";
                retStr += "<FromUserName><![CDATA[" + fromUser + "]]></FromUserName>";
                retStr += "<CreateTime>" + DateTime.Now.ToString("yyyyMMddhhmmss") + "</CreateTime>";
                retStr += "<MsgType><![CDATA[text]]></MsgType>";
                retStr += "<Content><![CDATA[" + content + "]]></Content>";
                retStr += "</xml>";
            }
            return retStr;
        }

        private string GetPicMsgContent(string title, string content, string linkUrl, string picUrl, string fromUser, string toUser)
        {
            string retStr = string.Empty;
            if (!string.IsNullOrEmpty(content) && !string.IsNullOrEmpty(fromUser) && !string.IsNullOrEmpty(toUser))
            {
                retStr += "<xml><ToUserName><![CDATA[" + toUser + "]]></ToUserName>";
                retStr += "<FromUserName><![CDATA[" + fromUser + "]]></FromUserName>";
                retStr += "<CreateTime>" + DateTime.Now.ToString("yyyyMMddhhmmss") + "</CreateTime>";
                retStr += "<MsgType><![CDATA[news]]></MsgType>";
                retStr += "<ArticleCount>1</ArticleCount>";
                retStr += "<Articles>";
                retStr += "<item>";
                retStr += "<Title><![CDATA[" + title + "]]></Title>";
                retStr += "<Description><![CDATA[" + content + "]]></Description>";
                retStr += "<PicUrl><![CDATA[" + picUrl + "]]></PicUrl>";
                retStr += "<Url><![CDATA[" + linkUrl + "]]></Url>";
                retStr += "</item>";
                retStr += "</Articles>";
                retStr += "<FuncFlag>1</FuncFlag>";
                retStr += "</xml>";
            }
            return retStr;
        }

        private string GetImgContent(string m_id, string formUser, string toUser)
        {
            string retStr = string.Empty;

            if (!string.IsNullOrEmpty(m_id) && !string.IsNullOrEmpty(formUser) && !string.IsNullOrEmpty(toUser))
            {
                retStr += "<xml><ToUserName><![CDATA[" + toUser + "]]></ToUserName>";
                retStr += "<FromUserName><![CDATA[" + formUser + "]]></FromUserName>";
                retStr += "<CreateTime>" + DateTime.Now.ToString("yyyyMMddhhmmss") + "</CreateTime>";
                retStr += "<MsgType><![CDATA[image]]></MsgType>";
                retStr += "<Image>";
                retStr += "<MediaId><![CDATA[" + m_id + "]]></MediaId>";
                retStr += "</Image>";
                retStr += "</xml>";
                //retStr += toUser + "," + formUser + "," + DateTime.Now.ToString("yyyyMMddhhmmss") + "," + m_id;
            }
            return retStr;
        }
    }
}