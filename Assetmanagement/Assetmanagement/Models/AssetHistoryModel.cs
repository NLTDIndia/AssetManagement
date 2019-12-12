using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetHistoryModel
    {
        public string AssetRequestNumber { get; set; }
        public string PONumber { get; set; }
        public string Status { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string Comments { get; set; }
        public string AssetType { get; set; }
        public long? Quantity { get; set; }
    }
    public class AssetsModel
    {
        public string AssetRequestNumber { get; set; }
        public string PONumber { get; set; }
        public string AssetType { get; set; }
        public string TagNumber { get; set; }
        public DateTime? ActivationDate { get; set; }
        public DateTime ?ExpiryDate { get; set; }
        public string AssetIdentifier { get; set; }     
        public long AssetId { get; set; }
    }
    public class AssetsDateModel
    {
        public DateTime? ActivationDate { get; set; }
        public DateTime? ExpiryDate { get; set; }
    }
}