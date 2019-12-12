using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AllocatedAssetsModel
    {
        public long AssetAllocationId { get; set; }
        public long? AssetId { get; set; }
        public string AssetTagNumber { get; set; }
        public string AssetCategoryName { get; set; }
        public string AssetTypeName { get; set; }
        public long? AssetRequestId { get; set; }
        public long LocationId { get; set; }
        public long EmployeeId { get; set; }
        public DateTime AssetAllocatedOn { get; set; }
        public DateTime AssetCancelledOn { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public int LastModifiedBy { get; set; }
        public string ServiceTagNumber { get; set; }
        public string LocationName { get; set; }
        public string EmployeeName { get; set; }
        public string StrAssetAllocatedOn { get; set; }
        public string StrAssetCancelledOn { get; set; }
        public long AssetSpecId { get; set; }
        public string AssetTypeSpecValue { get; set; }
    }

    public class UnAllocatedAssetsModel
    {
        public string AssetTypeName { get; set; }
        public string RequestedFor { get; set; }
        public string RequestedBy { get; set; }
        public string AssetTagNumber { get; set; }
        public string LocationName { get; set; }
    }
}