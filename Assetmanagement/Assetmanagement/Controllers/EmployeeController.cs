using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Assetmanagement.Models;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class EmployeeController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        [HttpGet]
        [Route("CheckLoginUser")]
        public IHttpActionResult CheckLoginUser(string FirstName, string LastName)
        {
            string retMsg = string.Empty;
            try
            {
                var qry = db.Employees.Where(c => c.FirstName == FirstName && c.LastName == LastName).Select(c => c.UserId).FirstOrDefault();
                if (qry != 0)
                {
                    retMsg = "CORRECT UserNAme and LastName";
                }
                else
                {
                    retMsg = "Invalid UserNAme and LastName";
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Ok(retMsg);
        }
    }
}
