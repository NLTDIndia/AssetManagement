using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetRaiseRequestModel
    {
        public Int64 AssetTypeId { get; set; }
        public Int64 AssetLocationId { get; set; }
        public Int64 Quantity { get; set; }
        public string Comments { get; set; }
        public string Options { get; set; }
        public bool isActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime LastModifyOn { get; set; }
        public int LastModifyBy { get; set; }
        public long AssetCategoryId { get; set; }
        public string AssetCategoryName { get; set; }

        public IList<AssetRequestSpecModel> AssetRequestSpec { get; set; }
    }
    public class AssetRequestSpecModel
    {
        public Int64 AssetRequestId { get; set; }
        public Int64 AssetTypeSpectId { get; set; }
        public string AssetTypeSpecValue { get; set; }
        public int CreatedBy { get; set; }
    }
    public class AssetTypeSpecificationModels
    {
        public Int64 AssetTypeSpecId { get; set; }
        public Int64? AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string ValueType { get; set; }
        public int CreatedBy { get; set; }
    }
    public class RequestModel
    {
        public long AssetRequestId { get; set; }
        public Int64 AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string EmployeeName { get; set; }
        public bool IsActive { get; set; }
        public Int64? LocationId { get; set; }
        public string LocationName { get; set; }
        public string AssetStatusName { get; set; }
        public Int64 AssetStatusId { get; set; }
        public DateTime CreatedOn { get; set; }
        public string strCreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public Int64? Quantity { get; set; }
        public string ARNumber { get; set; }
        public long AssetCategoryId { get; set; }
        public string AssetCategoryName { get; set; }
        public int QuotationCount { get; set; }
        
    }
    public class AssetQuotationModel
    {
        public long AssetRequestId { get; set; }
        public string EntityName { get; set; }
        public string formData { get; set; }
        public IList<AssetAddQuotationModel> SpecificationArray { get; set; }
    }
    //AssetAddQuotation
    public class AssetAddQuotationModel
    {
        public long Id { get; set; }
        public Nullable<long> AssetRequestId { get; set; }
        public long VendorId { get; set; }
        //public string VendorName { get; set; }
        public string Name { get; set; }
        public Nullable<decimal> Price { get; set; }
        public int Quantity { get; set; }
        public Nullable<decimal> CGST { get; set; }
        public Nullable<decimal> SGST { get; set; }
        public string Comments { get; set; }
        public string Documents { get; set; }
        public Nullable<long> AssetStatusId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedOn { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
       

    }
    public class AssetGetQuotationModel
    {
        public long AssetQuotationId { get; set; }
        public Nullable<long> AssetRequestId { get; set; }
        public long AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }
        public string VendorName { get; set; }
        public string AssetStatusName { get; set; }
        public long? Quantity { get; set; }
        public Nullable<decimal> CGST { get; set; }
        public Nullable<decimal> SGST { get; set; }
        public Nullable<decimal> Price { get; set; }
        public string Comments { get; set; }
        public IList<AssetDocument> Documents { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public Nullable<long> AssetStatusId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedOn { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
        public string ARNumber { get; set; }
        public string EmployeeName { get; set; }
    }

    public class RaisPODetailModel
    {
        public string PONumber { get; set; }
        public string AssetTypeName { get; set; }
        public string SpecificationName { get; set; }
        public string Description { get; set; }
        public string AssetTypeSpecValue { get; set; }
        public long? Quantity { get; set; }
        public decimal? Price { get; set; }
        public decimal? CGST { get; set; }
        public decimal? SGST { get; set; }
        public decimal? TotalPrice { get; set; }
        public string ChequeNumber { get; set; }
        public string CreditcardNumber { get; set; }
        public string TransactionID { get; set; }
    }
    public class AssetQuotationApprovalComments
    {
        public string QuotationApproveComments { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime? ApprovedOn { get; set; }
        public long AssetQuotationId { get; set; }


    }
}