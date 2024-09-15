using FleetBookingSystemCode.Model;
using FleetBookingSystemCode.Repository;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace FleetBookingSystemCode.Controllers
{
    [Route("api/[controller]")]
    [ApiController]


    public class UserRoleController : ControllerBase
    {
        private UserRoleRepository userrole = new UserRoleRepository();

        [HttpGet]
        public ActionResult<IEnumerable<UserRoles>> GetAllEUserRoles()
        {
            return userrole.GetAllEUserRoles();
        }

        [HttpGet("{id}")]
        public ActionResult<UserRoles> GetUserRole(int id)
        {
            return userrole.GetUserRole(id);
        }

    }
}
