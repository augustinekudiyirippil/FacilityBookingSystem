using FleetBookingSystemCode.Model;
using FleetBookingSystemCode.Repository;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;

namespace FleetBookingSystemCode.Controllers
{
    public class UserAccountController : Controller
    {
        private UserAccountRepository userAccount = new UserAccountRepository();

        [HttpGet]
        public ActionResult<IEnumerable<UserAccounts>> GetAllUserAccount()
        {
            return userAccount.getAllUserAccounts();
        }


        [HttpGet("{UserAccountID}")]
        public ActionResult<IEnumerable<UserAccounts>> GetSelectedUserAccount(Guid UserAccountID)
        {
            return userAccount.getUserAccount(UserAccountID);

        }


        [HttpPost]
        public string addUserAccount
            (
            string newusrfirstname,
            string newusrlastname,
            string newusrknownas,
            string newusraddress,
            string newusrprimaryemail,
            string newusrsecondaryemail,
            string newusrmobile,
            string newusrwhatsapp,
            string newusrlandphone,
            string newusrnotes
            )
        {
            return userAccount.addUserAccount
                (
                    newusrfirstname,
                    newusrlastname,
                    newusrknownas,
                    newusraddress,
                    newusrprimaryemail,
                    newusrsecondaryemail,
                    newusrmobile,
                    newusrwhatsapp,
                    newusrlandphone,
                    newusrnotes
                );
        }


        [HttpPut]
        public string updateUserAccount
            (
            Guid usridtoupdate,
            string newusrfirstname,
            string newusrlastname,
            string newusrknownas,
            string newusraddress,
            string newusrprimaryemail,
            string newusrsecondaryemail,
            string newusrmobile,
            string newusrwhatsapp,
            string newusrlandphone,
            int newusrmfaactivated,
            int newusrssoactivated,
            string newusrnotes,
            Guid newusrroledid
            )
        {
            return userAccount.updateUserAccount
                (
                  usridtoupdate,
                  newusrfirstname,
                  newusrlastname,
                  newusrknownas,
                  newusraddress,
                  newusrprimaryemail,
                  newusrsecondaryemail,
                  newusrmobile,
                  newusrwhatsapp,
                  newusrlandphone,
                  newusrmfaactivated,
                  newusrssoactivated,
                  newusrnotes,
                  newusrroledid
                );
        }


        [HttpDelete]
        public string deleteUserAccount(Guid usridtodelete, string usrnotes)
        {
            return userAccount.deleteUserAccount(usridtodelete, usrnotes);
        }
    }
}
