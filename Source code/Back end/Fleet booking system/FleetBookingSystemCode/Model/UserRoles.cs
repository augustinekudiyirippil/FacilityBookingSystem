using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

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
