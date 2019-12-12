using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class UserModel
    {
        public string UserId { get; set; }
        public string Password { get; set; }
        public string EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public string MobileNumber { get; set; }
        public string Gender { get; set; }
        public string Role { get; set; }
        public string MenuList { get; set; }
        public List<string> AccessUrl { get; set; }
        public string NewPassword { get; set; }

    }
}