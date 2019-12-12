using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class RaisePoController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

      
        [HttpGet]
        [Route("GetRaisePO_QuotationApprovals")]
        public IList<RaisePOModel> GetRaisePO_QuotationApprovals()
        {
            string AssetStatus = "Awaiting PO";
            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();
            try
            {
                var qry = (from aqp in db.AssetQuoteApprovals
                           join aq in db.AssetQuotations on aqp.AssetQuotationId equals aq.Id
                           join ar in db.AssetRequests on aq.AssetRequestId equals ar.Id
                           join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                           join vt in db.AssetVendors on aq.AssetVendorId equals vt.Id
                           join e in db.Employees on aqp.ApprovedBy equals e.UserId
                           where ar.AssetStatusId == dbAssetStatusId && aqp.IsAwaitingNextApproval == false
                           select new RaisePOModel
                           {
                               AssetQuotationId = aq.Id,
                               ARNumber = ar.ARNumber,
                               VendorName = vt.Name,
                               AssetRequestId = ar.Id,
                               AssetTypeId = at.Id,
                               AssetTypeName = at.Name,
                               ApprovedBy = aqp.ApprovedBy,
                               ApprovedOn = aqp.ApprovedOn,
                               EmployeeName = e.FirstName + " " + e.LastName
                           }).ToList();

                return qry;
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
