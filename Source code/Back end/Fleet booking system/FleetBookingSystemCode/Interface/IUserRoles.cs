using System.Collections.Generic;
using FleetBookingSystemCode.Model;

namespace FleetBookingSystemCode.Interface
{
    public interface IUserRoles
    {


        List<UserRoles> GetUserRoles();
        UserRoles GetUserRole(int id);

        UserRoles addUserRole(UserRoles userRole);

        UserRoles deleteUserRole(UserRoles userRole);

        UserRoles updateUserRole(UserRoles userRole);





    }
}
