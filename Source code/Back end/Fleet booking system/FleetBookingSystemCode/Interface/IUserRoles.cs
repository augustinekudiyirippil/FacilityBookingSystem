using System;
using System.Collections.Generic;
using FleetBookingSystemCode.Model;

namespace FleetBookingSystemCode.Interface
{
    public interface IUserRoles
    {


        List<UserRoles> GetUserRoles();
        List<UserRoles> GetUserRole(Guid id);

        string addUserRole(string userRoleName);

        UserRoles deleteUserRole(Guid id);

        string updateUserRole(Guid UserRoleID, string UserRolename);



    }
}
