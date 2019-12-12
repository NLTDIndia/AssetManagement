using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetQuoteApproveModal
    {
        public long Id { get; set; }
        public Nullable<long> AssetQuotationId { get; set; }
        public Nullable<int> ApprovedBy { get; set; }

        public Nullable<System.DateTime> ApprovedOn { get; set; }
        public string IsAwaitingNextApproval { get; set; }
        public string Comments { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedOn { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
    }
}