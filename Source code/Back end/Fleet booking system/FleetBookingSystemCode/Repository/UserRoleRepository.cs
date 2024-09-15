using FleetBookingSystemCode.Interface;
using FleetBookingSystemCode.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace FleetBookingSystemCode.Repository
{
    public class UserRoleRepository
    {
        List<UserRoles> listUserRoles = new List<UserRoles>
        {
            new UserRoles{  roleid= new Guid( "7AC69D82-8077-4C36-90F9-23563C04D67A"), rolenumber =1, rolename="Admin", roleisdeleted =0},
            new UserRoles{  roleid= new Guid("76386840-F006-4043-AA05-EDCD67D4D333"), rolenumber =2, rolename="Owner", roleisdeleted =0},
            new UserRoles{  roleid= new Guid("1C171AB1-9CFE-4C69-ADB5-2ECC608FD39D"), rolenumber =3, rolename="Customer", roleisdeleted =0}


        };
        public List<UserRoles> GetAllEUserRoles()
        {
            return listUserRoles;
        }

        public UserRoles GetUserRole(int id)
        {
            return listUserRoles.FirstOrDefault(x => x.rolenumber == id);
        }
    }
}
