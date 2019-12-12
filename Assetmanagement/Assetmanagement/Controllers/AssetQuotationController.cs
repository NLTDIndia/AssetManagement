using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class AssetQuotationController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        [HttpPost]
        [Route("PostAssetQuotation")] //Sankar
        // POST api/RaiseRequest
        [ResponseType(typeof(AssetQuotation))]
        public IHttpActionResult PostAssetQuotation()
        {
            long assetRequestId, vendorId, quantity = 0;
            decimal price, cgst, sgst;
            string comments = string.Empty;
            string status = string.Empty;
            string createdBy = string.Empty;
            try
            {
                HttpResponseMessage response = new HttpResponseMessage();
                var httpRequest = HttpContext.Current.Request;
                assetRequestId = Convert.ToInt64(httpRequest.Form["EntityTypeId"]);
                vendorId = Convert.ToInt64(httpRequest.Form["VendorId"]);
                quantity = Convert.ToInt64(httpRequest.Form["Quantity"]);
                price = Convert.ToDecimal(httpRequest.Form["Price"]);
                comments = httpRequest.Form["Comments"];
                cgst = Convert.ToDecimal(httpRequest.Form["CGST"]);
                sgst = Convert.ToDecimal(httpRequest.Form["SGST"]);
                createdBy = httpRequest.Form["CreatedBy"];


                var assetVendor = db.AssetQuotations.Where(x => x.AssetVendorId == vendorId && x.AssetRequestId == assetRequestId && x.IsActive == true).Select(x => x.Id).FirstOrDefault();
                if (assetVendor == 0)
                {
                    if (httpRequest.Form.Keys.Count > 0)
                    {

                        AssetQuotation assetQuotation = new AssetQuotation();
                        assetQuotation.AssetRequestId = assetRequestId;
                        assetQuotation.AssetVendorId = vendorId;
                        assetQuotation.Price = price;
                        assetQuotation.Quantity = quantity;
                        assetQuotation.Comments = (comments == "undefined") ? string.Empty : comments;
                        assetQuotation.Documents = "";
                        assetQuotation.CGST = cgst;
                        assetQuotation.SGST = sgst;
                        assetQuotation.IsActive = true;
                        assetQuotation.CreatedOn = System.DateTime.Now;
                        assetQuotation.CreatedBy = (createdBy == "undefined") ? 0 : Convert.ToInt16(createdBy);
                        db.AssetQuotations.Add(assetQuotation);
                        db.SaveChanges();
                        var fileUpload = new AssetDocumentsController();
                        var result = fileUpload.FileUpload(assetQuotation.Id, Convert.ToInt16(createdBy));
                        status = "success";
                    }
                }
                else
                {
                    status = "exist";
                }
            }
            catch (Exception)
            {
                throw;
            }

            return Ok(status);
        }

        [HttpPut]
        [Route("SendForApproval")]
        public IHttpActionResult SendForApproval(int AssetRequestId, int LastModifiedBy)
        {
            string retMsg = string.Empty;
            string AssetStatus = "Awaiting Quotation Approval";
            long RaiseRequestId = AssetRequestId;
            try
            {
                if (AssetRequestId > 0)
                {
                    var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();

                    var assetRequest = db.AssetRequests.SingleOrDefault(x => x.Id == RaiseRequestId);
                    if (assetRequest != null)
                    {
                        assetRequest.AssetStatusId = dbAssetStatusId;
                        assetRequest.LastModifiedOn = System.DateTime.Now;
                        assetRequest.LastModifiedBy = LastModifiedBy;
                        db.SaveChanges();
                        retMsg = "Updated";
                    }

                    AssetHistory assetHistory = new AssetHistory();
                    assetHistory.AssetRequestId = AssetRequestId;
                    assetHistory.TargetStatusId = dbAssetStatusId;
                    assetHistory.StatusChangedBy = LastModifiedBy;
                    assetHistory.StatusModifiedOn = System.DateTime.Now;
                    assetHistory.Comments = assetRequest.Comments;
                    db.AssetHistories.Add(assetHistory);
                    db.SaveChanges();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return Ok(retMsg);
        }

        [HttpPut]
        [Route("DeleteAssetQuotationById")]
        public IHttpActionResult DeleteAssetQuotationById(int id)
        {
            AssetQuotation objassetQuotation = db.AssetQuotations.Find(id);
            if (objassetQuotation == null)
            {
                return NotFound();
            }

            objassetQuotation.IsActive = false;
            objassetQuotation.LastModifiedOn = System.DateTime.Now;
            objassetQuotation.LastModifiedBy = objassetQuotation.LastModifiedBy;
            db.Entry(objassetQuotation).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssetQuotationExists(id))
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

        private bool AssetQuotationExists(int id)
        {
            return db.AssetQuotations.Count(e => e.Id == id) > 0;
        }
        [HttpPost]
        [Route("InsertAssetQuotation")]
        public IHttpActionResult InsertAssetQuotation(AssetQuotationModel assetQuotationModel)
        {
            string retMsg = string.Empty;
            string AssetStatus = "Awaiting Quotation Approval";
            long RaiseRequestId = assetQuotationModel.AssetRequestId;

            try
            {
                if (assetQuotationModel.SpecificationArray.Count() > 0)
                {
                    var dbAssetStatusId = db.AssetStatus.Where(c => c.Name.ToUpper() == AssetStatus.ToUpper()).Select(x => x.Id).FirstOrDefault();
                    foreach (var itms in assetQuotationModel.SpecificationArray)
                    {
                        var dbVendorId = db.AssetVendors.Where(x => x.Name == itms.Name).Select(c => c.Id).FirstOrDefault();

                        AssetQuotation assetQuotation = new AssetQuotation();
                        assetQuotation.AssetRequestId = assetQuotationModel.AssetRequestId;
                        assetQuotation.AssetVendorId = dbVendorId;
                        assetQuotation.Price = itms.Price;
                        assetQuotation.Quantity = itms.Quantity;
                        assetQuotation.Comments = itms.Comments;
                        assetQuotation.Documents = itms.Documents;
                        assetQuotation.CGST = itms.CGST;
                        assetQuotation.SGST = itms.SGST;
                        assetQuotation.IsActive = true;
                        assetQuotation.CreatedOn = System.DateTime.Now;
                        assetQuotation.CreatedBy = assetQuotation.CreatedBy;
                        db.AssetQuotations.Add(assetQuotation);
                        db.SaveChanges();
                    }

                    var assetRequest = db.AssetRequests.SingleOrDefault(x => x.Id == RaiseRequestId);
                    if (assetRequest != null)
                    {
                        assetRequest.AssetStatusId = dbAssetStatusId;
                        assetRequest.LastModifiedOn = System.DateTime.Now;
                        db.SaveChanges();
                    }

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
        [Route("GetAssetQuotation")]
        public IList<AssetGetQuotationModel> GetAssetQuotation(long AssetRequestId)
        {
            var Documents = new List<AssetGetQuotationModel>();
            try
            {
                var qry1 = (from aq in db.AssetQuotations
                            join aqa in db.AssetQuoteApprovals on aq.Id equals aqa.AssetQuotationId
                            where aq.AssetRequestId == AssetRequestId && aq.IsActive == true && aqa.IsAwaitingNextApproval == true
                            select new
                            {
                                AssetQuotationId = aq.Id
                            }).FirstOrDefault();
                var assetQuotationDetail = new List<AssetGetQuotationModel>();
                if (qry1 != null)
                {

                    assetQuotationDetail = (from aq in db.AssetQuotations
                                            join ar in db.AssetRequests on aq.AssetRequestId equals ar.Id
                                            join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                                            join vt in db.AssetVendors on aq.AssetVendorId equals vt.Id
                                            join e in db.Employees on aq.CreatedBy equals e.UserId
                                            where aq.Id == qry1.AssetQuotationId && aq.IsActive == true
                                            select new AssetGetQuotationModel
                                            {
                                                AssetQuotationId = aq.Id,
                                                VendorName = vt.Name,
                                                ARNumber = ar.ARNumber,
                                                Price = aq.Price,
                                                Quantity = aq.Quantity,
                                                CGST = aq.CGST,
                                                SGST = aq.SGST,
                                                Comments = aq.Comments ?? string.Empty,
                                                AssetRequestId = ar.Id,
                                                AssetTypeId = at.Id,
                                                AssetTypeName = at.Name,
                                                AssetStatusId = aq.Id,
                                                CreatedOn = ar.CreatedOn,
                                                CreatedBy = ar.CreatedBy,
                                                EmployeeName = e.FirstName + " " + e.LastName
                                            }).ToList();

                }
                else
                {
                    assetQuotationDetail = (from aq in db.AssetQuotations
                                            join ar in db.AssetRequests on aq.AssetRequestId equals ar.Id
                                            join at in db.AssetTypes on ar.AssetTypeId equals at.Id
                                            join vt in db.AssetVendors on aq.AssetVendorId equals vt.Id
                                            join e in db.Employees on aq.CreatedBy equals e.UserId
                                            where aq.AssetRequestId == AssetRequestId && aq.IsActive == true
                                            select new AssetGetQuotationModel
                                            {
                                                AssetQuotationId = aq.Id,
                                                VendorName = vt.Name,
                                                ARNumber = ar.ARNumber,
                                                Price = aq.Price,
                                                Quantity = aq.Quantity,
                                                CGST = aq.CGST,
                                                SGST = aq.SGST,
                                                Comments = aq.Comments ?? string.Empty,
                                                AssetRequestId = ar.Id,
                                                AssetTypeId = at.Id,
                                                AssetTypeName = at.Name,
                                                AssetStatusId = aq.Id,
                                                CreatedOn = ar.CreatedOn,
                                                CreatedBy = ar.CreatedBy,
                                                EmployeeName = e.FirstName + " " + e.LastName
                                            }).ToList();



                }

                return GetAssetDocuments(assetQuotationDetail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpGet]
        [Route("GetAssetQuotationApprovalComments")]
        public IList<AssetQuotationApprovalComments> GetAssetQuotationApprovalComments(long AssetRequestId)
        {
            try
            {
                var qry = (from aq in db.AssetQuotations
                           join aqa in db.AssetQuoteApprovals on aq.Id equals aqa.AssetQuotationId
                           join emt in db.Employees on aqa.ApprovedBy equals emt.UserId
                           where aq.AssetRequestId == AssetRequestId //&& aq.IsActive == true
                           orderby aqa.ApprovedOn descending
                           select new AssetQuotationApprovalComments
                           {
                               QuotationApproveComments = aqa.Comments,
                               ApprovedBy = emt.FirstName + " " + emt.LastName,
                               ApprovedOn = aqa.ApprovedOn,
                               AssetQuotationId = aq.Id
                           }).ToList();
                return qry;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<AssetGetQuotationModel> GetAssetDocuments(List<AssetGetQuotationModel> assetQuotation)
        {
            List<AssetDocument> assetDocument = new List<AssetDocument>();
            try
            {
                foreach (AssetGetQuotationModel aqm in assetQuotation)
                {
                    var docCount = (from ad in db.AssetDocuments
                                    where ad.EntityTypeId == aqm.AssetQuotationId
                                    select new
                                    {
                                        Id = ad.Id,
                                        FileName = ad.FileName,
                                        FilePath = ad.FilePath,
                                        Entity = ad.Entity,
                                        EntityId = ad.EntityId,
                                        EntityTypeId = ad.EntityTypeId
                                    }).ToList()
                                .Select(X => new AssetDocument()
                                {
                                    Id = X.Id,
                                    FileName = X.FileName,
                                    FilePath = X.FilePath,
                                    Entity = X.Entity,
                                    EntityId = X.EntityId,
                                    EntityTypeId = X.EntityTypeId
                                });

                    if (aqm.AssetRequestId > 0 && docCount.Any())
                    {
                        foreach (var itms in docCount)
                        {
                            assetDocument.Add(new AssetDocument
                            {
                                FileName = itms.FileName,
                                FilePath = itms.FilePath,
                                EntityTypeId = itms.EntityTypeId
                            });
                        }
                    }

                    aqm.Documents = assetDocument;

                }
            }
            catch (Exception ex)
            {

            }
            return assetQuotation;

        }

        [HttpGet]
        [Route("GetDocumentsByAssetRequestId")]

        public IList<AssetDocument> GetDocumentsByAssetRequestId(long? AssetRequestId)
        {
            List<AssetDocument> assetDocument = new List<AssetDocument>();
            try
            {

                var docCount = (from ad in db.AssetDocuments
                                    //join ae in db.Entities on ad.EntityId equals ae.EntityId
                                join aq in db.AssetQuotations on ad.EntityTypeId equals aq.AssetRequestId
                                where aq.AssetRequestId == AssetRequestId
                                select new
                                {
                                    Id = ad.Id,
                                    FileName = ad.FileName,
                                    FilePath = ad.FilePath,
                                    Entity = ad.Entity,
                                    EntityId = ad.EntityId,
                                    EntityTypeId = ad.EntityTypeId
                                }).ToList()
                                .Select(X => new AssetDocument()
                                {
                                    Id = X.Id,
                                    FileName = X.FileName,
                                    FilePath = X.FilePath,
                                    Entity = X.Entity,
                                    EntityId = X.EntityId,
                                    EntityTypeId = X.EntityTypeId
                                });

                if (AssetRequestId > 0 && docCount.Any())
                {
                    foreach (var itms in docCount)
                    {
                        assetDocument.Add(new AssetDocument
                        {
                            FileName = itms.FileName,
                            FilePath = itms.FilePath,
                            EntityTypeId = itms.EntityTypeId
                        });
                    }
                }

            }
            catch (Exception ex)
            {

            }
            return assetDocument;

        }

    }
}
