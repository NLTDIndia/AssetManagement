using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class AssetRequestPaymentsModel
    {
        public Nullable<long> AssetRequestId { get; set; }
        //public long Id { get; set; }
        //public string ChequeAmount { get; set; }
        //public Nullable<System.DateTime> CurrentDate { get; set; }
        //public System.DateTime CreatedOn { get; set; }
        //public int CreatedBy { get; set; }
        //public Nullable<System.DateTime> LastModifiedOn { get; set; }
        //public Nullable<int> LastModifiedBy { get; set; }
        public IList<AssetRequestPayments> SpecificationArray { get; set; }
        public int CreatedBy { get; set; }
        public string Comments { get; set; }     
    }
    //AssetAddQuotation
    public class AssetRequestPayments
    {
        public string PaymentMode{ get; set; }
        public decimal? BaseAmount { get; set; }
        public int? Tax { get; set; }
        public string Payee { get; set; }
        public string ChequeNo { get; set; }
        public Nullable<System.DateTime> ChequeDate { get; set; }
        public string ChequeBankName { get; set; }
        public string ChequeBranch { get; set; }
        public string ChequeAmount { get; set; }

        public string CCNo { get; set; }
        public string CCName { get; set; }
        public string CCAmount { get; set; }

        public string DC_TransactionIdentifier { get; set; }
        public string DC_Transferer { get; set; }
        public string DCAmount { get; set; }
        public int CreatedBy { get; set; }
        public string Comments { get; set; }
        public long AssetRequestId { get; set; }
        public long PaymentId { get; set; }
        public string ARNumber { get; set; }
        public string AssetType { get; set; }       
        public DateTime CreatedOn { get; set; }
        public string RequestedBy { get; set; }
    }
}