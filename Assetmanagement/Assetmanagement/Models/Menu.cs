using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class MenuItem : MenuItems
    {
        public List<MenuItems> children { get; set; }
    }
    public class MenuItems
    {
        public string name { get; set; }
        public string url { get; set; }
        public string icon { get; set; }

    }
}