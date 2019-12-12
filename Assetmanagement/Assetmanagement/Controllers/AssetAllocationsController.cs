using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class AssetAllocationsController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        // GET api/AssetAllocation
        
        [Route("GetAssets")]

        public IQueryable<AvailableAssets> GetAssets()
        {
            try
            {
                var availableAssets = (from aast in db.Vw_Assets
                                       join at in db.AssetTypes on aast.AssetTypeId equals at.Id
                                       join ac in db.AssetCategories on at.AssetCategoryId equals ac.Id
                                       join aa in db.AssetAllocations.Where(x=>x.AssetCanceledOn == null) on aast.AssetId equals aa.AssetId into a
                                       from b in a.DefaultIfEmpty()
                                       where b == null || (b.AssetAllocatedOn !=null && b.AssetCanceledOn != null)
                                       select new AvailableAssets
                                      {
                                          AssetCategoryName = ac.Name,
                                          AssetTypeName = at.Name,
                                          AssetTagNumber = aast.AssetTagNumber,
                                          AssetId = aast.AssetId,                                         
                                          
                                      }).AsQueryable();

                return availableAssets.Distinct();
            }
            catch (Exception)
            {
                throw;
            }
        }
       
        [HttpGet]
        [Route("GetAssetSpecification")]

        public IQueryable<AssetSpecificationsModel> GetAssetSpecification(int AssetId)
        {
            var assetSpecifications = (from at in db.AssetTypes
                                       join ats in db.AssetTypeSpecifications on at.Id equals ats.AssetTypeId
                                       join ass in db.AssetSpecifications on ats.Id equals ass.AssetTypeSpecId
                                       join ast in db.Assets on ass.AssetId equals ast.AssetId
                                       where ass.AssetId == AssetId
                                       select new AssetSpecificationsModel
                                       {
                                           AssetTagNumber = ast.AssetTagNumber,
                                           AssetName = at.Name,
                                           AssetSpecificationValue = ass.AssetTypeSpecValue,
                                           CreatedOn = ass.CreatedOn,
                                           AssetTypeSpecificationName = ats.Name
                                       }).AsQueryable();
            return assetSpecifications;
        }

        private bool AssetAllocationExists(int id)
        {
            return db.AssetAllocations.Count(e => e.AssetAllocationId == id) > 0;
        }


        [HttpDelete]
        [Route("UpdateAssetAllocationDetails")]
        public IHttpActionResult UpdateAssetAllocationDetails(int AssetAllocationId, int LastModifiedBy, string Comments)
        {
            AssetAllocation assetAllocation = new AssetAllocation();
            assetAllocation = (from x in db.AssetAllocations
                               where x.AssetAllocationId == AssetAllocationId
                               select x).SingleOrDefault();

            if (AssetAllocationId != assetAllocation.AssetAllocationId)
            {
                return BadRequest();
            }
            assetAllocation.LastModifiedBy = LastModifiedBy;
            assetAllocation.LastModifiedOn = System.DateTime.Now;
            assetAllocation.AssetCanceledOn = System.DateTime.Now;
            assetAllocation.CancellationComments = Comments;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetAllocationExists(AssetAllocationId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return StatusCode(HttpStatusCode.NoContent);
        }
        [HttpDelete]
        [Route("DeleteAssetAllocationDetailsById")]
        public IHttpActionResult DeleteAssetAllocationDetailsById(int id, int LastModifiedBy, string Comments)
        {
            long AssetAllocId = 0;
            AssetAllocation objAssetAllocation = db.AssetAllocations.Find(id);
            if (objAssetAllocation == null)
            {
                return NotFound();
            }
            AssetAllocId = objAssetAllocation.AssetAllocationId;
            var qry = db.AssetAllocations.Where(x => x.AssetAllocationId == AssetAllocId).ToList();
            qry.ForEach(e => e.AssetCanceledOn = System.DateTime.Now);
            qry.ForEach(y => y.LastModifiedBy = LastModifiedBy);
            qry.ForEach(y => y.LastModifiedOn = System.DateTime.Now);
            qry.ForEach(z => z.CancellationComments = Comments);
            db.Entry(objAssetAllocation).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetAllocationExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return Ok("Updated");
        }


        [Route("GetAllocatedAssets")]
        public IQueryable<AllocatedAssetsModel> GetAllocatedAssets()
        {
            try
            {
                var allocatedAssets = (from aa in db.AssetAllocations 
                                         join aast in db.Vw_Assets on aa.AssetId equals aast.AssetId
                                         //join ar in db.AssetRequests on aast.AssetRequestId equals ar.Id
                                         join at in db.AssetTypes on aast.AssetTypeId equals at.Id
                                         join ac in db.AssetCategories on at.AssetCategoryId equals ac.Id                                       
                                         join e in db.Employees on aa.EmployeeId equals e.UserId                                        
                                         join loc in db.AssetLocations on aa.LocationId equals loc.Id
                                         where aa.AssetAllocatedOn!=null && aa.AssetCanceledOn==null                                     
                                         select new AllocatedAssetsModel
                                         {
                                             AssetCategoryName = ac.Name,
                                             AssetTypeName = at.Name,
                                             AssetId = aa.AssetId,
                                             AssetAllocationId = aa.AssetAllocationId,
                                             AssetTagNumber = aast.AssetTagNumber,
                                             ServiceTagNumber = aast.ServiceTagNumber,
                                             EmployeeName = e.FirstName + " " + e.LastName,
                                             LocationName = loc.Name
                                         }).AsQueryable();

                return allocatedAssets;
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpPost]
        [Route("InsertAssetAllocations")]
        public IHttpActionResult InsertAssetAllocations(AvailableAssetsModel assetAllocationArray)
        {
            string rtnMsg = string.Empty;
            try
            {
                if (assetAllocationArray.AssetAllocationArray.Count > 0 && assetAllocationArray.AssetId > 0)
                {

                    AssetAllocation assetAllocation = new AssetAllocation();
                    assetAllocation.AssetId = assetAllocationArray.AssetId;
                    assetAllocation.LocationId = assetAllocationArray.AssetAllocationArray.FirstOrDefault().LocationId;
                    assetAllocation.EmployeeId = assetAllocationArray.AssetAllocationArray.FirstOrDefault().EmployeeId;
                    assetAllocation.AssetAllocatedOn = System.DateTime.Now;
                    assetAllocation.AssetCanceledOn = null;
                    assetAllocation.CreatedOn = System.DateTime.Now;
                    assetAllocation.CreatedBy = assetAllocationArray.CreatedBy;
                    assetAllocation.AllocationComments = assetAllocationArray.AssetAllocationArray.FirstOrDefault().Comments;
                    db.AssetAllocations.Add(assetAllocation);
                    db.SaveChanges();

                    rtnMsg = "Inserted";
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
            return Ok(rtnMsg);
        }
        [HttpPost]
        [Route("UpdateAssetAllocations")]
        public IHttpActionResult UpdateAssetAllocations(AvailableAssetsModel assetAllocationArray)
        {
            string rtnMsg = string.Empty;
            try
            {
                if (assetAllocationArray.AssetAllocationArray.Count > 0 && assetAllocationArray.AssetId > 0)
                {

                    AssetAllocation assetAllocation = db.AssetAllocations.Where(x=>x.AssetId== assetAllocationArray.AssetId).FirstOrDefault();                  
                    assetAllocation.LocationId =assetAllocationArray.AssetAllocationArray.FirstOrDefault().LocationId;
                    assetAllocation.EmployeeId = assetAllocationArray.AssetAllocationArray.FirstOrDefault().EmployeeId;
                    assetAllocation.AssetAllocatedOn = System.DateTime.Now;
                    assetAllocation.AssetCanceledOn = null;
                    assetAllocation.CreatedOn = System.DateTime.Now;
                    assetAllocation.CreatedBy = assetAllocationArray.CreatedBy;
                    assetAllocation.AllocationComments = assetAllocationArray.AssetAllocationArray.FirstOrDefault().Comments;
                    db.AssetAllocations.Add(assetAllocation);
                    db.Entry(assetAllocation).State = EntityState.Modified;
                    db.SaveChanges();
                    rtnMsg = "Inserted";
                }
            }
          
            catch (Exception ex)
            {
                throw ex;
            }
            return Ok(rtnMsg);
        }


        [HttpGet]
        [Route("GetAssetAllocationByAssetId")]
        public IList<AvailableAssets> GetAssetAllocationByAssetId(long AssetId)
        {
            try
            {
                IList<AvailableAssets> ObjhistoryList = new List<AvailableAssets>();
                AvailableAssets getHistory = new AvailableAssets();
                var dbGetHistory = (from aa in db.AssetAllocations
                                    join a in db.Vw_Assets on aa.AssetId equals a.AssetId
                                    //join ar in db.AssetRequests on a.AssetRequestId equals ar.Id
                                    join ats in db.AssetTypes on a.AssetTypeId equals ats.Id
                                    join ac in db.AssetCategories on ats.AssetCategoryId equals ac.Id
                                    join emp in db.Employees on aa.EmployeeId equals emp.UserId
                                    where aa.AssetId == AssetId
                                    orderby aa.AssetAllocatedOn descending
                                    select new AvailableAssets
                                    {
                                        AssetAllocationId = aa.AssetAllocationId,
                                        AssetId = a.AssetId,
                                        AssetRequestId = a.AssetRequestId,
                                        AssetTypeName = ats.Name,
                                        AssetCategoryName = ac.Name,
                                        EmployeeName = emp.FirstName,
                                        AssetCancelledOn = aa.AssetCanceledOn,
                                        AssetAllocatedOn = aa.AssetAllocatedOn,
                                        AssetTagNumber = a.AssetTagNumber
                                    }).ToList();

                return dbGetHistory;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}

