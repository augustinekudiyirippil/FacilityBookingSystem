using System;
using System.Collections.Generic;
using FleetBookingSystemCode.Model;
namespace FleetBookingSystemCode.Interface
{
    public interface IUserAccounts
    {

        List<UserAccounts> getAllUserAccounts();
        List<UserAccounts> getUserAccount(Guid id);

        string addUserAccount(
            string newusrfirstname ,
            string newusrlastname ,
            string newusrknownas ,
            string newusraddress ,
            string newusrprimaryemail ,
            string newusrsecondaryemail ,
            string newusrmobile ,
            string newusrwhatsapp ,
            string newusrlandphone ,
            string newusrnotes   
            );

        string deleteUserAccount(Guid usridtodelete, string usrnotes);

        string updateUserAccount(
            Guid  usridtoupdate  ,
            string newusrfirstname  ,
            string newusrlastname  ,
            string newusrknownas  ,
            string newusraddress  ,
            string newusrprimaryemail  ,
            string newusrsecondaryemail  ,
            string newusrmobile  ,
            string newusrwhatsapp  ,
            string newusrlandphone  ,
            int newusrmfaactivated  ,
            int   newusrssoactivated  ,
            string newusrnotes  ,
            Guid   newusrroledid
            );




    }
}
