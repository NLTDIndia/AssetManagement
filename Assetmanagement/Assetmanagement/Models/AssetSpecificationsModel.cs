using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetSpecificationsModel
    {
        public string AssetName { get; set; }

        public string AssetSpecificationValue { get; set; }

        public DateTime CreatedOn { get; set; }
        public string AssetTagNumber { get; set; }

        public DateTime LastModifiedOn { get; set; }
        public string AssetTypeSpecificationName { get; set; }
        public int CreatedBy { get; set; }      
        public int LastModifiedBy { get; set; }
    }
}