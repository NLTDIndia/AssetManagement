using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AvailableAssets
    {
        public long AssetAllocationId { get; set; }
        public long AssetId { get; set; }
        public string AssetTagNumber { get; set; }
        public string AssetCategoryName { get; set; }
        public string AssetTypeName { get; set; }

        public Nullable<long> Price { get; set; }
        public long? AssetRequestId { get; set; }
        public long LocationId { get; set; }
        public long EmployeeId { get; set; }
        public long AssetSpecId { get; set; }
        public string AssetTypeSpecValue { get; set; }
        public DateTime AssetAllocatedOn { get; set; }
        public DateTime? AssetCancelledOn { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public int LastModifiedBy { get; set; }
        public string EmployeeName { get; set; }
        public string LocationName { get; set; }
        public string EntityName { get; set; }
        public string formData { get; set; }
        public string Comments { get; set; }
        public IList<AssetAddAvailableAssets> AssetAllocationArray { get; set; }
    }

    public class AvailableAssetsModel
    {
        public long AssetId { get; set; }
        public int CreatedBy { get; set; }
       
        public IList<AssetAddAvailableAssets> AssetAllocationArray { get; set; }
    }
    public class AssetAddAvailableAssets
    {
        public long LocationId { get; set; }
        public long EmployeeId { get; set; }
        public string Comments { get; set; }

    }

}
