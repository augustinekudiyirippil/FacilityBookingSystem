



-- PROCEDURE TO GENERATE NEW UUID
create function gen_random_uuid() RETURNS uuid as $$ SELECT md5(random()::text || clock_timestamp()::text)::uuid $$ LANGUAGE SQL;

select gen_random_uuid() ;



--PROCEDURE TO INSERT INTO ROLES
create or replace procedure spInsertToRole
 (
newRoleName varchar(50)
)
 
language plpgsql    
as $$
begin
 

insert into public.tblroles
(
	roleid,  rolename, roleisdeleted
)
(
	select gen_random_uuid(), newRoleName, 0
)	;
	
    commit;
end;$$;




-- PROCEDURE TO INSERT INTO USER
create or replace procedure spInsertToUser
(
 
  newusrfirstname varchar(50),
  newusrlastname varchar(50), 
  newusrknownas varchar(50), 
  newusraddress varchar(50), 
  newusrprimaryemail varchar(50), 
  newusrsecondaryemail varchar(50), 
  newusrmobile varchar(50), 
  newusrwhatsapp varchar(50), 
  newusrlandphone varchar(50), 
  newusrmfaactivated int, 
  newusrssoactivated int, 
  newusrnotes varchar(250), 
  newusrroledid UUID

)
language plpgsql    
as $$
begin
insert into public.tblusers
(

usrid, 
usrfirstname, 
usrlastname, 
usrknownas, 
usraddress, 
usrprimaryemail, 
usrsecondaryemail, 
usrmobile, 
usrwhatsapp, 
usrlandphone, 
usrmfaactivated, 
usrssoactivated, 
usrnotes, 
usrisdeleted, 
usrroledid,
usrCreatedOn
)
(
select gen_random_uuid(), 
newusrfirstname, 
newusrlastname, 
newusrknownas, 
newusraddress, 
newusrprimaryemail, 
newusrsecondaryemail, 
newusrmobile, 
newusrwhatsapp, 
newusrlandphone, 
0, 
0, 
'New user created', 
0, 
usrroledid,
now()
);
	
    commit;
   
   
   
   
   
   
end;$$;

 


--

-- PROCEDURE TO INSERT INTO FACILITY TYPE



create or replace procedure spInsertToFacilityType
(
 
 
	newFltytypename varchar(50)  ,
	newFltytypedescription varchar(500)  ,
	newFltyisdeleted int4 

)

language plpgsql    
as $$
begin
insert into public.tblfacilities
(
fltytypeid, 
fltytypename, 
fltytypedescription, 
fltyisdeleted
)
(
select gen_random_uuid(), 
	newFltytypename    ,
	newFltytypedescription   ,
	newFltyisdeleted   
);
	
    commit;
   
end;$$;


-- PROCEDURE TO INSERT INTO FACILITIES




create or replace procedure spInsertToFacilities
(
   
	newFltyid uuid,
	newFltytype uuid  ,
	newFltyowner uuid  ,
	newFltyname varchar(50)  ,
	newFltydescription varchar(500)  ,
	newFltyaddress varchar(250)  ,
	newFltytelephone varchar(50)  ,
	newFltyemail varchar(50)  ,
	newFltywebsite varchar(50)  ,
	newFltybankname varchar(100)  ,
	newFltybankaccountname varchar(50)  ,
	newFltybankaccountnumber varchar(40)  ,
	newFltybanksortcode varchar(10)  ,
	newFltybankifsccode varchar(25)  ,
	newFltyisdeleted int4      ,
	newFltyactive int4   ,
	newFltybankiban varchar(50)  ,
	newFltyrate float8   ,
	newFltycurrency varchar(10)

)

language plpgsql    
as $$
begin
insert into public.tblfacilities
(
	fltyid ,
	fltytype ,
	fltyowner ,
	fltyname ,
	fltydescription ,
	fltyaddress ,
	fltytelephone ,
	fltyemail ,
	fltywebsite ,
	fltybankname ,
	fltybankaccountname ,
	fltybankaccountnumber ,
	fltybanksortcode ,
	fltybankifsccode ,
	fltyisdeleted ,
	fltyactive ,
	fltybankiban ,
	fltyrate ,
	fltycurrency ,
	fltyCreatedOn
)
values
(
 	newFltyid, 
	newFltytype,
	newFltyowner,
	newFltyname ,
	newFltydescription ,
	newFltyaddress ,
	newFltytelephone ,
	newFltyemail ,
	newFltywebsite ,
	newFltybankname ,
	newFltybankaccountname ,
	newFltybankaccountnumber ,
	newFltybanksortcode,
	newFltybankifsccode ,
	newFltyisdeleted ,
	newFltyactive ,
	newFltybankiban ,
	newFltyrate ,
	newFltycurrency  ,
	now()
);
	
    commit;
   
end;$$;






-- PROCEDURE TO INSERT INTO FACILITYBOOKING




create or replace procedure spInsertToFacilityBooking
(
 
  
	newFltybookedon timestamp  ,
	newFltybookedby uuid  ,
	newFltybookingdate timestamp  ,
	newFltybookinghoursfrom int4  ,
	newFltybookinghoursto int4  ,
	newFltybookingapproved int4      ,
	newFltybookingapprovedon timestamp  ,
	newFltybookingisdeleted int4     ,
	newFltybookingnotes varchar(250)  ,
	newFltybookingpaid int4   ,
	newFltyid uuid  ,
	newFltybookingrate float8  ,
	newFltybookingamountpaid float8
 

)

language plpgsql    
as $$
begin
insert into public.tblfacilitybooking
(
 	fltybookingid ,
	fltybookedon ,
	fltybookedby ,
	fltybookingdate ,
	fltybookinghoursfrom ,
	fltybookinghoursto ,
	fltybookingapproved ,
	fltybookingapprovedon ,
	fltybookingisdeleted ,
	fltybookingnotes ,
	fltybookingpaid,
	fltyid ,
	fltybookingrate ,
	fltybookingamountpaid 

)
(
select gen_random_uuid(), 
	newFltybookedon    ,
	newFltybookedby    ,
	newFltybookingdate    ,
	newFltybookinghoursfrom    ,
	newFltybookinghoursto    ,
	newFltybookingapproved        ,
	newFltybookingapprovedon    ,
	newFltybookingisdeleted       ,
	newFltybookingnotes     ,
	newFltybookingpaid     ,
	newFltyid    ,
	newFltybookingrate    ,
	newFltybookingamountpaid  
 



);
	
    commit;
   
end;$$;



-- PROCEDURE TO INSERT INTO FACILITYATTACHMENTS




create or replace procedure spInsertToFacilityAttachments
(
 
 
	
	newFltyid uuid  ,
	newFltyattachmentname varchar(250)  ,
	newFltyattachmentpath varchar(250)  ,
	newFltyattachmentapproved int4     ,
	newFltyattachmentisdeleted int4   

)

language plpgsql    
as $$
begin
insert into public.tblfacilityattachments
(
	fltyattachmentid ,
	fltyid ,
	fltyattachmentname ,
	fltyattachmentpath ,
	fltyattachmentapproved ,
	fltyattachmentisdeleted  ,
	fltyattachmentUploadedOn
)
 
(

	select gen_random_uuid(), 
	newFltyid ,
	newFltyattachmentname,
	newFltyattachmentpath ,
	newFltyattachmentapproved ,
	newFltyattachmentisdeleted   ,
	now()
);
	
    commit;
   
end;$$;



-- PROCEDURE TO UPDATE ROLE


create or replace   procedure spUpdateRole
 (
updateRoleid UUID,
updateRoleName varchar(50)
)
 
language plpgsql    
as $$
begin
 

update public.tblroles
set rolename =updateRoleName 
where Roleid=updateRoleid;

 
	
    commit;
end;$$;



--PROCEDURE TO UPDATE USER


create or replace procedure spInsertToUser
(
 
  usrIdToUpdate UUID,
  newusrfirstname varchar(50),
  newusrlastname varchar(50), 
  newusrknownas varchar(50), 
  newusraddress varchar(50), 
  newusrprimaryemail varchar(50), 
  newusrsecondaryemail varchar(50), 
  newusrmobile varchar(50), 
  newusrwhatsapp varchar(50), 
  newusrlandphone varchar(50), 
  newusrmfaactivated int, 
  newusrssoactivated int, 
  newusrnotes varchar(250), 
  newusrroledid UUID

)
language plpgsql    
as $$
begin
update public.tblusers
set
usrfirstname = newusrfirstname , 
usrlastname = newusrlastname, 
usrknownas = newusrlastname, 
usraddress = newusraddress, 
usrprimaryemail= newusrprimaryemail, 
usrsecondaryemail= newusrsecondaryemail , 
usrmobile= newusrmobile , 
usrwhatsapp  = newusrwhatsapp, 
usrlandphone = newusrlandphone, 
usrmfaactivated = newusrmfaactivated, 
usrssoactivated = newusrssoactivated, 
usrnotes = newusrnotes, 
usrroledid = newusrroledid,
usrLastUpdatedOn = now()
where usrid= usrIdToUpdate;

    commit;
   
end;$$;



--PROCEDURE TO UPDATE FACILITY






create or replace procedure spUpdateFacilities
(
   
	fltyidToUpdate uuid,
	newFltytype uuid  ,
	newFltyowner uuid  ,
	newFltyname varchar(50)  ,
	newFltydescription varchar(500)  ,
	newFltyaddress varchar(250)  ,
	newFltytelephone varchar(50)  ,
	newFltyemail varchar(50)  ,
	newFltywebsite varchar(50)  ,
	newFltybankname varchar(100)  ,
	newFltybankaccountname varchar(50)  ,
	newFltybankaccountnumber varchar(40)  ,
	newFltybanksortcode varchar(10)  ,
	newFltybankifsccode varchar(25)  ,
	newFltyisdeleted int4      ,
	newFltyactive int4   ,
	newFltybankiban varchar(50)  ,
	newFltyrate float8   ,
	newFltycurrency varchar(10)

)

language plpgsql    
as $$
begin
 update  public.tblfacilities
 set  
	
	fltytype= newFltytype ,
	fltyowner = newFltyowner,
	fltyname = newFltyname,
	fltydescription= newFltydescription ,
	fltyaddress = newFltyaddress,
	fltytelephone= newFltytelephone ,
	fltyemail = newFltyemail,
	fltywebsite=newFltywebsite  ,
	fltybankname =newFltybankname,
	fltybankaccountname = newFltybankaccountnumber,
	fltybankaccountnumber= newFltybankaccountnumber ,
	fltybanksortcode = newFltybanksortcode,
	fltybankifsccode = newFltybankifsccode ,
	fltybankiban = newFltybankiban,
	fltyrate = newFltyrate,
	fltycurrency= newFltycurrency ,
	fltyUpdatedOn= now()
	where fltyid=fltyidToUpdate
;
	
    commit;
   
end;$$;




--PROCEDURE TO ACTIVATE FACILITY





create or replace   procedure spActivateFacilitie
(
   
	fltyidToActivate uuid

)

language plpgsql    
as $$
begin
 update  public.tblfacilities
 set  
	fltyactive=1,
	fltyActivatedOn= now()
	where fltyid=fltyidToActivate
;
	
    commit;
   
end;$$;









--PROCEDURE TO INSERT INTO  tblLanguages
create or replace procedure spInsertToLanguages
 (
	newLanName varchar(50) ,
	newLanDescription varchar(500)  
)
 
language plpgsql    
as $$
begin
 

insert into public.tblLanguages
(
lanID ,
lanName ,
lanDescription ,
lanIsDeleted
)
(
	select gen_random_uuid(), 
	newLanName  ,
	newLanDescription  ,
	0
	
)	;
	
    commit;
end;$$;



--PROCEDURE TO INSERT INTO  tblControls

create or replace procedure spInsertToControls
 (
	newCtrName varchar(50) ,
	newCtrDescription varchar(500)  
)
 
language plpgsql    
as $$
begin
 

insert into public.tblControls
(
ctrID,
ctrName ,
ctrDescription ,
ctrIsDeleted 
)
(
	select gen_random_uuid(), 
	newCtrName  ,
	newCtrDescription  ,
	0
	
)	;
	
    commit;
end;$$;


--PROCEDURE TO INSERT INTO  tblControlDisplay

create or replace procedure spInsertToControlsToDisplay
 (
	newCtrdspCtrID  uuid,
	newCtrdsplanID uuid,
	newCtrdspText varchar(50)
 	
)
 
language plpgsql    
as $$
begin
 

insert into public.tblControlDisplay
(
ctrddspID ,
ctrdspCtrID ,
ctrdsplanID,
ctrdspText ,
ctrdspIsDeleted 

)
(
	select gen_random_uuid(), 
	newCtrdspCtrID ,
	newCtrdsplanID,
	newCtrdspText ,
	0 
	
)	;
	
    commit;
end;$$;





--PROCEDURE TO UPDATE INTO  tblLanguages

create or replace   procedure spUpdatelLanguages
 (
newlanID uuid  ,
newlanName varchar(50)  ,
newlanDescription varchar(500)  ,
newlanIsDeleted int  
)
 
language plpgsql    
as $$
begin
update  tblLanguages set
lanName =newlanName,
lanDescription =  newlanDescription,
lanIsDeleted = newlanIsDeleted
where lanID= newlanID;
     commit;
end;$$;




--PROCEDURE TO UPDATE INTO  tblControls
create or replace   procedure spUpdatelControls
 (
newctrID uuid  ,
newctrName varchar(50)  ,
newctrDescription varchar(500)  ,
newctrIsDeleted int  
)
 
language plpgsql    
as $$
begin
update  tblControls set
ctrName =newctrName,
ctrDescription =newctrDescription,
ctrIsDeleted =newctrIsDeleted
where ctrID= newctrID;
     commit;
end;$$;



--PROCEDURE TO UPDATE  INTO  tblControlDisplay
create or replace   procedure spUpdatelControlDisplay
 (
updatedctrddspID uuid  ,
newctrdspCtrID uuid    ,
newctrdsplanID uuid   ,
newctrdspText varchar(250),
newctrdspIsDeleted int
)
 
language plpgsql    
as $$
begin
update  tblControlDisplay set
ctrdspCtrID =newctrdspCtrID,
ctrdsplanID =newctrdsplanID,
ctrdspText =newctrdspText,
ctrdspIsDeleted= newctrdspIsDeleted
where ctrddspID= updatedctrddspID;
     commit;
end;$$;





--PROCEDURE TO DELETE  tblLanguages

create or replace   procedure spDeleteLanguages
 (
deletelanID uuid 
)
 
language plpgsql    
as $$
begin
update  tblLanguages set
lanIsDeleted = 1
where lanID= deletelanID;
     commit;
end;$$;




--PROCEDURE TO DELETE  tblControls
create or replace   procedure spDeleteControls
 (
deletectrID uuid 
)
 
language plpgsql    
as $$
begin
update  tblControls set
ctrIsDeleted = 1
where ctrID= deletectrID;
     commit;
end;$$;






--PROCEDURE TO DELETE  tblControlDisplay

create or replace   procedure spDeleteControlDisplay
 (
deletectrddspID uuid 
)
 
language plpgsql    
as $$
begin
update  tblControlDisplay set
ctrdspIsDeleted = 1
where ctrID= deletectrID;
     commit;
end;$$;






-- PROCEDURE TO LIST ALL CONTROLDISPLAY
create or replace   procedure spShowAllControldisplay()

language plpgsql    
as $$
begin
SELECT 
d.ctrddspid as ControlDisplayID, 
d.ctrdspctrid as ControlDisplayControlID, 
c.ctrname  as ControlsDisplayControlName, 
d.ctrdsplanid as ControlDisplayLanguageID, 
l.landescription as ControlDisplayLaguageName, 
d.ctrdsptext  as ControlDisplayText
FROM public.tblcontroldisplay d
left join public.tblcontrols c on c.ctrid=ctrdspctrid
left join public.tbllanguages l on l.lanid=d.ctrdsplanid
where d.ctrdspisdeleted=0;

     commit;
end;$$;


-- PROCEDURE TO SHOW SELECTED CONTROLDISPLAY
create or replace   procedure spShowAllControldisplay( selectedctrddspid uuid)

language plpgsql    
as $$
begin
SELECT 
d.ctrddspid as ControlDisplayID, 
d.ctrdspctrid as ControlDisplayControlID, 
c.ctrname  as ControlsDisplayControlName, 
d.ctrdsplanid as ControlDisplayLanguageID, 
l.landescription as ControlDisplayLaguageName, 
d.ctrdsptext  as ControlDisplayText
FROM public.tblcontroldisplay d
left join public.tblcontrols c on c.ctrid=ctrdspctrid
left join public.tbllanguages l on l.lanid=d.ctrdsplanid
where d.ctrdspisdeleted=0 and d.ctrddspid =selectedctrddspid;

     commit;
end;$$;












