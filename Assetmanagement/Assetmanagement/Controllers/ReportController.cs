using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web.Http;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class ReportController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();


        [HttpGet]
        [Route("Report/PendingAssets")]
        public IHttpActionResult PendingAssetsDetail()
        {
            var pendingAssets = (from pa in db.Vw_PendingAssets
                                 select new PendingAssetsModel
                                 {
                                     PORaisedOn = pa.CreatedOn,
                                     PONumber = pa.PONumber,
                                     AssetType = pa.Name,
                                     Quantity = pa.Quantity.ToString(),
                                     VendorName = pa.VendorName,
                                     VendorMobileNumber = pa.MobileNo,
                                     VendorLandLineNumber = pa.LandLineNo,
                                     Email = pa.Email,
                                     TotalPrice = pa.Price.ToString(),
                                     RequestRaisedBy = pa.RaisedBy,
                                     OrderedforLocation = pa.LocationName,
                                 }).AsQueryable();
            return Ok(pendingAssets);
        }

        [HttpGet]
        [Route("Report/UnallocatedAssets")]
        public IHttpActionResult UnallocatedAssetsDetail()
        {
            var unallocatedAssets = (from pa in db.Vw_UnallocatedAssets
                                     select new UnAllocatedAssetsModel
                                     {
                                         AssetTypeName = pa.Name,
                                         RequestedFor = pa.RequestedFor,
                                         RequestedBy = pa.RequestedBy,
                                         AssetTagNumber = pa.AssetTagNumber,
                                         LocationName = pa.LocationName
                                     }).AsQueryable();
            return Ok(unallocatedAssets);
        }
    }
}
