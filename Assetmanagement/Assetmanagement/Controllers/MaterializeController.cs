using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Http;
using Assetmanagement.Models;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class MaterializeController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();
        [HttpPost]
        [Route("PostMatrerializePO")]
        // post: Materialize
        public IHttpActionResult PostMaterializePo(int AssetRequestId)
        {
            string AssetStatus = "Materialized";
            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();
            AssetRequest assetRequest = (from x in db.AssetRequests
                                         where x.Id == AssetRequestId
                                         select x).Single();

            if (assetRequest != null)
            {
                assetRequest.AssetStatusId = dbAssetStatusId;
                assetRequest.LastModifiedOn = System.DateTime.Now;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    throw;
                }
            }
            return Ok();
        }

    }
}   