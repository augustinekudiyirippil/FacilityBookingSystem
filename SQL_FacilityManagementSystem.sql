 

create table tblRoles
(
roleID UUID primary key,
roleNumber int,
roleName varchar(50),
roleIsDeleted int default 0
);


create table tblFacilityTypes
(
fltyTypeID UUID primary key,
fltyTypeName varchar(50),
fltyTypeDescription varchar(500),
fltyIsDeleted int default 0
);

create table tblUsers
(
usrID uuid primary key,
usrNumber int,
usrFirstName varchar(50),
usrLastname varchar(50),
usrKnowenAs varchar(50),
usrAddress varchar(250),
usrPrimaryEmail varchar(50),
usrSecondaryEmail varchar(50),
usrMobile varchar(50),
usrWhatsApp varchar(50),
usrLandphone varchar(50),
usrMFAActivated int default 0,
usrSSOActivated int default 0,
usrNotes varchar(250),
usrIsDeleted int,
);

 

create table tblFacilities
(
fltyID uuid primary key,
fltyNumber int,
fltyType UUID REFERENCES tblFacilityTypes (fltyTypeID),
fltyOwner UUID REFERENCES tblUsers  (usrID),
fltyName varchar(50),
fltyDescription varchar(500),
fltyAddress varchar(250),
fltyTelephone varchar(50),
fltyEmail varchar(50),
fltyWebsite varchar(50),
fltyBankName varchar(100),
fltyBankAccountName varchar(50),
fltyBankAccountNumber varchar(40),
fltyBankSortCode varchar(10),
fltyBankIFSCCode varchar(25),
fltyBankIBAN varchar(50),
fltyIsDeleted int default 0,
fltyActive int default 0
);


 

create table tblFacilityAttachments
(
fltyAttachmentID uuid primary key,
fltyID  UUID REFERENCES tblFacilities (fltyID),
fltyAttachmentName varchar(250),
fltyAttachmentPath varchar(250),
fltyAttachmentIsDeleted int default 0,
fltyAttachmentApproved int default 0
);


create table tblFacilityBooking
(
fltyBookingID uuid primary key,
fltyBookingNumber int ,
fltyBookindOn	 timestamp,
fltyBookedBy UUID REFERENCES tblUsers  (usrID),
fltyBookingDate timestamp,
fltyBookingHoursFrom int,
fltyBookingHoursTo int,
fltyBookingApproved int default 0 ,
fltyBookingApprovedOn timestamp,
fltyBookingIsDeleted int default 0 ,
fltyBookingNotes varchar(250),
fltyBookingPaid int default 0 
);







 