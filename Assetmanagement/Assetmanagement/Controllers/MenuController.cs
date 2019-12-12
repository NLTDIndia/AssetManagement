using Assetmanagement.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Xml;
using System.Xml.Serialization;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class MenuController : ApiController
    {
        [Route("GetMenuList")]

        public IHttpActionResult GetMenu(UserModel userInfo)
        {
            string fileName = System.Web.Configuration.WebConfigurationManager.AppSettings["XmlMenuList"].ToString();
            int childrenCount = 0;

            XmlDocument document = new XmlDocument();
            document.Load(fileName);

            XmlElement element = document.DocumentElement;
            List<MenuItem> menu = new List<MenuItem>();
            List<string> accessUrlList = new List<string>();
            foreach (XmlNode node in document.SelectNodes("/Menu/MenuList/MenuItem"))
            {
                MenuItem menuItem = new MenuItem();

                menuItem.name = node.Attributes["name"].Value;
                menuItem.url = node.Attributes["url"].Value;
                menuItem.icon = node.Attributes["icon"].Value;
                //menuItem.Role = node.Attributes["role"].Value;
                var childrenList = new List<MenuItems>();
                if (node.ChildNodes.Count > 0)
                {
                    foreach (XmlNode childItem in node.ChildNodes[0].ChildNodes)
                    {
                        var childrenMenuItem = new MenuItems();
                        var role = childItem.Attributes["role"].Value.ToLower().Trim().Split(',');
                        var isMenuItem = Convert.ToBoolean(childItem.Attributes["isMenuItem"].Value);
                        if (role.Select(x => x.Trim()).Contains(userInfo.Role.ToLower()) || role.Select(x => x.Trim()).Contains("all"))
                        {
                            childrenMenuItem.name = childItem.Attributes["name"].Value;
                            childrenMenuItem.url = childItem.Attributes["url"].Value;
                            childrenMenuItem.icon = childItem.Attributes["icon"].Value;
                            if (isMenuItem)
                            {
                                childrenList.Add(childrenMenuItem);
                                childrenCount++;
                            }
                            accessUrlList.Add(childrenMenuItem.url);
                        }
                    }
                    if (childrenCount > 0)
                    {
                        menuItem.children = childrenList;
                        menu.Add(menuItem);
                    }
                    childrenCount = 0;
                }
            }
            var json = JsonConvert.SerializeObject(menu);
            userInfo.MenuList = json;
            userInfo.AccessUrl = accessUrlList;

            return Ok(userInfo);
        }
    }
}
