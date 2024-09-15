using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FleetBookingSystemCode.Model
{
    public class UserRoles
    {


        public Guid roleid { get; set; }
        public int rolenumber { get; set; }
        public string rolename { get; set; }
       
        public int roleisdeleted { get; set; }


    }
}
