using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetCreationModel
    {
        public string AssetIdentifier { get; set; }
        public Nullable<long> Price { get; set; }
        public System.DateTime PurchaseOrderOn { get; set; }
        public string ServiceTagNumber { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> ActivationDate { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public Int64 AssetTypeId { get; set; }
        public IList<AssetRequestSpecModel> AssetSpec { get; set; }
    }
}