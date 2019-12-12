using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class RaisePOModel
    {
        public long AssetQuotationId { get; set; }
        public long AssetRequestId { get; set; }
        public long AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string VendorName { get; set; }
        public string AssetStatusName { get; set; }
        public long ?ApprovedBy { get; set; }
        public DateTime ?ApprovedOn { get; set; }
        public string ARNumber { get; set; }
        public string EmployeeName { get; set; }
        public string PONumber { get; set; }
        public string Location { get; set; }
    }
}