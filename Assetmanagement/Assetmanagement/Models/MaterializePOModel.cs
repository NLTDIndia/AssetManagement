using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class MaterializePOModel
    {
        public long AssetQuotationId { get; set; }
        public Nullable<long> AssetRequestId { get; set; }
        public long AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string VendorName { get; set; }
        public string AssetStatusName { get; set; }
        public int ApprovedBy { get; set; }
        public DateTime ApprovedOn { get; set; }
        public string EmployeeName { get; set; }
    }
}