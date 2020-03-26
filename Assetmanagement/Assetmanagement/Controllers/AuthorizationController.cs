using Assetmanagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Assetmanagement.Controllers
{
    [RoutePrefix("api/Assetmanagement")]
    public class AuthorizationController : ApiController
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        [HttpPost]
        [Route("users/Authentication")]
        public IHttpActionResult UserValidation(UserModel userDetail)
        {
            var corpId = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            var userInfo = (from u in db.Users
                            join e in db.Employees on u.EmployeeUserId equals e.UserId
                            join urm in db.UserRoleMaps on e.UserId equals urm.EmployeeUserId
                            join ur in db.UserRoles on urm.RoleId equals ur.Id
                            where e.CorpId == corpId
                            select new UserModel
                            {
                                UserId = e.UserId.ToString(),
                                EmployeeId = e.EmployeeId,
                                FirstName = e.FirstName,
                                LastName = e.LastName,
                                EmailAddress = e.EmailAddress,
                                MobileNumber = e.MobileNumber,
                                Gender = e.Gender,
                                Role = ur.RoleName
                            }).FirstOrDefault();
            if (userInfo != null)
            {
                var menu = new MenuController();
                menu.GetMenu(userInfo);
            }
            return Ok(userInfo);
        }


        [HttpGet]
        [Route("users/RoleAuthorization")]
        public IHttpActionResult RoleValidation(string role, string url)
        {
            bool isValidUrl = false;
            var userDetail = new UserModel();
            userDetail.Role = role;
            var menu = new MenuController();
            menu.GetMenu(userDetail);
            var urlCollection = userDetail.AccessUrl;
            if (urlCollection.Select(x => x.Trim()).Contains(url.Trim()))
            {
                isValidUrl = true;
            }
            return Ok(isValidUrl);
        }
        [HttpPut]
        [Route("users/ChangePassword")]
        public IHttpActionResult ChangePassword(UserModel userPasswordDetail)
        {
            long userId = Convert.ToInt64(userPasswordDetail.UserId);
            var userDetail = (from e in db.Employees
                              join u in db.Users on e.UserId equals u.EmployeeUserId
                              where e.UserId == userId && u.Password.Replace(" ", "#") == userPasswordDetail.Password.Replace(" ", "#")
                              select u).SingleOrDefault();
            if (userDetail == null)
            {
                return Ok("fail");
            }
            userDetail.Password = userPasswordDetail.NewPassword;
            try
            {
                db.SaveChanges();
                return Ok("success");
            }
            catch (DbUpdateConcurrencyException)
            {
                throw;
            }

        }
    }
}
