using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetTypeModel
    {
        public Int64 AssetTypeId { get; set; }
        public string Name { get; set; }
        public Int64 AssetCategoryId { get; set; }
        public bool isActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime LastModifyOn { get; set; }
        public int LastModifyBy { get; set; }
        public string AssetCategoryName { get; set; }
        public long? AddonsTypeId { get; set; }
        public IList<AssetTypeSpecificationModel> SpecificationArray { get; set; }

    }

    public class AssetTypeAddOnsModel
    {
        public Int64 Id { get; set; }
        public string AddonsName { get; set; }
    }

    public class AssetTypeSpecificationModel
    {
        //public Int64 AssetTypeSpecificationId { get; set; }
        public string Name { get; set; }
        public string ValueType { get; set; }
        public Int64 AssetTypeSpecificationId { get; set; }
        public Int64 AssetTypeId { get; set; }
      
        public string AssetTypeName { get; set; }
       
        public bool isActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime LastModifyOn { get; set; }
        public int LastModifyBy { get; set; }
        //public Int64 AssetTypeId { get; set; }
        //public bool isActive { get; set; }
        //public DateTime CreatedOn { get; set; }
        //public int CreatedBy { get; set; }
        //public DateTime LastModifyOn { get; set; }
        //public int LastModifyBy { get; set; }

    }
}