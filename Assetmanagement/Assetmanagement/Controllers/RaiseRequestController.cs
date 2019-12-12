using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class RaiseRequestController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

                    
        [HttpGet]
        [Route("GetRaiseRequest")]
        public IList<RequestModel> GetRaiseRequest()

        {

            string AssetStatus = "Quotation In Progress";

            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();

            var qry = (from ac in db.AssetCategories
                       join at in db.AssetTypes on ac.Id equals at.AssetCategoryId
                       join ar in db.AssetRequests on at.Id equals ar.AssetTypeId
                       join e in db.Employees on ar.CreatedBy equals e.UserId
                       join ast in db.AssetStatus on ar.AssetStatusId equals ast.Id
                       join loc in db.AssetLocations on ar.LocationId equals loc.Id into loclist
                       from arloc in loclist.DefaultIfEmpty()
                       where ar.IsActive == true && ar.AssetStatusId == dbAssetStatusId
                      

                       select new RequestModel
                       {
                           AssetRequestId = ar.Id,
                           AssetTypeId = at.Id,
                           AssetTypeName = at.Name,
                           ARNumber = ar.ARNumber,
                           Quantity = ar.Quantity,
                           IsActive = ar.IsActive,
                           LocationId = arloc.Id,
                           LocationName = arloc.Name,
                           AssetStatusId = ast.Id,
                           AssetStatusName = ast.Name,
                           CreatedOn = ar.CreatedOn,
                           CreatedBy = ar.CreatedBy,
                           EmployeeName = e.FirstName + " " + e.LastName,
                           AssetCategoryId = ac.Id,
                           AssetCategoryName = ac.Name,
                           QuotationCount = db.AssetQuotations.Where(x => x.AssetRequestId == ar.Id && x.IsActive == true).Count()

                       }).ToList();

            return qry;
        }

     

        [HttpGet]
        [Route("GetApprovalRaiseRequest")]
        public IList<RequestModel> GetApprovalRaiseRequest()
        {
            var qry = (from ar in db.AssetRequests
                       join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                       join lt in db.AssetLocations on ar.LocationId equals lt.Id
                       join ast in db.AssetStatus on ar.AssetStatusId equals ast.Id
                       join ac in db.AssetCategories on at.AssetCategoryId equals ac.Id
                       select new RequestModel
                       {
                           AssetRequestId = ar.Id,
                           AssetTypeId = at.Id,
                           AssetTypeName = at.Name,
                           IsActive = ar.IsActive,
                           LocationId = lt.Id,
                           LocationName = lt.Name,
                           AssetStatusId = ast.Id,
                           AssetStatusName = ast.Name,
                           CreatedOn = ar.CreatedOn,
                           CreatedBy = ar.CreatedBy,
                           AssetCategoryId = ac.Id,
                           AssetCategoryName = ac.Name
                       }).ToList();

            return qry;
        }

    }
}
