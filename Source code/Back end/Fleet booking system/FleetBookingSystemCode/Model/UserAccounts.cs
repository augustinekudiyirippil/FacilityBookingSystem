using System.Formats.Asn1;
using System;

namespace FleetBookingSystemCode.Model
{
    public class UserAccounts
    {
            public Guid usrid { get; set; }
            public int usrnumber { get; set; }
            public string usrfirstname { get; set; }
            public string usrlastname { get; set; }
            public string usrknownas { get; set; }
            public string usraddress { get; set; }
            public string usrprimaryemail { get; set; }
            public string usrsecondaryemail { get; set; }
            public string usrmobile { get; set; }
            public string usrwhatsapp { get; set; }
            public string usrlandphone { get; set; }
            public int usrmfaactivated { get; set; }
            public int usrssoactivated { get; set; }
            public string usrnotes { get; set; }
            public int usrisdeleted { get; set; }
            public Guid usrroledid { get; set; }
            public DateTime usrcreatedon  { get; set; }
            public DateTime usrlastupdatedon  { get; set; }
            public string usrcomments { get; set; }


    }
}
