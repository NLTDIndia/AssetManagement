using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssetManagementModel.Models
    {
    public class AssetTypeSepecificationModel
    {
        public Int64 AssetTypeSpecificationId { get; set; }
        public Int64 AssetTypeId { get; set; }
        public string Name { get; set; }
        public string AssetTypeName { get; set; }
        public string ValueType { get; set; }
        public bool isActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime LastModifyOn { get; set; }
        public int LastModifyBy { get; set; }
    }

    public class AssetTypeOtherSpecificationModel
    {
        public Nullable<long> AssetTypeOtherSpecId { get; set; }
        public Nullable<long> AssetRequestId { get; set; }
        public string AssetTypeOtherSpecification { get; set; }
    }

    public class AssetTypePaymentBalanceModel
    {
        public string Status { get; set; }
        public double BalanceAmount { get; set; }
    }
}