

 

CREATE TABLE public.tblroles (
	roleid uuid NOT NULL,
	rolenumber int4 DEFAULT nextval('rolenumberseq'::regclass) NULL,
	rolename varchar(50) NULL,
	roleisdeleted int4 DEFAULT 0 NULL,
	CONSTRAINT tblroles_pkey PRIMARY KEY (roleid)
);


 



CREATE TABLE public.tblusers (
	usrid uuid NOT NULL,
	usrnumber int4 DEFAULT nextval('usrnumberseq'::regclass) NULL,
	usrfirstname varchar(50) NULL,
	usrlastname varchar(50) NULL,
	usrknownas varchar(50) NULL,
	usraddress varchar(250) NULL,
	usrprimaryemail varchar(50) NULL,
	usrsecondaryemail varchar(50) NULL,
	usrmobile varchar(50) NULL,
	usrwhatsapp varchar(50) NULL,
	usrlandphone varchar(50) NULL,
	usrmfaactivated int4 DEFAULT 0 NULL,
	usrssoactivated int4 DEFAULT 0 NULL,
	usrnotes varchar(250) NULL,
	usrisdeleted int4 NULL,
	usrroledid uuid NULL,
	CONSTRAINT tblusers_pkey PRIMARY KEY (usrid)
);


 

ALTER TABLE public.tblusers ADD CONSTRAINT tblusers_usrroledid_fkey FOREIGN KEY (usrroledid) REFERENCES public.tblroles(roleid);


 

CREATE TABLE public.tblfacilitytypes (
	fltytypeid uuid NOT NULL,
	fltytypename varchar(50) NULL,
	fltytypedescription varchar(500) NULL,
	fltyisdeleted int4 DEFAULT 0 NULL,
	CONSTRAINT tblfacilitytypes_pkey PRIMARY KEY (fltytypeid)
);


 

CREATE TABLE public.tblfacilities (
	fltyid uuid NOT NULL,
	fltynumber int4 DEFAULT nextval('fltynumberseq'::regclass) NULL,
	fltytype uuid NULL,
	fltyowner uuid NULL,
	fltyname varchar(50) NULL,
	fltydescription varchar(500) NULL,
	fltyaddress varchar(250) NULL,
	fltytelephone varchar(50) NULL,
	fltyemail varchar(50) NULL,
	fltywebsite varchar(50) NULL,
	fltybankname varchar(100) NULL,
	fltybankaccountname varchar(50) NULL,
	fltybankaccountnumber varchar(40) NULL,
	fltybanksortcode varchar(10) NULL,
	fltybankifsccode varchar(25) NULL,
	fltyisdeleted int4 DEFAULT 0 NULL,
	fltyactive int4 DEFAULT 0 NULL,
	fltybankiban varchar(50) NULL,
	fltyrate float8 NULL,
	fltycurrency varchar(10) NULL,
	CONSTRAINT tblfacilities_pkey PRIMARY KEY (fltyid)
);



ALTER TABLE public.tblfacilities ADD CONSTRAINT tblfacilities_fltyowner_fkey FOREIGN KEY (fltyowner) REFERENCES public.tblusers(usrid);
ALTER TABLE public.tblfacilities ADD CONSTRAINT tblfacilities_fltytype_fkey FOREIGN KEY (fltytype) REFERENCES public.tblfacilitytypes(fltytypeid);


 

CREATE TABLE public.tblfacilityattachments (
	fltyattachmentid uuid NOT NULL,
	fltyid uuid NULL,
	fltyattachmentname varchar(250) NULL,
	fltyattachmentpath varchar(250) NULL,
	fltyattachmentapproved int4 DEFAULT 0 NULL,
	fltyattachmentisdeleted int4 DEFAULT 0 NULL,
	CONSTRAINT tblfacilityattachments_pkey PRIMARY KEY (fltyattachmentid)
);


 

ALTER TABLE public.tblfacilityattachments ADD CONSTRAINT tblfacilityattachments_fltyid_fkey FOREIGN KEY (fltyid) REFERENCES public.tblfacilities(fltyid);


 
CREATE TABLE public.tblfacilitybooking (
	fltybookingid uuid NOT NULL,
	fltybookingnumber int4 DEFAULT nextval('fltybookingnumberseq'::regclass) NULL,
	fltybookedon timestamp NULL,
	fltybookedby uuid NULL,
	fltybookingdate timestamp NULL,
	fltybookinghoursfrom int4 NULL,
	fltybookinghoursto int4 NULL,
	fltybookingapproved int4 DEFAULT 0 NULL,
	fltybookingapprovedon timestamp NULL,
	fltybookingisdeleted int4 DEFAULT 0 NULL,
	fltybookingnotes varchar(250) NULL,
	fltybookingpaid int4 DEFAULT 0 NULL,
	fltyid uuid NULL,
	fltybookingrate float8 NULL,
	fltybookingamountpaid float8 NULL,
	CONSTRAINT tblfacilitybooking_pkey PRIMARY KEY (fltybookingid)
);


 
ALTER TABLE public.tblfacilitybooking ADD CONSTRAINT tblfacilitybooking_fltybookedby_fkey FOREIGN KEY (fltybookedby) REFERENCES public.tblusers(usrid);
ALTER TABLE public.tblfacilitybooking ADD CONSTRAINT tblfacilitybooking_fltyid_fkey FOREIGN KEY (fltyid) REFERENCES public.tblfacilities(fltyid);


alter table  public.tblfacilitybooking add fltyBookingIsCancelled float null, add  fltyBookingCancelledOn timestamp, add fltyBookingCancelledComments varchar(1000);

alter table public.tblusers add usrCreatedOn timestamp, add usrLastUpdatedOn timestamp, add usrComments varchar(1000);



