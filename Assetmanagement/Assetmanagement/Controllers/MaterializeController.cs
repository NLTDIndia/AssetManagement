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
        [HttpPut]
        [Route("UpdateMaterializePo")]
        // post: Materialize
        public IHttpActionResult UpdateMaterializePo(int AssetRequestId)
        {

            string rtnMsg = string.Empty;
            string AssetStatus = "Materialized";
            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();
            AssetRequest assetRequest = (from x in db.AssetRequests
                                         where x.Id == AssetRequestId
                                         select x).Single();
                       
            if (assetRequest != null)
            {
               

                var orderedAssetCount = assetRequest.Quantity;
                var purchaseOrderDate = assetRequest.PONumber;
                var splitDate = purchaseOrderDate.Split('_');
                var purchaseOrderON ="";
                if (splitDate.Length >0)
                {
                     purchaseOrderON = splitDate[2];
                }
                assetRequest.AssetStatusId = dbAssetStatusId;
                assetRequest.LastModifiedOn = System.DateTime.Now;
                try
                {
                    db.SaveChanges();
                    rtnMsg = "Updated";
                    var assetTypesec = db.AssetTypeSpecifications.Where(assetspec => assetspec.AssetTypeId == assetRequest.AssetTypeId).ToList();



                    for (int i = 1; i <= orderedAssetCount; i++)
                    {
                        var assetCreationModel = new AssetCreationModel();

                        List<AssetRequestSpecModel> requestSpecModels = new List<AssetRequestSpecModel>();

                        foreach (var assetSpec in assetTypesec)
                        {
                            AssetRequestSpecModel assetRequestSpecModel = new AssetRequestSpecModel()
                            {

                                AssetRequestId = assetRequest.Id,
                                AssetTypeSpectId = assetSpec.Id,

                            };
                            requestSpecModels.Add(assetRequestSpecModel);
                        }
                        assetCreationModel.AssetTypeId = assetRequest.AssetTypeId;
                        assetCreationModel.ActivationDate = DateTime.Now;
                        assetCreationModel.PurchaseOrderOn = Convert.ToDateTime(purchaseOrderON);
                        assetCreationModel.AssetSpec = requestSpecModels;
                        var assetManagement = new AssetmanagementController();
                        assetManagement.InsertAssetDetails(assetCreationModel);

                    }
                    
                }
                catch (DbUpdateConcurrencyException)
                {
                    throw;
                }
            }
            return Ok(rtnMsg);
        }

    }
}   