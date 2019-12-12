using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class PendingAssetsModel
    {
        public DateTime PORaisedOn { get; set; }
        public string NoofDaysSincePO { get; set; }
        public string PONumber { get; set; }
        public string AssetType { get; set; }
        public string Quantity { get; set; }
        public string VendorName { get; set; }
        public string VendorMobileNumber { get; set; }
        public string VendorLandLineNumber { get; set; }
        public string Email { get; set; }
        public string TotalPrice { get; set; }
        public string PaidAmount { get; set; }
        public string AssetRequestId { get; set; }
        public string RequestRaisedBy { get; set; }
        public string OrderedforLocation { get; set; }
        public string OrderedforEmployee { get; set; }

    }
}