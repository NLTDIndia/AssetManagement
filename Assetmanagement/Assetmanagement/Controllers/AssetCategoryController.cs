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
using Assetmanagement.Models;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class AssetCategoryController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();
        // POST api/AssetCategory
        [ResponseType(typeof(AssetCategory))]
        public IHttpActionResult PostAssetCategory(AssetCategory assetCategory)
        {
            assetCategory.CreatedBy = assetCategory.CreatedBy;
            assetCategory.CreatedOn = System.DateTime.Now;         
            assetCategory.IsActive = true;
            db.AssetCategories.Add(assetCategory);
            db.SaveChanges();
            string tt = "save";
            return Ok(tt);
        }

        // DELETE api/AssetCategory/5
        [ResponseType(typeof(AssetCategory))]
        public IHttpActionResult DeleteAssetCategory(int id)
        {
            AssetCategory objAssetCategory = db.AssetCategories.Find(id);
            if (objAssetCategory == null)
            {
                return NotFound();
            }

            db.AssetCategories.Remove(objAssetCategory);
            db.SaveChanges();

            return Ok(objAssetCategory);
        }

        // PUT api/AssetCategory/5
        public IHttpActionResult PutAssetCategory(int id, AssetCategory assetCategory, int LastModifiedBy)
        {

            if (id != assetCategory.Id)
            {
                return BadRequest();
            }

            assetCategory.LastModifiedOn = System.DateTime.Now;           
            assetCategory.LastModifiedBy = LastModifiedBy;         
            db.Entry(assetCategory).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetCategoryExists(id))
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

        private bool AssetCategoryExists(int id)
        {
            return db.AssetCategories.Count(e => e.Id == id) > 0;
        }
    }
}

