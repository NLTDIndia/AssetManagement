using System;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace Assetmanagement.Controllers
{
    public class AssetDocumentsController : ApiController
    {
        // GET: AssetDocument
        private AssetManagementEntities db = new AssetManagementEntities();
        string fileLocation = System.Web.Configuration.WebConfigurationManager.AppSettings["uploadFileLocation"].ToString();

        [HttpPost]
        [Route("upload")]
        public IHttpActionResult FileUpload(long entityTypeId, int CreatedBy)
        {
            //long entityTypeId;
            string entityName = string.Empty;

            var httpRequest = HttpContext.Current.Request;
            //entityTypeId = Convert.ToInt64(httpRequest.Form["EntityTypeId"]);
            entityName = httpRequest.Form["Entity"];
            if (httpRequest.Files.Count > 0 && httpRequest.Form.Keys.Count > 0)
            {
                var entityId = db.Entities.Where(x => x.EntityName == entityName).Select(y => y.EntityId).FirstOrDefault();
                fileLocation = fileLocation + "/" + entityId + "/" + entityTypeId + "/";
                if (!Directory.Exists(fileLocation))
                {
                    Directory.CreateDirectory(fileLocation);
                }

                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];
                    var filePath = fileLocation + postedFile.FileName;
                    postedFile.SaveAs(filePath);

                    var assetDocument = new AssetDocument();
                    assetDocument.EntityId = entityId;
                    assetDocument.EntityTypeId = entityTypeId;
                    assetDocument.FilePath = fileLocation;
                    assetDocument.FileName = postedFile.FileName;
                    assetDocument.IsActive = true;
                    assetDocument.CreatedOn = System.DateTime.Now;
                    assetDocument.CreatedBy = CreatedBy;                   
                    //assetDocument.FileUpload = FileUpload;                  
                    db.AssetDocuments.Add(assetDocument);
                }
                db.SaveChanges();
            }
            return Ok("success");
        }
    }
}