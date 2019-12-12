using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class AssetTypeSpecificationController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        // GET api/AssetType
        public IQueryable<AssetTypeSpecificationModel> GetAssetTypeSpecification()
        {
            var qry = (from ats in db.AssetTypeSpecifications
                       join at in db.AssetTypes on ats.AssetTypeId equals at.Id
                       select new AssetTypeSpecificationModel
                       {
                           AssetTypeSpecificationId = ats.Id,
                           AssetTypeId = at.Id,
                           Name = ats.Name,
                           AssetTypeName = at.Name,
                           ValueType = ats.ValueType,
                           isActive = at.IsActive
                       }).ToList();

            IList<AssetTypeSpecificationModel> assetTypeSepecificationModel = new List<AssetTypeSpecificationModel>();
            assetTypeSepecificationModel = qry;
            return assetTypeSepecificationModel.AsQueryable();
        }

        // POST api/AssetType
        [ResponseType(typeof(AssetType))]
        public IHttpActionResult PostAssetTypeSpecification(AssetTypeSpecification assetTypeSpecification)
        {
            assetTypeSpecification.CreatedBy = assetTypeSpecification.CreatedBy;
            assetTypeSpecification.CreatedOn = System.DateTime.Now;            
            db.AssetTypeSpecifications.Add(assetTypeSpecification);
            db.SaveChanges();
            string tt = "save";
            return Ok(tt);
        }

        // DELETE api/AssetType/5
        [ResponseType(typeof(AssetTypeSpecification))]
        public IHttpActionResult DeleteAssetTypeSpecification(int id, int LastModifiedBy)
        {
            AssetTypeSpecification objAssetTypeSpecification = db.AssetTypeSpecifications.Find(id);
            if (objAssetTypeSpecification == null)
            {
                return NotFound();
            }
            objAssetTypeSpecification.IsActive = false;
            objAssetTypeSpecification.LastModifiedOn = System.DateTime.Now;         
            objAssetTypeSpecification.LastModifiedBy = LastModifiedBy;         
            db.Entry(objAssetTypeSpecification).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetTypeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return Ok(objAssetTypeSpecification);
        }

        // PUT api/AssetType/5
        public IHttpActionResult PutAssetTypeSpecification(int id, AssetTypeSpecification assetTypeSpecification, int LastModifiedBy)
        {

            if (id != assetTypeSpecification.Id)
            {
                return BadRequest();
            }

            assetTypeSpecification.LastModifiedOn = System.DateTime.Now;           
            assetTypeSpecification.LastModifiedBy = LastModifiedBy;            
            db.Entry(assetTypeSpecification).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetTypeExists(id))
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

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AssetTypeExists(int id)
        {
            return db.AssetTypes.Count(e => e.Id == id) > 0;
        }

        //-----------------------

    }
}
