using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Routing.Constraints;
using AssetManagementModel.Models;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class AssetmanagementController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        #region Asset Location

        /// <summary>
        /// Get All Location Details
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetLocationDetails")]
        public IList<AssetLocationModel> GetLocationDetails()
        {
            try
            {
                IList<AssetLocationModel> ObjassetLocationModelList = new List<AssetLocationModel>();
                AssetLocationModel assetLocationModel = new AssetLocationModel();
                var dbAssetLocationModel = (from loc in db.AssetLocations
                    where loc.IsActive == true
                    select new AssetLocationModel
                    {
                        Id = loc.Id,
                        Name = loc.Name,
                        Address = loc.Address
                    }).ToList();
                ObjassetLocationModelList = dbAssetLocationModel;
                return ObjassetLocationModelList;
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Insert Location Details
        /// </summary>
        /// <param name="location"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("InsertLocationDetails")]
        public IHttpActionResult InsertLocationDetails(AssetLocationModel location)
        {
            string rtnMsg = string.Empty;
            try
            {
                AssetLocation assetLocation = new AssetLocation();
                assetLocation.Name = location.Name;
                assetLocation.Address = location.Address;
                assetLocation.IsActive = true;
                assetLocation.CreatedBy = location.CreatedBy;
                assetLocation.CreatedOn = System.DateTime.Now;
                db.AssetLocations.Add(assetLocation);
                db.SaveChanges();
                rtnMsg = "save";
            }
            catch (Exception)
            {
                throw;
            }

            return Ok(rtnMsg);
        }

        /// <summary>
        /// Update Location Details By Id
        /// </summary>
        /// <param name="AssetLocationId"></param>
        /// <param name="location"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("UpdateLocationDetails")]
        public IHttpActionResult UpdateLocationDetails(int AssetLocationId, AssetLocationModel location,
            int LastModifiedBy)
        {
            AssetLocation assetLocation = (from x in db.AssetLocations
                where x.Id == AssetLocationId
                select x).Single();
            if (assetLocation != null)
            {
                assetLocation.Name = location.Name;
                assetLocation.Address = location.Address;
                assetLocation.LastModifiedOn = System.DateTime.Now;
                assetLocation.LastModifiedBy = LastModifiedBy;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!LocationExists(AssetLocationId))
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
            else
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
        }

        /// <summary>
        /// Delete Location Details By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("DeleteLocationDetailsById")]
        public IHttpActionResult DeleteLocationDetailsById(int id, int LastModifiedBy)
        {
            AssetLocation assetLocation = db.AssetLocations.Find(id);
            if (assetLocation == null)
            {
                return NotFound();
            }

            assetLocation.IsActive = false;
            assetLocation.LastModifiedOn = System.DateTime.Now;
            assetLocation.LastModifiedBy = LastModifiedBy;
            db.Entry(assetLocation).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LocationExists(id))
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

        private bool LocationExists(int id)
        {
            return db.AssetLocations.Count(e => e.Id == id) > 0;
        }

        #endregion

        #region Asset Categories

        [HttpGet]
        [Route("GetCategoryDetails")]
        public IList<AssetCategoryModel> GetCategoryDetails()
        {
            try
            {
                IList<AssetCategoryModel> ObjassetCategoryList = new List<AssetCategoryModel>();
                AssetCategoryModel assetCategoryModel = new AssetCategoryModel();
                var dbAssetCategoryModel = (from ac in db.AssetCategories
                    where ac.IsActive == true
                    select new AssetCategoryModel
                    {
                        Id = ac.Id,
                        Name = ac.Name,
                    }).ToList();
                ObjassetCategoryList = dbAssetCategoryModel;
                return ObjassetCategoryList;
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost]
        [Route("InsertAssetCategoryDetails")]
        public IHttpActionResult InsertAssetCategoryDetails(AssetCategoryModel categoryModel)
        {
            string rtnMsg = string.Empty;
            try
            {
                AssetCategory assetCategory = new AssetCategory();
                assetCategory.Name = categoryModel.Name;
                assetCategory.IsActive = true;
                assetCategory.CreatedBy = categoryModel.CreatedBy;
                assetCategory.CreatedOn = System.DateTime.Now;
                db.AssetCategories.Add(assetCategory);
                db.SaveChanges();
                rtnMsg = "Saved";
            }
            catch (Exception)
            {
                throw;
            }

            return Ok(rtnMsg);
        }

        [HttpPut]
        [Route("UpdateAssetCategoryDetails")]
        public IHttpActionResult UpdateAssetCategoryDetails(int AssetCategoryId, AssetCategoryModel categoryModel,
            int LastModifiedBy)
        {
            AssetCategory assetCategory = (from x in db.AssetCategories
                where x.Id == AssetCategoryId
                select x).Single();
            if (assetCategory != null)
            {
                assetCategory.Name = categoryModel.Name;
                assetCategory.LastModifiedOn = System.DateTime.Now;
                assetCategory.LastModifiedBy = LastModifiedBy;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AssetCategoryExists(AssetCategoryId))
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
            else
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
        }

        [HttpDelete]
        [Route("DeleteAssetCategoryDetailsById")]
        public IHttpActionResult DeleteAssetCategoryDetailsById(int id, int LastModifiedBy)
        {
            AssetCategory assetCategory = db.AssetCategories.Find(id);
            if (assetCategory == null)
            {
                return NotFound();
            }

            assetCategory.IsActive = false;
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

            return Ok("Updated");
        }

        [HttpGet]
        [Route("GetAwaitingQuotationApprovalList")]
        public IList<RequestModel> GetAwaitingQuotationApprovalList()
        {
            string AssetStatus = "Awaiting Quotation Approval";

            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id)
                .FirstOrDefault();

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
                    ARNumber = ar.ARNumber,
                    AssetTypeName = at.Name,
                    IsActive = ar.IsActive,
                    LocationId = arloc.Id,
                    LocationName = arloc.Name,
                    AssetStatusId = ast.Id,
                    AssetStatusName = ast.Name,
                    CreatedOn = ar.CreatedOn,
                    CreatedBy = ar.CreatedBy,
                    EmployeeName = e.FirstName + " " + e.LastName
                }).ToList();

            return qry;
        }

        private bool AssetCategoryExists(int id)
        {
            return db.AssetCategories.Count(e => e.Id == id) > 0;
        }

        #endregion

        #region Asset Types

        [HttpGet]
        [Route("GetAssetTypeDetails")]
        public IQueryable<AssetTypeModel> GetAssetTypeDetails()
        {
            var qry = (from at in db.AssetTypes
                join ac in db.AssetCategories on at.AssetCategoryId equals ac.Id
                where ac.IsActive == true && at.IsActive == true
                select new AssetTypeModel
                {
                    AssetTypeId = at.Id,
                    Name = at.Name,
                    AssetCategoryId = ac.Id,
                    AssetCategoryName = ac.Name,
                    isActive = at.IsActive,
                    AddonsTypeId = at.AddonsTypeId
                }).ToList();

            IList<AssetTypeModel> assetTypeModel = new List<AssetTypeModel>();
            assetTypeModel = qry;
            return assetTypeModel.AsQueryable();
        }

        [HttpGet]
        [Route("GetAssetAddonsType")]
        public IQueryable<AssetTypeAddOnsModel> GetAssetAddonsType()
        {
            var qry = (from at in db.AssetTypeAddOns
                select new AssetTypeAddOnsModel
                {
                    Id = at.Id,
                    AddonsName = at.AddonsName,
                }).ToList();

            IList<AssetTypeAddOnsModel> assetTypeAddonsModel = new List<AssetTypeAddOnsModel>();
            assetTypeAddonsModel = qry;
            return assetTypeAddonsModel.AsQueryable();
        }

        [HttpPost]
        [Route("InsertAssetTypeDetails")]
        public IHttpActionResult InsertAssetTypeDetails(AssetTypeModel assetType)
        {
            Int64 newAssetTypeId = 0;
            string retMsg = string.Empty;
            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        AssetType oassetType = new AssetType();
                        oassetType.Name = assetType.Name;
                        oassetType.AssetCategoryId = assetType.AssetCategoryId;
                        oassetType.IsActive = true;
                        oassetType.AddonsTypeId = assetType.AddonsTypeId;
                        oassetType.CreatedBy = assetType.CreatedBy;
                        oassetType.CreatedOn = System.DateTime.Now;
                        context.AssetTypes.Add(oassetType);
                        context.SaveChanges();
                        newAssetTypeId = oassetType.Id;
                        if (assetType.SpecificationArray.Count > 0)
                        {
                            foreach (var item in assetType.SpecificationArray)
                            {
                                AssetTypeSpecification assetTypeSpecification = new AssetTypeSpecification();
                                assetTypeSpecification.AssetTypeId = newAssetTypeId;
                                assetTypeSpecification.Name = item.Name;
                                assetTypeSpecification.IsActive = true;
                                assetTypeSpecification.ValueType = item.ValueType;
                                assetTypeSpecification.CreatedBy = assetType.CreatedBy;
                                assetTypeSpecification.CreatedOn = System.DateTime.Now;
                                context.AssetTypeSpecifications.Add(assetTypeSpecification);
                                context.SaveChanges();
                            }

                            retMsg = "Saved";
                        }

                        dbContextTransaction.Commit();
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }
                }
            }

            return Ok(retMsg);
        }

        [HttpPut]
        [Route("UpdateAssetTypeDetails")]
        public IHttpActionResult UpdateAssetTypeDetails(int AssetTypeId, AssetType assetType, int LastModifiedBy)
        {
            if (AssetTypeId != assetType.Id)
            {
                return BadRequest();
            }

            assetType.LastModifiedOn = System.DateTime.Now;
            assetType.LastModifiedBy = LastModifiedBy;
            db.Entry(assetType).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetTypeExists(AssetTypeId))
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
        [Route("DeleteAssetTypeDetailsById")]
        public IHttpActionResult DeleteAssetTypeDetailsById(int id, int LastModifiedBy)
        {
            long AssetTypeSpecifictionId = 0;
            AssetType objAssetType = db.AssetTypes.Find(id);
            if (objAssetType == null)
            {
                return NotFound();
            }

            AssetTypeSpecifictionId = objAssetType.Id;
            var qry = db.AssetTypeSpecifications.Where(x => x.AssetTypeId == AssetTypeSpecifictionId).ToList();

            qry.ForEach(e => e.IsActive = false && e.LastModifiedOn == System.DateTime.Now);
            objAssetType.IsActive = false;
            objAssetType.LastModifiedOn = System.DateTime.Now;
            objAssetType.LastModifiedBy = LastModifiedBy;
            db.Entry(objAssetType).State = EntityState.Modified;
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

            return Ok("Updated");
        }

        private bool AssetTypeExists(int id)
        {
            return db.AssetTypes.Count(e => e.Id == id) > 0;
        }

        #endregion

        #region RaisePO


        [HttpGet]
        [Route("GetRaiseRequestDetails")]
        public IQueryable<RaisePOModel> GetRaiseRequestDetails()
        {

            var qry = (from ar in db.AssetRequests
                join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                join e in db.Employees on ar.CreatedBy equals e.UserId
                where ar.IsActive == true && at.IsActive == true && ar.AssetStatusId == 1
                select new RaisePOModel
                {
                    AssetRequestId = ar.Id,
                    AssetTypeId = at.Id,
                    AssetTypeName = at.Name,
                    EmployeeName = e.FirstName + " " + e.LastName,
                }).ToList();

            IList<RaisePOModel> raisePOModel = new List<RaisePOModel>();
            raisePOModel = qry;
            return raisePOModel.AsQueryable();
        }

        [HttpPost]
        [Route("InsertRaiseRequestDetails")]
        public IHttpActionResult InsertRaiseRequestDetails(AssetRaiseRequestModel assetRaiseRequestModel)
        {
            Int64 newAssetRequestId = 0;
            long dbAssetStatusId = 0;
            string AssetStatus = string.Empty;
            string sdate = string.Empty;
            string retMsg = string.Empty;

            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        sdate = DateTime.Now.ToShortDateString().Replace(@"-", "");
                        if (assetRaiseRequestModel.Options == "NEW")
                        {
                            AssetStatus = "NEW";
                        }
                        else
                        {
                            AssetStatus = "Quotation In Progress";
                        }


                        dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper())
                            .Select(x => x.Id).FirstOrDefault();

                        string ARNumber = string.Empty;
                        var dtd = System.DateTime.Now.ToShortDateString();

                        long dbMaxAssetRequestId = db.AssetRequests.Where(a => a.ARNumber != null).Count();
                        dbMaxAssetRequestId = dbMaxAssetRequestId + 1;
                        ARNumber = "AR_" + dbMaxAssetRequestId + "_" + sdate;

                        AssetRequest assetRequest = new AssetRequest();

                        assetRequest.AssetTypeId = assetRaiseRequestModel.AssetTypeId;
                        if (assetRaiseRequestModel.AssetLocationId > 0)
                        {
                            assetRequest.LocationId = assetRaiseRequestModel.AssetLocationId;
                        }

                        assetRequest.Quantity = assetRaiseRequestModel.Quantity;
                        assetRequest.Comments = assetRaiseRequestModel.Comments;
                        assetRequest.ARNumber = ARNumber;
                        assetRequest.AssetStatusId = dbAssetStatusId;
                        assetRequest.IsActive = true;
                        assetRequest.CreatedBy = assetRaiseRequestModel.CreatedBy;
                        assetRequest.CreatedOn = System.DateTime.Now;
                        context.AssetRequests.Add(assetRequest);
                        context.SaveChanges();
                        newAssetRequestId = assetRequest.Id;
                        if (assetRaiseRequestModel.AssetRequestSpec.Count() > 0)
                        {
                            foreach (var itms in assetRaiseRequestModel.AssetRequestSpec)
                            {
                                AssetRequestSpecification assetRequestSpecification = new AssetRequestSpecification();
                                assetRequestSpecification.AssetRequestId = newAssetRequestId;
                                assetRequestSpecification.AssetTypeSpecId = itms.AssetTypeSpectId;
                                assetRequestSpecification.AssetTypeSpecValue = itms.AssetTypeSpecValue;
                                assetRequestSpecification.CreatedBy = itms.CreatedBy;
                                assetRequestSpecification.CreatedOn = System.DateTime.Now;
                                context.AssetRequestSpecifications.Add(assetRequestSpecification);
                                context.SaveChanges();
                            }
                        }

                        AssetHistory assetHistory = new AssetHistory();
                        assetHistory.AssetRequestId = newAssetRequestId;
                        assetHistory.TargetStatusId = dbAssetStatusId;
                        assetHistory.StatusChangedBy = assetRaiseRequestModel.CreatedBy;
                        assetHistory.StatusModifiedOn = System.DateTime.Now;
                        assetHistory.Comments = assetRaiseRequestModel.Comments;
                        context.AssetHistories.Add(assetHistory);
                        context.SaveChanges();
                        dbContextTransaction.Commit();
                        retMsg = "Updated";
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }
                }
            }

            return Ok(retMsg);
        }

        [HttpDelete]
        [Route("DeleteRaiseRequestById")]
        public IHttpActionResult DeleteRaiseRequestById(int id, int LastModifiedBy)
        {
            AssetRequest assetRequest = db.AssetRequests.Find(id);
            if (assetRequest == null)
            {
                return NotFound();
            }

            assetRequest.IsActive = false;
            assetRequest.LastModifiedBy = LastModifiedBy;
            assetRequest.LastModifiedOn = System.DateTime.Now;
            db.Entry(assetRequest).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LocationExists(id))
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

        [HttpPost]
        [Route("SendRaiseRequest")]
        public IHttpActionResult SendRaiseRequest(int id, int LastModifiedBy)
        {
            string AssetStatus = "Quotation In Progress";
            string ARNumber = string.Empty;
            long dbAssetRequestId =
                db.AssetRequests.Where(a => a.ARNumber == ARNumber).Select(c => c.Id).FirstOrDefault();
            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id)
                .FirstOrDefault();
            AssetRequest assetRequest = db.AssetRequests.Find(id);
            if (assetRequest == null)
            {
                return NotFound();
            }

            assetRequest.AssetStatusId = dbAssetStatusId;
            assetRequest.LastModifiedOn = System.DateTime.Now;
            assetRequest.LastModifiedBy = LastModifiedBy;
            db.Entry(assetRequest).State = EntityState.Modified;

            //AssetHistory assetHistory = new AssetHistory();
            //assetHistory.AssetRequestId = dbAssetRequestId;
            //assetHistory.TargetStatusId = dbAssetStatusId;
            //assetHistory.StatusChangedBy = LastModifiedBy;
            //assetHistory.StatusModifiedOn = System.DateTime.Now;

            //db.AssetHistories.Add(assetHistory);
            db.SaveChanges();
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetRequestExists(id))
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

        [HttpGet]
        [Route("GetRaisePODetails")]
        public IQueryable<RaisPODetailModel> GetRaisePODetails(long AssetRequestId)
        {
            RaisPODetailModel objraisPODetailModel = new RaisPODetailModel();

            IList<RaisPODetailModel> raisePODetailsModel = new List<RaisPODetailModel>();
            try
            {
                var qry = (from ars in db.AssetRequestSpecifications
                    join ats in db.AssetTypeSpecifications on ars.AssetTypeSpecId equals ats.Id
                    join aq in db.AssetQuotations on ars.AssetRequestId equals aq.AssetRequestId
                    join ar in db.AssetRequests on ars.AssetRequestId equals ar.Id
                    join at in db.AssetTypes on ats.AssetTypeId equals at.Id
                    join aqp in db.AssetQuoteApprovals on aq.Id equals aqp.AssetQuotationId
                    //join pd in db.AssetRequestPayments on ar.Id equals pd.AssetRequestId
                    //join pm in db.AssetPaymentModes on pd.PaymentModeId equals pm.Id
                    where ar.Id == AssetRequestId && aqp.IsAwaitingNextApproval == false && ats.IsActive == true
                    select new RaisPODetailModel
                    {
                        PONumber = ar.PONumber,
                        AssetTypeName = at.Name,
                        SpecificationName = ats.Name,
                        Description = ats.Name + " -  " + ars.AssetTypeSpecValue,
                        AssetTypeSpecValue = ars.AssetTypeSpecValue,
                        Quantity = aq.Quantity,
                        Price = aq.Price,
                        CGST = aq.CGST,
                        SGST = aq.SGST,
                        TotalPrice = aq.Price + aq.CGST + aq.SGST,
                        //ChequeNumber = pd.ChequeNo,
                        //CreditcardNumber = pd.CreditCardNo,
                        //TransactionID = pd.DC_TransactionIdentifier

                    }).ToList();

                if (qry.Count > 0)
                {

                    foreach (var itms in qry)
                    {
                        objraisPODetailModel = new RaisPODetailModel();
                        objraisPODetailModel.PONumber = itms.PONumber;
                        objraisPODetailModel.AssetTypeName = itms.AssetTypeName;
                        objraisPODetailModel.SpecificationName = itms.SpecificationName;
                        objraisPODetailModel.Description = itms.Description;
                        objraisPODetailModel.AssetTypeSpecValue = itms.AssetTypeSpecValue;
                        objraisPODetailModel.Quantity = itms.Quantity;
                        objraisPODetailModel.Price = itms.Price;
                        objraisPODetailModel.CGST = itms.CGST;
                        objraisPODetailModel.SGST = itms.SGST;
                        objraisPODetailModel.TotalPrice = itms.TotalPrice;
                        objraisPODetailModel.ChequeNumber = itms.ChequeNumber;
                        objraisPODetailModel.CreditcardNumber = itms.CreditcardNumber;
                        objraisPODetailModel.TransactionID = itms.TransactionID;
                        raisePODetailsModel.Add(objraisPODetailModel);
                    }

                    var qr1 = (from aos in db.AssetTypeOtherSpecifications
                        where aos.AssetRequestId == AssetRequestId
                        select new
                        {
                            OtherSpecification = aos.OtherSpecification
                        }).FirstOrDefault();

                    if (qr1 != null)
                    {
                        if (qr1.OtherSpecification != "")
                        {
                            objraisPODetailModel = new RaisPODetailModel();
                            objraisPODetailModel.PONumber = "";
                            objraisPODetailModel.AssetTypeName = "";
                            objraisPODetailModel.SpecificationName = "";
                            objraisPODetailModel.Description = qr1.OtherSpecification;
                            objraisPODetailModel.AssetTypeSpecValue = "";
                            objraisPODetailModel.Quantity = 0;
                            objraisPODetailModel.Price = 0;
                            objraisPODetailModel.CGST = 0;
                            objraisPODetailModel.SGST = 0;
                            objraisPODetailModel.TotalPrice = 0;
                            objraisPODetailModel.ChequeNumber = "";
                            objraisPODetailModel.CreditcardNumber = "";
                            objraisPODetailModel.TransactionID = "";
                            raisePODetailsModel.Add(objraisPODetailModel);
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw;
            }

            return raisePODetailsModel.AsQueryable();
        }

        #endregion

        #region Create New Asset

        [HttpPost]
        [Route("InsertAssetDetails")]
        public IHttpActionResult InsertAssetDetails(AssetCreationModel assetCreationModel)
        {
            string retMsg = string.Empty;

            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        long dbMaxAssetTagId = db.Assets.Where(a => a.AssetTagNumber != null).Count();
                        dbMaxAssetTagId = dbMaxAssetTagId + 1;
                        var ATNumber = "Asset_" + dbMaxAssetTagId.ToString("D3");

                        Asset asset = new Asset();

                        asset.AssetTagNumber = ATNumber;
                        asset.Price = assetCreationModel.Price;
                        asset.PurchaseOrderOn = assetCreationModel.PurchaseOrderOn;
                        asset.ServiceTagNumber = assetCreationModel.ServiceTagNumber;
                        asset.AssetIdentifier = assetCreationModel.AssetIdentifier;
                        asset.ActivationDate = assetCreationModel.ActivationDate;
                        asset.ExpiryDate = assetCreationModel.ExpiryDate;
                        asset.CreatedBy = assetCreationModel.CreatedBy;
                        asset.CreatedOn = System.DateTime.Now;
                        asset.IsActive = true;
                        context.Assets.Add(asset);
                        context.SaveChanges();
                        var newAssetId = asset.AssetId;

                        if (assetCreationModel.AssetSpec.Count() > 0)
                        {
                            foreach (var itms in assetCreationModel.AssetSpec)
                            {
                                AssetSpecification assetSpecification = new AssetSpecification();
                                assetSpecification.AssetId = newAssetId;
                                assetSpecification.AssetTypeId = assetCreationModel.AssetTypeId;
                                assetSpecification.AssetTypeSpecId = itms.AssetTypeSpectId;
                                assetSpecification.AssetTypeSpecValue = itms.AssetTypeSpecValue;
                                assetSpecification.CreatedBy = assetCreationModel.CreatedBy;
                                assetSpecification.CreatedOn = System.DateTime.Now;
                                context.AssetSpecifications.Add(assetSpecification);
                                context.SaveChanges();
                            }
                        }

                        dbContextTransaction.Commit();
                        retMsg = "Inserted";
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }
                }
            }

            return Ok(retMsg);
        }

        #endregion

        #region Vendor Details


        [HttpPost()]
        [Route("InsertAssetVendor")]
        public IHttpActionResult InsertAssetVendor(AssetVendorModel vendorModel)
        {
            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        AssetVendor assetVendor = new AssetVendor();
                        assetVendor.Name = vendorModel.Name;
                        assetVendor.AddressLine1 = vendorModel.AddressLine1;
                        assetVendor.AddressLine2 = vendorModel.AddressLine2;
                        assetVendor.Area = vendorModel.Area;
                        assetVendor.City = vendorModel.City;
                        assetVendor.Pincode = vendorModel.Pincode;
                        assetVendor.State = vendorModel.State;
                        assetVendor.MobileNo = vendorModel.MobileNo;
                        assetVendor.Email = vendorModel.Email;
                        assetVendor.ContactPerson = vendorModel.ContactPerson;
                        assetVendor.LandLineNo = vendorModel.LandLineNo;
                        assetVendor.CreatedBy = vendorModel.CreatedBy;
                        assetVendor.CreatedOn = System.DateTime.Now;
                        assetVendor.IsActive = true;
                        context.AssetVendors.Add(assetVendor);
                        context.SaveChanges();

                        dbContextTransaction.Commit();
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }
                }
            }

            string tt = "save";
            return Ok(tt);
        }

        [HttpPut]
        [Route("UpdateAssetVendorDetails")]
        public IHttpActionResult UpdateAssetVendorDetails(int AssetVendorId, AssetVendorModel assetVendorModel,
            int LastModifiedBy)
        {
            AssetVendor assetVendor = (from x in db.AssetVendors
                where x.Id == AssetVendorId
                select x).Single();
            if (assetVendor != null)
            {
                assetVendor.Name = assetVendorModel.Name;
                assetVendor.AddressLine1 = assetVendorModel.AddressLine1;
                assetVendor.AddressLine2 = assetVendorModel.AddressLine2;
                assetVendor.Area = assetVendorModel.Area;
                assetVendor.City = assetVendorModel.City;
                assetVendor.Pincode = assetVendorModel.Pincode;
                assetVendor.State = assetVendorModel.State;
                assetVendor.MobileNo = assetVendorModel.MobileNo;
                assetVendor.ContactPerson = assetVendorModel.ContactPerson;
                assetVendor.Email = assetVendorModel.Email;
                assetVendor.LandLineNo = assetVendorModel.LandLineNo;
                assetVendor.LastModifiedBy = LastModifiedBy;
                assetVendor.LastModifiedOn = System.DateTime.Now;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AssetVendorExists(AssetVendorId))
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
            else
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
        }

        [HttpGet]
        [Route("GetVendorDetails")]
        public IQueryable<AssetVendorModel> GetVendorDetails()
        {
            var qry = (from ar in db.AssetVendors
                where ar.IsActive == true
                select new AssetVendorModel
                {
                    Id = ar.Id,
                    Name = ar.Name,
                    ContactPerson = ar.ContactPerson,
                    AddressLine1 = ar.AddressLine1,
                    AddressLine2 = ar.AddressLine2,
                    City = ar.City,
                    Area = ar.Area,
                    Pincode = ar.Pincode,
                    State = ar.State,
                    MobileNo = ar.MobileNo,
                    Email = ar.Email,
                    LandLineNo = ar.LandLineNo,
                    CreatedOn = ar.CreatedOn,
                    CreatedBy = ar.CreatedBy,
                    LastModifiedBy = ar.LastModifiedBy,
                    LastModifiedOn = ar.LastModifiedOn
                }).ToList();

            IList<AssetVendorModel> assetVendorModel = new List<AssetVendorModel>();
            assetVendorModel = qry;
            return assetVendorModel.AsQueryable();
        }

        private bool AssetVendorExists(int id)
        {
            return db.AssetVendors.Count(e => e.Id == id) > 0;
        }

        [HttpGet]
        [Route("GetVendorDetailsByAssetRequestId")]
        public IQueryable<AssetVendorModel> GetVendorDetailsByAssetRequestId(long assetRequestId)
        {
            var qry = (from ar in db.AssetRequests
                join aq in db.AssetQuotations on ar.Id equals aq.AssetRequestId
                join av in db.AssetVendors on aq.AssetVendorId equals av.Id
                join aqp in db.AssetQuoteApprovals on aq.Id equals aqp.AssetQuotationId
                where aq.AssetRequestId == assetRequestId && aqp.IsAwaitingNextApproval == false
                select new AssetVendorModel
                {
                    Id = ar.Id,
                    Name = av.Name,
                    AddressLine1 = av.AddressLine1,
                    AddressLine2 = av.AddressLine2,
                    City = av.City,
                    Area = av.Area,
                    Pincode = av.Pincode,
                    State = av.State,
                    MobileNo = av.MobileNo,
                    Email = av.Email,
                    ContactPerson = av.ContactPerson,
                    LandLineNo = av.LandLineNo,
                    CreatedOn = ar.CreatedOn,
                    CreatedBy = ar.CreatedBy,
                }).ToList();

            IList<AssetVendorModel> assetVendorModel = new List<AssetVendorModel>();
            assetVendorModel = qry;
            return assetVendorModel.AsQueryable();
        }

        #endregion

        private bool AssetRequestExists(int id)
        {
            return db.AssetRequests.Count(e => e.Id == id) > 0;
        }

        [HttpGet]
        [Route("GetMaterializePO_RaisedPO")]
        public IList<RaisePOModel> GetMaterializePO_RaisedPO()
        {
            string AssetStatus = "Raised PO";
            var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id)
                .FirstOrDefault();


            var qry = (from aqp in db.AssetQuoteApprovals
                join aq in db.AssetQuotations on aqp.AssetQuotationId equals aq.Id
                join ar in db.AssetRequests on aq.AssetRequestId equals ar.Id
                join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                join vt in db.AssetVendors on aq.AssetVendorId equals vt.Id
                join e in db.Employees on ar.CreatedBy equals e.UserId
                join al in db.AssetLocations on ar.LocationId equals al.Id
                where ar.AssetStatusId == dbAssetStatusId && aqp.IsAwaitingNextApproval == false
                select new RaisePOModel
                {
                    PONumber = ar.PONumber,
                    AssetQuotationId = aq.Id,
                    ARNumber = ar.ARNumber,
                    VendorName = vt.Name,
                    AssetRequestId = ar.Id,
                    AssetTypeId = at.Id,
                    AssetTypeName = at.Name,
                    ApprovedBy = aqp.CreatedBy,
                    ApprovedOn = aqp.CreatedOn,
                    EmployeeName = e.FirstName + " " + e.LastName,
                    Location = al.Name
                }).ToList();

            return qry;
        }

        [HttpGet]
        [Route("GetAssetRequestPaymentById")]
        public IList<AssetRequestPaymentsModel> GetAssetRequestPaymentById(long AssetRequestId)
        {
            var qry = (from m in db.AssetRequestPayments
                join ar in db.AssetRequests on m.AssetRequestId equals ar.Id
                join p in db.AssetPaymentModes on m.PaymentModeId equals p.Id
                select new AssetRequestPaymentsModel
                {
                    AssetRequestId = m.AssetRequestId,
                }).ToList();
            return qry;
        }



        [HttpGet]
        [Route("GetEmployeeDetails")]
        public IQueryable<EmployeeModel> GetEmployeeDetails()
        {
            var qry = (from e in db.Employees
                where e.IsActive == true
                select new EmployeeModel
                {
                    eUserId = e.UserId,
                    EmployeeId = e.EmployeeId,
                    FirstName = e.FirstName,
                    LastName = e.LastName
                }).ToList();

            IList<EmployeeModel> employeeModel = new List<EmployeeModel>();
            employeeModel = qry;
            return employeeModel.AsQueryable();
        }

        [HttpGet]
        [Route("GetAssetType")]
        public IQueryable<AssetTypeModel> GetAssetType(int AssetCategoryId = 0)
        {
            var qry = (from at in db.AssetTypes
                join ac in db.AssetCategories on at.AssetCategoryId equals ac.Id
                where at.IsActive == true && ac.IsActive == true
                select new AssetTypeModel
                {
                    AssetTypeId = at.Id,
                    Name = at.Name,
                    AssetCategoryId = ac.Id,
                    AssetCategoryName = ac.Name,
                    isActive = at.IsActive
                }).ToList();

            if (AssetCategoryId != 0)
            {
                qry = qry.Where(q => q.AssetCategoryId == AssetCategoryId).ToList();

            }

            IList<AssetTypeModel> assetTypeModel = new List<AssetTypeModel>();
            assetTypeModel = qry;
            return assetTypeModel.AsQueryable();
        }

        [HttpGet]
        [Route("GetAssetTypeSpec")]
        public IList<AssetTypeSpecificationModels> GetAssetTypeSpec()
        {
            IList<AssetTypeSpecificationModels> objModel = new List<AssetTypeSpecificationModels>();
            AssetTypeSpecificationModels obj = new AssetTypeSpecificationModels();
            var qry = (from ats in db.AssetTypeSpecifications
                select new AssetTypeSpecificationModels
                {
                    AssetTypeSpecId = ats.Id,
                    AssetTypeId = ats.AssetTypeId,
                    AssetTypeName = ats.Name,
                    ValueType = ats.ValueType
                }).ToList();
            foreach (var itms in qry)
            {
                obj.AssetTypeSpecId = itms.AssetTypeSpecId;
                obj.AssetTypeId = itms.AssetTypeId;
                obj.AssetTypeName = itms.AssetTypeName;
                obj.ValueType = itms.ValueType;
                objModel.Add(obj);
                obj = new AssetTypeSpecificationModels();
            }

            return objModel;
        }

        [HttpDelete]
        [Route("DeleteVendorDetailsById")]
        public IHttpActionResult DeleteVendorDetailsById(int id, int LastModifiedBy)
        {
            AssetQuotation assetQuotation = db.AssetQuotations.Find(id);
            if (assetQuotation == null)
            {
                return NotFound();
            }
            //  AssetDocument assetDocument = db.AssetDocuments.Where(X => X.EntityTypeId == id).FirstOrDefault();

            assetQuotation.IsActive = false;
            assetQuotation.LastModifiedOn = System.DateTime.Now;
            assetQuotation.LastModifiedBy = LastModifiedBy;
            //assetDocument.IsActive = false;
            //assetDocument.LastModifiedOn = System.DateTime.Now;
            //assetDocument.LastModifiedBy = assetDocument.LastModifiedBy;
            db.Entry(assetQuotation).State = EntityState.Modified;
            //db.Entry(assetDocument).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuotationExists(id))
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

        private bool QuotationExists(int id)
        {
            return db.AssetQuotations.Count(e => e.Id == id) > 0;
        }

        [HttpDelete]
        [Route("DeleteVendorDetails")]
        public IHttpActionResult DeleteVendorDetails(int id, int LastModifiedBy)
        {
            AssetVendor assetVendor = db.AssetVendors.Find(id);
            if (assetVendor == null)
            {
                return NotFound();
            }

            assetVendor.IsActive = false;
            assetVendor.LastModifiedOn = System.DateTime.Now;
            assetVendor.LastModifiedBy = LastModifiedBy;
            db.Entry(assetVendor).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VendorExists(id))
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

        private bool VendorExists(int id)
        {
            return db.AssetVendors.Count(e => e.Id == id) > 0;
        }

        [HttpPost]
        [Route("InsertAssetRequestPayments")]
        public IHttpActionResult InsertAssetRequestPayments(AssetRequestPaymentsModel assetRequestPaymentsModel)
        {
            string retMsg = string.Empty;
            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                int PaymentModeId = 0;
                bool iStatus = false;

                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        string AssetStatus = "Raised PO";
                        var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper())
                            .Select(x => x.Id).FirstOrDefault();
                        decimal PaidAmount;

                        if (assetRequestPaymentsModel.SpecificationArray.Count() > 0)
                        {
                            foreach (var itms in assetRequestPaymentsModel.SpecificationArray)
                            {
                                if (itms.PaymentMode == "Cheque")
                                {
                                    PaymentModeId = 1;
                                    PaidAmount = Convert.ToDecimal(itms.ChequeAmount);

                                }
                                else if (itms.PaymentMode == "Credit Card")
                                {
                                    PaymentModeId = 2;
                                    PaidAmount = Convert.ToDecimal(itms.CCAmount);

                                }
                                else
                                {
                                    PaymentModeId = 3;
                                    PaidAmount = Convert.ToDecimal(itms.DCAmount);

                                }

                                AssetRequestPayment assetRequestPayment = new AssetRequestPayment();
                                assetRequestPayment.AssetRequestId = assetRequestPaymentsModel.AssetRequestId;
                                assetRequestPayment.PaymentModeId = PaymentModeId;
                                assetRequestPayment.BaseAmount = Convert.ToDecimal(itms.BaseAmount);
                                assetRequestPayment.Tax = Convert.ToInt32(itms.Tax);
                                assetRequestPayment.CurrentDate = System.DateTime.Now;
                                assetRequestPayment.CreditCardNo = itms.CCNo;
                                assetRequestPayment.CreditCardOwner = itms.CCName;
                                assetRequestPayment.ChequeNo = itms.ChequeNo;
                                assetRequestPayment.Amount = PaidAmount.ToString();


                                if (itms.ChequeDate != null)
                                {
                                    assetRequestPayment.ChequeDate = itms.ChequeDate;
                                }

                                assetRequestPayment.ChequeBankName = itms.ChequeBankName;
                                assetRequestPayment.ChequeBranch = itms.ChequeBranch;
                                assetRequestPayment.Payee = itms.Payee;
                                assetRequestPayment.DC_TransactionIdentifier = itms.DC_TransactionIdentifier;
                                assetRequestPayment.DC_Transferer = itms.DC_Transferer;
                                assetRequestPayment.CreatedBy = itms.CreatedBy;
                                assetRequestPayment.CreatedOn = System.DateTime.Now;
                                context.AssetRequestPayments.Add(assetRequestPayment);
                                context.SaveChanges();
                                iStatus = true;
                            }
                        }
                        else
                        {
                            AssetRequestPayment assetRequestPayment = new AssetRequestPayment();
                            assetRequestPayment.AssetRequestId = assetRequestPaymentsModel.AssetRequestId;
                            assetRequestPayment.CreatedBy = assetRequestPaymentsModel.CreatedBy;
                            assetRequestPayment.CreatedOn = System.DateTime.Now;
                            context.AssetRequestPayments.Add(assetRequestPayment);
                            context.SaveChanges();
                            iStatus = true;
                        }

                        PaymentModeId = 0;
                        dbContextTransaction.Commit();
                        if (iStatus)
                        {
                            AssetRequest assetRequest = (from x in db.AssetRequests
                                where x.Id == assetRequestPaymentsModel.AssetRequestId
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

                            AssetHistory assetHistory = new AssetHistory();
                            assetHistory.AssetRequestId = Convert.ToInt32(assetRequestPaymentsModel.AssetRequestId);
                            assetHistory.TargetStatusId = dbAssetStatusId;
                            assetHistory.StatusChangedBy = assetRequestPaymentsModel.CreatedBy;
                            assetHistory.StatusModifiedOn = System.DateTime.Now;
                            assetHistory.Comments = assetRequestPaymentsModel.Comments;
                            context.AssetHistories.Add(assetHistory);
                            context.SaveChanges();
                            retMsg = "Updated";

                        }
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }
                }
            }

            return Ok(retMsg);
        }



        [HttpPost]
        [Route("InsertPaymentDetails")]
        public IHttpActionResult InsertPaymentDetails(AssetRequestPaymentsModel assetRequestPaymentsModel)
        {
            string retMsg = string.Empty;
            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                int PaymentModeId = 0;


                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        decimal PaidAmount;

                        if (assetRequestPaymentsModel.SpecificationArray.Count() > 0)
                        {
                            foreach (var itms in assetRequestPaymentsModel.SpecificationArray)
                            {
                                if (itms.PaymentMode == "Cheque")
                                {
                                    PaymentModeId = 1;
                                    PaidAmount = Convert.ToDecimal(itms.ChequeAmount);

                                }
                                else if (itms.PaymentMode == "Credit Card")
                                {
                                    PaymentModeId = 2;
                                    PaidAmount = Convert.ToDecimal(itms.CCAmount);

                                }
                                else
                                {
                                    PaymentModeId = 3;
                                    PaidAmount = Convert.ToDecimal(itms.DCAmount);

                                }

                                AssetRequestPayment assetRequestPayment = new AssetRequestPayment();
                                assetRequestPayment.AssetRequestId = assetRequestPaymentsModel.AssetRequestId;
                                assetRequestPayment.PaymentModeId = PaymentModeId;
                                assetRequestPayment.BaseAmount = Convert.ToDecimal(itms.BaseAmount);
                                assetRequestPayment.Tax = Convert.ToInt32(itms.Tax);
                                assetRequestPayment.CurrentDate = System.DateTime.Now;
                                assetRequestPayment.CreditCardNo = itms.CCNo;
                                assetRequestPayment.CreditCardOwner = itms.CCName;
                                assetRequestPayment.ChequeNo = itms.ChequeNo;
                                assetRequestPayment.Amount = PaidAmount.ToString();
                                assetRequestPayment.IsActive = 1;


                                if (itms.ChequeDate != null)
                                {
                                    assetRequestPayment.ChequeDate = itms.ChequeDate;
                                }

                                assetRequestPayment.ChequeBankName = itms.ChequeBankName;
                                assetRequestPayment.ChequeBranch = itms.ChequeBranch;
                                assetRequestPayment.Payee = itms.Payee;
                                assetRequestPayment.DC_TransactionIdentifier = itms.DC_TransactionIdentifier;
                                assetRequestPayment.DC_Transferer = itms.DC_Transferer;
                                assetRequestPayment.CreatedBy = assetRequestPaymentsModel.CreatedBy;
                                assetRequestPayment.CreatedOn = System.DateTime.Now;
                                assetRequestPayment.IsActive = 1;
                                context.AssetRequestPayments.Add(assetRequestPayment);
                                context.SaveChanges();
                            }
                        }
                        else
                        {
                            AssetRequestPayment assetRequestPayment = new AssetRequestPayment();
                            assetRequestPayment.AssetRequestId = assetRequestPaymentsModel.AssetRequestId;
                            assetRequestPayment.CreatedBy = assetRequestPaymentsModel.CreatedBy;
                            assetRequestPayment.CreatedOn = System.DateTime.Now;
                            assetRequestPayment.IsActive = 1;
                            context.AssetRequestPayments.Add(assetRequestPayment);
                            context.SaveChanges();
                        }

                        PaymentModeId = 0;
                        dbContextTransaction.Commit();
                    }

                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }
                }
            }

            return Ok(retMsg);
        }



        [HttpGet]
        [Route("GetPaymentDetails")]
        public IList<AssetRequestPayments> GetPaymentDetails(long AssetRequestId)
        {
            try
            {
                var qry = (from ar in db.AssetRequests
                    join arp in db.AssetRequestPayments on ar.Id equals arp.AssetRequestId
                    join apm in db.AssetPaymentModes on arp.PaymentModeId equals apm.Id
                    join emp in db.Employees on arp.CreatedBy equals emp.UserId into list
                    from arloc in list.DefaultIfEmpty()
                    where arp.AssetRequestId == AssetRequestId && arp.IsActive == 1
                    select new AssetRequestPayments
                    {
                        PaymentMode = apm.Name,
                        BaseAmount = arp.BaseAmount,
                        Tax = arp.Tax,
                        AssetRequestId = ar.Id,
                        PaymentId = arp.Id,
                        ARNumber = ar.ARNumber,
                        CreatedOn = arp.CreatedOn,
                        RequestedBy = arloc.FirstName + " " + arloc.LastName
                    }).ToList();


                return qry;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [HttpGet]
        [Route("GetPaymentDetailsCurrentDate")]
        public IList<AssetRequestPayments> GetPaymentDetailsCurrentDate(long AssetRequestId)
        {
            try
            {
                DateTime today = DateTime.Today;
                var qry = (from ar in db.AssetRequests
                    join arp in db.AssetRequestPayments on ar.Id equals arp.AssetRequestId
                    join apm in db.AssetPaymentModes on arp.PaymentModeId equals apm.Id
                    join emp in db.Employees on arp.CreatedBy equals emp.UserId into list
                    from arloc in list.DefaultIfEmpty()
                    where arp.AssetRequestId == AssetRequestId && arp.IsActive == 1 &&
                          DbFunctions.TruncateTime(arp.CurrentDate) == today
                    orderby arp.Id
                    select new AssetRequestPayments
                    {
                        PaymentMode = apm.Name,
                        BaseAmount = arp.BaseAmount,
                        Tax = arp.Tax,
                        AssetRequestId = ar.Id,
                        PaymentId = arp.Id,
                        ARNumber = ar.ARNumber,
                        CreatedOn = arp.CreatedOn,
                        RequestedBy = arloc.FirstName + " " + arloc.LastName
                    }).ToList();


                return qry;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        [HttpGet]
        [Route("GetAssetHistory")]

        public IList<AssetHistoryModel> GetAssetHistory(string searchType, string requestNumber)
        {
            var assetHistory = new List<AssetHistoryModel>();
            var qry = (from ar in db.AssetRequests
                join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                join ah in db.AssetHistories on ar.Id equals ah.AssetRequestId
                join ast in db.AssetStatus on ah.TargetStatusId equals ast.Id
                join emp in db.Employees on ah.StatusChangedBy equals emp.UserId
                orderby ah.StatusModifiedOn descending
                select new AssetHistoryModel
                {
                    AssetType = at.Name,
                    AssetRequestNumber = ar.ARNumber,
                    PONumber = ar.PONumber,
                    Quantity = ar.Quantity,
                    Status = ast.Name,
                    ModifiedBy = emp.FirstName + " " + emp.LastName,
                    ModifiedOn = ah.StatusModifiedOn,
                    Comments = ah.Comments

                }).ToList();
            if (searchType.ToLower() == "arnumber")
            {
                assetHistory = qry.Where(x => x.AssetRequestNumber == requestNumber).ToList();
            }
            else
            {
                assetHistory = qry.Where(x => x.PONumber == requestNumber).ToList();
            }

            return assetHistory;
        }

        [HttpDelete]
        [Route("DeletePaymentsById")]
        public IHttpActionResult DeletePaymentsById(int id, int lastModifiedBy)
        {
            AssetRequestPayment assetRequestPayment = db.AssetRequestPayments.Where(x => x.Id == id).FirstOrDefault();
            if (assetRequestPayment == null)
            {
                return NotFound();
            }

            assetRequestPayment.IsActive = 0;
            assetRequestPayment.LastModifiedBy = lastModifiedBy;
            assetRequestPayment.LastModifiedOn = System.DateTime.Now;
            db.Entry(assetRequestPayment).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentExists(id))
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

        private bool PaymentExists(int id)
        {
            return db.AssetRequestPayments.Count(e => e.Id == id) > 0;
        }

        [HttpGet]
        [Route("GetAssetsDetails")]

        public IList<AssetsModel> GetAssetsDetails(string searchType, string requestNumber)
        {
            var assetsModels = (from vwAssetse in db.Vw_Assets
                let at = db.AssetTypes.FirstOrDefault(astp => astp.Id == vwAssetse.AssetTypeId)
                let ar = db.AssetRequests.FirstOrDefault(ar => ar.Id == vwAssetse.AssetRequestId)
                select new AssetsModel
                {
                    AssetRequestNumber = ar != null ? ar.ARNumber : null,
                    PONumber = ar != null ? ar.PONumber : null,
                    AssetType = at.Name,
                    TagNumber = vwAssetse.AssetTagNumber,
                    AssetIdentifier = vwAssetse.AssetIdentifier,
                    ActivationDate = vwAssetse.ActivationDate,
                    ExpiryDate = vwAssetse.ExpiryDate,
                    AssetId = vwAssetse.AssetId
                }).ToList();


            if (searchType.ToLower() == "arnumber")
            {
                return assetsModels.Where(x => x.AssetRequestNumber == requestNumber).ToList();
            }

            if (searchType.ToLower() == "ponumber")
            {
                return assetsModels.Where(x => x.PONumber == requestNumber).ToList();
            }

            if (searchType.ToLower() == "others")
            {
                return assetsModels.Where(x =>
                        x.AssetIdentifier.ToLower().Contains(requestNumber.ToLower()) ||
                        x.TagNumber.ToLower().Contains(requestNumber.ToLower()) || x.AssetType.ToLower().Contains(requestNumber.ToLower()))
                    .ToList();
            }

            return assetsModels;
        }

        [HttpPut]
        [Route("UpdateAssetDetails")]
        public IHttpActionResult UpdateAssetDetails(AssetDetail assetDetail)
        {
            Asset assets = db.Assets.Where(x => x.AssetId == assetDetail.Id).FirstOrDefault();

            if (assets != null)
            {
                assets.ActivationDate = Convert.ToDateTime(assetDetail.ActivationDate);
                DateTime dateValue;
                if (DateTime.TryParse(assetDetail.ExpiryDate, out dateValue))
                    assets.ExpiryDate = Convert.ToDateTime(assetDetail.ExpiryDate);
                assets.LastModifiedBy = Convert.ToInt16(assetDetail.LastModifiedBy);
                assets.LastModifiedOn = System.DateTime.Now;
            }

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetExists(Convert.ToInt16(assetDetail.Id)))
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

        private bool AssetExists(int id)
        {
            return db.Assets.Count(e => e.AssetId == id) > 0;
        }


        public class AssetDetail
        {
            public long Id { get; set; }
            public string LastModifiedBy { get; set; }
            public string ActivationDate { get; set; }
            public string ExpiryDate { get; set; }
        }

        [HttpPost]
        [Route("InsertOtherSpecification")]
        public IHttpActionResult InsertOtherSpecification(long AssetRequestId, string OtherSpecification)
        {
            string retMsg = string.Empty;
            try
            {
                AssetTypeOtherSpecification objAssetType = (from x in db.AssetTypeOtherSpecifications
                    where x.AssetRequestId == AssetRequestId
                    select x).FirstOrDefault();
                if (objAssetType != null)
                {
                    objAssetType.OtherSpecification = OtherSpecification;
                    db.SaveChanges();
                    retMsg = "Updated";

                }
                else
                {
                    AssetTypeOtherSpecification obj = new AssetTypeOtherSpecification();
                    obj.AssetRequestId = AssetRequestId;
                    obj.OtherSpecification = OtherSpecification;
                    db.AssetTypeOtherSpecifications.Add(obj);
                    db.SaveChanges();
                    retMsg = "Updated";
                }
            }
            catch (Exception)
            {
                throw;
            }

            return Ok(retMsg);
        }

        [HttpGet]
        [Route("GetAssetTypeOtherSpecification")]
        public IList<AssetTypeOtherSpecificationModel> GetAssetTypeOtherSpecification(long AssetRequestId)
        {
            try
            {
                var qry = (from m in db.AssetTypeOtherSpecifications
                    where m.AssetRequestId == AssetRequestId
                    select new AssetTypeOtherSpecificationModel
                    {
                        AssetRequestId = m.AssetRequestId,
                        AssetTypeOtherSpecification = m.OtherSpecification

                    }).ToList();
                return qry;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        [HttpGet]
        [Route("GetBalancePayments")]
        public IList<AssetTypePaymentBalanceModel> GetBalancePayments(long AssetRequestId)
        {
            try
            {
                IList<AssetTypePaymentBalanceModel> objAssetTypePaymentBalanceModelList =
                    new List<AssetTypePaymentBalanceModel>();
                AssetTypePaymentBalanceModel objAssetTypePaymentBalanceModel = new AssetTypePaymentBalanceModel();
                Decimal sumAmountAssetRequestPayments = 0;
                double balanceAmount = 0;
                var TotalSumAmount = (from x in db.AssetRequestPayments
                    where x.IsActive == 1 && x.AssetRequestId == AssetRequestId
                    select x.Amount).ToList();

                for (int i = 0; i < TotalSumAmount.Count; i++)
                {
                    sumAmountAssetRequestPayments += Convert.ToDecimal(TotalSumAmount[i]);
                }

                var TotalAmount = db.AssetQuotations.Where(x => x.AssetRequestId == AssetRequestId).Select(x => x.Price)
                    .FirstOrDefault();
                if (sumAmountAssetRequestPayments > 0)
                {
                    balanceAmount = (Convert.ToDouble(TotalAmount) - Convert.ToDouble(sumAmountAssetRequestPayments));
                }

                if (balanceAmount > 0)
                {
                    objAssetTypePaymentBalanceModel.BalanceAmount = balanceAmount;
                    objAssetTypePaymentBalanceModel.Status = "Partial Paid";
                }
                else if (balanceAmount == 0)
                {
                    if (sumAmountAssetRequestPayments > 0)
                    {
                        objAssetTypePaymentBalanceModel.BalanceAmount = Convert.ToDouble(sumAmountAssetRequestPayments);
                        objAssetTypePaymentBalanceModel.Status = "Full Payment Paid";
                    }
                    else
                    {
                        objAssetTypePaymentBalanceModel.BalanceAmount = Convert.ToDouble(TotalAmount);
                        objAssetTypePaymentBalanceModel.Status = "No Payment Paid";
                    }
                }

                objAssetTypePaymentBalanceModelList.Add(objAssetTypePaymentBalanceModel);
                return objAssetTypePaymentBalanceModelList;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        [HttpPost]
        [Route("ConvertAssetDetails")]
        public IHttpActionResult ConvertAssetDetails(string ARNumber, string PoNumber, long CreatedBy)
        {
            string retMsg = string.Empty;

            var tt = (from ar in db.AssetRequests
                join arp in db.AssetRequestPayments on ar.Id equals arp.AssetRequestId
                where ar.ARNumber == ARNumber && ar.IsActive == true && arp.IsActive == 1
                select new
                {
                    AssetRequestId = ar.Id,
                    AssetTypeId = ar.AssetTypeId,
                }).FirstOrDefault();
            var sumAmount = db.AssetRequestPayments
                .Where(x => x.AssetRequestId == tt.AssetRequestId && x.IsActive == 1)
                .Sum(y => Convert.ToDecimal(y.Amount));

            var AssetSpec = (from x in db.AssetRequestSpecifications
                where x.AssetRequestId == tt.AssetRequestId
                select new
                {
                    AssetTypeSpecId = x.AssetTypeSpecId,
                    AssetTypeSpecValue = x.AssetTypeSpecValue
                }).ToList();

            using (var context = new AssetManagementEntities())
            {
                context.Database.Log = Console.Write;
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        long dbMaxAssetTagId = db.Assets.Where(a => a.AssetTagNumber != null).Count();
                        dbMaxAssetTagId = dbMaxAssetTagId + 1;
                        var ATNumber = "Asset_" + dbMaxAssetTagId.ToString("D3");

                        Asset asset = new Asset();
                        asset.AssetTagNumber = ATNumber;
                        asset.Price = Convert.ToInt32(sumAmount);
                        asset.PurchaseOrderOn = DateTime.Now;
                        //asset.AssetIdentifier = assetCreationModel.AssetIdentifier;
                        asset.ActivationDate = System.DateTime.Now;
                        //asset.ExpiryDate = assetCreationModel.ExpiryDate;
                        asset.CreatedBy = 1;
                        asset.CreatedOn = System.DateTime.Now;
                        asset.IsActive = true;
                        context.Assets.Add(asset);
                        context.SaveChanges();
                        var newAssetId = asset.AssetId;

                        if (AssetSpec.Count() > 0)
                        {
                            foreach (var itms in AssetSpec)
                            {
                                AssetSpecification assetSpecification = new AssetSpecification();
                                assetSpecification.AssetId = newAssetId;
                                assetSpecification.AssetTypeId = tt.AssetTypeId;
                                assetSpecification.AssetTypeSpecId = itms.AssetTypeSpecId;
                                assetSpecification.AssetTypeSpecValue = itms.AssetTypeSpecValue;
                                //assetSpecification.CreatedBy = assetCreationModel.CreatedBy;
                                assetSpecification.CreatedOn = System.DateTime.Now;
                                context.AssetSpecifications.Add(assetSpecification);
                                context.SaveChanges();
                            }
                        }

                        dbContextTransaction.Commit();
                        retMsg = "Inserted";
                    }
                    catch (Exception ex)
                    {

                    }

                }
            }
            return Ok(retMsg);
        }


    }
}



