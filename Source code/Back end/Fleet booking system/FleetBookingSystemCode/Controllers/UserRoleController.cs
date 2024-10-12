using FleetBookingSystemCode.Model;
using FleetBookingSystemCode.Repository;
using Microsoft.AspNetCore.Mvc;
using System;
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

        [HttpGet("{RoleID}")]
        public ActionResult<IEnumerable<UserRoles>>  GetUserRole(Guid RoleID)
        {
            return userrole.GetUserRole(RoleID);
        }


        [HttpPost]
        public string addUserRole(string userRoleName)
        {
            return userrole.addUserRole(userRoleName);
        }


        [HttpPut]
        public string updateUserRole(Guid UserRoleID, string UserRolename)
        {
            return userrole.updateUserRole(  UserRoleID,    UserRolename);
        }


        [HttpDelete]
        public string deleteUserRole(Guid UserRoleID)
        {
            return userrole.deleteUserRole(UserRoleID);
        }



    }
}
