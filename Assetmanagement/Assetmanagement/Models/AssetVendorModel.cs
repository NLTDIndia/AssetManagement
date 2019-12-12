using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetVendorModel
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string Area { get; set; }
        public string City { get; set; }
        public string Pincode { get; set; }
        public string State { get; set; }
        public string MobileNo { get; set; }
        public string Email { get; set; }
        public string LandLineNo { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedOn { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
        public string ContactPerson { get; set; }
    }
}