using System.Collections.Generic;
using FleetBookingSystemCode.Model;

namespace FleetBookingSystemCode.Interface
{
    public interface IUserRoles
    {


        List<UserRoles> GetAllEmployees();
        UserRoles GetEmployee(int id);
    }
}
