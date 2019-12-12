using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class AssetQuoteApprovalController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();
             
        [HttpPost]
        [Route("PostAssetQuoteApproval")]
        // POST api/RaiseRequest       
        public IHttpActionResult PostAssetQuoteApproval()
        {
            long assetQuotationId, entityTypeId;
            int loginId;
            string comments, status = string.Empty, PONumber = string.Empty, sdate = string.Empty;
            bool isAwaitingNextApproval;
            long dbMaxPONumber = 0;
            try
            {
                HttpResponseMessage response = new HttpResponseMessage();
                var httpRequest = HttpContext.Current.Request;
                assetQuotationId = Convert.ToInt64(httpRequest.Form["AssetQuotationId"]);
                comments = httpRequest.Form["Comments"];
                isAwaitingNextApproval = Convert.ToBoolean(httpRequest.Form["IsAwaitingNextApproval"]);
                loginId = Convert.ToInt32(httpRequest.Form["LoginId"]);
                entityTypeId = Convert.ToInt64(httpRequest.Form["EntityTypeId"]);
                string AssetStatus = string.Empty;
                bool IsAwaitingNxtApproval = false;
                if (isAwaitingNextApproval == true)
                {
                    IsAwaitingNxtApproval = true;
                    AssetStatus = "Awaiting Quotation Approval";
                }
                else
                {
                    AssetStatus = "Awaiting PO";
                }

                var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();
                var dbAssetRequestId = db.AssetQuotations.Where(c => c.Id == assetQuotationId).Select(x => x.AssetRequestId).FirstOrDefault();


                AssetQuoteApproval assetQuoteApproval = new AssetQuoteApproval();
                assetQuoteApproval.AssetQuotationId = assetQuotationId;
                assetQuoteApproval.ApprovedBy = loginId; //Need to modify
                assetQuoteApproval.ApprovedOn = System.DateTime.Now;
                assetQuoteApproval.IsAwaitingNextApproval = IsAwaitingNxtApproval;
                assetQuoteApproval.Comments = comments;
                assetQuoteApproval.CreatedBy = loginId;
                assetQuoteApproval.CreatedOn = System.DateTime.Now;
                db.AssetQuoteApprovals.Add(assetQuoteApproval);

                if (httpRequest.Form.Keys.Count > 0)
                {
                    var fileUpload = new AssetDocumentsController();
                    var result = fileUpload.FileUpload(entityTypeId,loginId);
                }
                db.SaveChanges();
                var assetRequest = db.AssetRequests.SingleOrDefault(x => x.Id == dbAssetRequestId); // Add the PO Number exists in AssetRequest table
                sdate = DateTime.Now.ToShortDateString().Replace(@"-", "");

                dbMaxPONumber = db.AssetRequests.Where(a => a.PONumber != null).Count();
                dbMaxPONumber = dbMaxPONumber + 1;
                PONumber = "PO_" + dbMaxPONumber + "_" + sdate;

                if (assetRequest != null)
                {
                    assetRequest.AssetQuotationId = assetQuotationId;
                    assetRequest.PONumber = PONumber;
                    assetRequest.AssetStatusId = dbAssetStatusId;
                    assetRequest.LastModifiedOn = System.DateTime.Now;
                    db.SaveChanges();
                }
                status = "success";
                
                AssetHistory assetHistory = new AssetHistory();
                assetHistory.AssetRequestId = Convert.ToInt32(dbAssetRequestId);
                assetHistory.TargetStatusId = dbAssetStatusId;
                assetHistory.StatusChangedBy = loginId;
                assetHistory.StatusModifiedOn = System.DateTime.Now;
                assetHistory.Comments = comments;
                db.AssetHistories.Add(assetHistory);
                db.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
            return Ok(status);
        }


    }
}
