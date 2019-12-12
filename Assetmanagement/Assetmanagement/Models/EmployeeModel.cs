using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assetmanagement.Models
{
    public class EmployeeModel
    {
        public long eUserId { get; set; }
        public string EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}