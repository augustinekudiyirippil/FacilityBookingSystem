PGDMP  	            
    	    |           FacilityManagement    16.0    16.0 V    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    111411    FacilityManagement    DATABASE     �   CREATE DATABASE "FacilityManagement" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 $   DROP DATABASE "FacilityManagement";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            /           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1255    235693    deleteuserrole(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.deleteuserrole(IN updateroleid uuid)
    LANGUAGE plpgsql
    AS $$
begin
 

update public.tblroles
set roleisdeleted  =1 
where roleid= updateRoleid;

 
	
    commit;
end;$$;
 <   DROP PROCEDURE public.deleteuserrole(IN updateroleid uuid);
       public          postgres    false    4            �            1255    235689    fngetalluserroles()    FUNCTION       CREATE FUNCTION public.fngetalluserroles() RETURNS TABLE(frroleid uuid, fmrolenumber integer, fmrolename character varying)
    LANGUAGE plpgsql
    AS $$  
 DECLARE

BEGIN
 RETURN QUERY
SELECT roleid, rolenumber, rolename
FROM public.tblroles where roleisdeleted=0;
END;
$$;
 *   DROP FUNCTION public.fngetalluserroles();
       public          postgres    false    4                       1255    235692    fngetseleteduserrole(uuid)    FUNCTION     L  CREATE FUNCTION public.fngetseleteduserrole(selectedroleid uuid) RETURNS TABLE(frroleid uuid, fmrolenumber integer, fmrolename character varying)
    LANGUAGE plpgsql
    AS $$  
 DECLARE

BEGIN
 RETURN QUERY
SELECT roleid, rolenumber, rolename
FROM public.tblroles where roleisdeleted=0 and roleid=selectedRoleID;
END;
$$;
 @   DROP FUNCTION public.fngetseleteduserrole(selectedroleid uuid);
       public          postgres    false    4            �            1255    120973    gen_random_uuid()    FUNCTION     �   CREATE FUNCTION public.gen_random_uuid() RETURNS uuid
    LANGUAGE sql
    AS $$ SELECT md5(random()::text || clock_timestamp()::text)::uuid $$;
 (   DROP FUNCTION public.gen_random_uuid();
       public          postgres    false    4            
           1255    121031    spactivatefacilitie(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.spactivatefacilitie(IN fltyidtoactivate uuid)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilities
 set  
	fltyactive=1,
	fltyActivatedOn= now()
	where fltyid=fltyidToActivate
;
	
    commit;
   
end;$$;
 E   DROP PROCEDURE public.spactivatefacilitie(IN fltyidtoactivate uuid);
       public          postgres    false    4            �            1255    235656    spaddrole(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.spaddrole(IN newrolename character varying)
    LANGUAGE plpgsql
    AS $$
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
 C   DROP PROCEDURE public.spaddrole(IN newrolename character varying);
       public          postgres    false    4                       1255    121033 @   spapprovefacilitiesattachments(uuid, integer, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spapprovefacilitiesattachments(IN fltyattachmentidtoupdate uuid, IN newfltyattachmentapproved integer, IN newfltyattachmentcomments character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilityattachments
 set  
	 fltyattachmentapproved = newfltyattachmentapproved, 
	 fltyattachmentcomments = newfltyattachmentcomments, 
	 fltyattachmentapprovedon = now 
	where fltyattachmentid=fltyAttachmentIdToUpdate
;
	
    commit;
   
end;$$;
 �   DROP PROCEDURE public.spapprovefacilitiesattachments(IN fltyattachmentidtoupdate uuid, IN newfltyattachmentapproved integer, IN newfltyattachmentcomments character varying);
       public          postgres    false    4            �            1255    129202    spdeletecontroldisplay(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.spdeletecontroldisplay(IN deletectrddspid uuid)
    LANGUAGE plpgsql
    AS $$
begin
update  tblControlDisplay set
ctrdspIsDeleted = 1
where ctrID= deletectrID;
     commit;
end;$$;
 G   DROP PROCEDURE public.spdeletecontroldisplay(IN deletectrddspid uuid);
       public          postgres    false    4            �            1255    129201    spdeletecontrols(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.spdeletecontrols(IN deletectrid uuid)
    LANGUAGE plpgsql
    AS $$
begin
update  tblControls set
ctrIsDeleted = 1
where ctrID= deletectrID;
     commit;
end;$$;
 =   DROP PROCEDURE public.spdeletecontrols(IN deletectrid uuid);
       public          postgres    false    4                       1255    121036 )   spdeletefacility(uuid, character varying) 	   PROCEDURE     -  CREATE PROCEDURE public.spdeletefacility(IN fltyidtodelete uuid, IN newfltycomments character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilities
 set  
	 fltyisdeleted = 1, 
	 fltycomments = newfltycomments  
	where fltyid=fltyidToDelete ;
	
    commit;
   
end;$$;
 f   DROP PROCEDURE public.spdeletefacility(IN fltyidtodelete uuid, IN newfltycomments character varying);
       public          postgres    false    4                       1255    121038 4   spdeletefacilityattachments(uuid, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spdeletefacilityattachments(IN fltyattachmentidtodelete uuid, IN newfltyattachmentcomments character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilityattachments
 set  
	 fltyattachmentisdeleted = 1, 
	 fltyattachmentcomments = newfltyattachmentcomments  
	where fltyattachmentid=fltyattachmentidToDelete ;
	
    commit;
   
end;$$;
 �   DROP PROCEDURE public.spdeletefacilityattachments(IN fltyattachmentidtodelete uuid, IN newfltyattachmentcomments character varying);
       public          postgres    false    4                       1255    121037 0   spdeletefacilitybooking(uuid, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spdeletefacilitybooking(IN fltybookingidtodelete uuid, IN newfltybookingcancelledcomments character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilitybooking
 set  
	 fltybookingisdeleted = 1, 
	 fltybookingcancelledcomments = newfltybookingcancelledcomments  
	where fltybookingid=fltybookingidToDelete ;
	
    commit;
   
end;$$;
 �   DROP PROCEDURE public.spdeletefacilitybooking(IN fltybookingidtodelete uuid, IN newfltybookingcancelledcomments character varying);
       public          postgres    false    4                       1255    121035 -   spdeletefacilitytype(uuid, character varying) 	   PROCEDURE     C  CREATE PROCEDURE public.spdeletefacilitytype(IN fltytypeidtodelete uuid, IN newfltytypenotes character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilitytypes
 set  
	 fltyisdeleted = 1, 
	 fltytypenotes = newfltyTypeNotes  
	where fltytypeid=fltytypeidToDelete ;
	
    commit;
   
end;$$;
 o   DROP PROCEDURE public.spdeletefacilitytype(IN fltytypeidtodelete uuid, IN newfltytypenotes character varying);
       public          postgres    false    4            �            1255    129200    spdeletelanguages(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.spdeletelanguages(IN deletelanid uuid)
    LANGUAGE plpgsql
    AS $$
begin
update  tblLanguages set
lanIsDeleted = 1
where lanID= deletelanID;
     commit;
end;$$;
 >   DROP PROCEDURE public.spdeletelanguages(IN deletelanid uuid);
       public          postgres    false    4                       1255    121034 %   spdeleteuser(uuid, character varying) 	   PROCEDURE     %  CREATE PROCEDURE public.spdeleteuser(IN usridtodelete uuid, IN newusrnotes character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblusers
 set  
	 usrisdeleted = 1, 
	 usrnotes = newUsrNotes  
	where fltybookingid=fltybookingidToUpdate
;
	
    commit;
   
end;$$;
 ]   DROP PROCEDURE public.spdeleteuser(IN usridtodelete uuid, IN newusrnotes character varying);
       public          postgres    false    4            �            1255    129192 8   spinserttocontrols(character varying, character varying) 	   PROCEDURE     e  CREATE PROCEDURE public.spinserttocontrols(IN newctrname character varying, IN newctrdescription character varying)
    LANGUAGE plpgsql
    AS $$
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
 s   DROP PROCEDURE public.spinserttocontrols(IN newctrname character varying, IN newctrdescription character varying);
       public          postgres    false    4            �            1255    129193 :   spinserttocontrolstodisplay(uuid, uuid, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spinserttocontrolstodisplay(IN newctrdspctrid uuid, IN newctrdsplanid uuid, IN newctrdsptext character varying)
    LANGUAGE plpgsql
    AS $$
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
 �   DROP PROCEDURE public.spinserttocontrolstodisplay(IN newctrdspctrid uuid, IN newctrdsplanid uuid, IN newctrdsptext character varying);
       public          postgres    false    4                        1255    121012 ;  spinserttofacilities(uuid, uuid, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, double precision, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spinserttofacilities(IN newfltytype uuid, IN newfltyowner uuid, IN newfltyname character varying, IN newfltydescription character varying, IN newfltyaddress character varying, IN newfltytelephone character varying, IN newfltyemail character varying, IN newfltywebsite character varying, IN newfltybankname character varying, IN newfltybankaccountname character varying, IN newfltybankaccountnumber character varying, IN newfltybanksortcode character varying, IN newfltybankifsccode character varying, IN newfltyisdeleted integer, IN newfltyactive integer, IN newfltybankiban character varying, IN newfltyrate double precision, IN newfltycurrency character varying)
    LANGUAGE plpgsql
    AS $$
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
	fltycurrency 
)
(
select gen_random_uuid(), 
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
	newFltycurrency  
);
	
    commit;
   
end;$$;
 �  DROP PROCEDURE public.spinserttofacilities(IN newfltytype uuid, IN newfltyowner uuid, IN newfltyname character varying, IN newfltydescription character varying, IN newfltyaddress character varying, IN newfltytelephone character varying, IN newfltyemail character varying, IN newfltywebsite character varying, IN newfltybankname character varying, IN newfltybankaccountname character varying, IN newfltybankaccountnumber character varying, IN newfltybanksortcode character varying, IN newfltybankifsccode character varying, IN newfltyisdeleted integer, IN newfltyactive integer, IN newfltybankiban character varying, IN newfltyrate double precision, IN newfltycurrency character varying);
       public          postgres    false    4                       1255    121018 A  spinserttofacilities(uuid, uuid, uuid, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, double precision, character varying) 	   PROCEDURE       CREATE PROCEDURE public.spinserttofacilities(IN newfltyid uuid, IN newfltytype uuid, IN newfltyowner uuid, IN newfltyname character varying, IN newfltydescription character varying, IN newfltyaddress character varying, IN newfltytelephone character varying, IN newfltyemail character varying, IN newfltywebsite character varying, IN newfltybankname character varying, IN newfltybankaccountname character varying, IN newfltybankaccountnumber character varying, IN newfltybanksortcode character varying, IN newfltybankifsccode character varying, IN newfltyisdeleted integer, IN newfltyactive integer, IN newfltybankiban character varying, IN newfltyrate double precision, IN newfltycurrency character varying)
    LANGUAGE plpgsql
    AS $$
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
 �  DROP PROCEDURE public.spinserttofacilities(IN newfltyid uuid, IN newfltytype uuid, IN newfltyowner uuid, IN newfltyname character varying, IN newfltydescription character varying, IN newfltyaddress character varying, IN newfltytelephone character varying, IN newfltyemail character varying, IN newfltywebsite character varying, IN newfltybankname character varying, IN newfltybankaccountname character varying, IN newfltybankaccountnumber character varying, IN newfltybanksortcode character varying, IN newfltybankifsccode character varying, IN newfltyisdeleted integer, IN newfltyactive integer, IN newfltybankiban character varying, IN newfltyrate double precision, IN newfltycurrency character varying);
       public          postgres    false    4                       1255    121023 [   spinserttofacilityattachments(uuid, character varying, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.spinserttofacilityattachments(IN newfltyid uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying, IN newfltyattachmentapproved integer, IN newfltyattachmentisdeleted integer)
    LANGUAGE plpgsql
    AS $$
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
 �   DROP PROCEDURE public.spinserttofacilityattachments(IN newfltyid uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying, IN newfltyattachmentapproved integer, IN newfltyattachmentisdeleted integer);
       public          postgres    false    4                       1255    121021 a   spinserttofacilityattachments(uuid, uuid, character varying, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.spinserttofacilityattachments(IN newfltyattachmentid uuid, IN newfltyid uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying, IN newfltyattachmentapproved integer, IN newfltyattachmentisdeleted integer)
    LANGUAGE plpgsql
    AS $$
begin
insert into public.tblfacilityattachments
(
	fltyattachmentid ,
	fltyid ,
	fltyattachmentname ,
	fltyattachmentpath ,
	fltyattachmentapproved ,
	fltyattachmentisdeleted  
)
values
(

	newFltyattachmentid ,
	newFltyid ,
	newFltyattachmentname,
	newFltyattachmentpath ,
	newFltyattachmentapproved ,
	newFltyattachmentisdeleted   
);
	
    commit;
   
end;$$;
 
  DROP PROCEDURE public.spinserttofacilityattachments(IN newfltyattachmentid uuid, IN newfltyid uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying, IN newfltyattachmentapproved integer, IN newfltyattachmentisdeleted integer);
       public          postgres    false    4                       1255    121013 �   spinserttofacilitybooking(timestamp without time zone, uuid, timestamp without time zone, integer, integer, integer, timestamp without time zone, integer, character varying, integer, uuid, double precision, double precision) 	   PROCEDURE     P  CREATE PROCEDURE public.spinserttofacilitybooking(IN newfltybookedon timestamp without time zone, IN newfltybookedby uuid, IN newfltybookingdate timestamp without time zone, IN newfltybookinghoursfrom integer, IN newfltybookinghoursto integer, IN newfltybookingapproved integer, IN newfltybookingapprovedon timestamp without time zone, IN newfltybookingisdeleted integer, IN newfltybookingnotes character varying, IN newfltybookingpaid integer, IN newfltyid uuid, IN newfltybookingrate double precision, IN newfltybookingamountpaid double precision)
    LANGUAGE plpgsql
    AS $$
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
 %  DROP PROCEDURE public.spinserttofacilitybooking(IN newfltybookedon timestamp without time zone, IN newfltybookedby uuid, IN newfltybookingdate timestamp without time zone, IN newfltybookinghoursfrom integer, IN newfltybookinghoursto integer, IN newfltybookingapproved integer, IN newfltybookingapprovedon timestamp without time zone, IN newfltybookingisdeleted integer, IN newfltybookingnotes character varying, IN newfltybookingpaid integer, IN newfltyid uuid, IN newfltybookingrate double precision, IN newfltybookingamountpaid double precision);
       public          postgres    false    4            �            1255    121010 E   spinserttofacilitytype(character varying, character varying, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.spinserttofacilitytype(IN newfltytypename character varying, IN newfltytypedescription character varying, IN newfltyisdeleted integer)
    LANGUAGE plpgsql
    AS $$
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
 �   DROP PROCEDURE public.spinserttofacilitytype(IN newfltytypename character varying, IN newfltytypedescription character varying, IN newfltyisdeleted integer);
       public          postgres    false    4                       1255    121020 Z   spinserttofacilitytype(uuid, uuid, character varying, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.spinserttofacilitytype(IN newfltyattachmentid uuid, IN newfltyid uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying, IN newfltyattachmentapproved integer, IN newfltyattachmentisdeleted integer)
    LANGUAGE plpgsql
    AS $$
begin
insert into public.tblfacilityattachments
(
	fltyattachmentid ,
	fltyid ,
	fltyattachmentname ,
	fltyattachmentpath ,
	fltyattachmentapproved ,
	fltyattachmentisdeleted  
)
values
(

	newFltyattachmentid ,
	newFltyid ,
	newFltyattachmentname,
	newFltyattachmentpath ,
	newFltyattachmentapproved ,
	newFltyattachmentisdeleted   
);
	
    commit;
   
end;$$;
   DROP PROCEDURE public.spinserttofacilitytype(IN newfltyattachmentid uuid, IN newfltyid uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying, IN newfltyattachmentapproved integer, IN newfltyattachmentisdeleted integer);
       public          postgres    false    4            �            1255    129191 9   spinserttolanguages(character varying, character varying) 	   PROCEDURE     g  CREATE PROCEDURE public.spinserttolanguages(IN newlanname character varying, IN newlandescription character varying)
    LANGUAGE plpgsql
    AS $$
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
 t   DROP PROCEDURE public.spinserttolanguages(IN newlanname character varying, IN newlandescription character varying);
       public          postgres    false    4            �            1255    120976 !   spinserttorole(character varying) 	   PROCEDURE       CREATE PROCEDURE public.spinserttorole(IN newrolename character varying)
    LANGUAGE plpgsql
    AS $$
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
 H   DROP PROCEDURE public.spinserttorole(IN newrolename character varying);
       public          postgres    false    4                       1255    120977 �   spinserttouser(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, uuid) 	   PROCEDURE     p  CREATE PROCEDURE public.spinserttouser(IN newusrfirstname character varying, IN newusrlastname character varying, IN newusrknownas character varying, IN newusraddress character varying, IN newusrprimaryemail character varying, IN newusrsecondaryemail character varying, IN newusrmobile character varying, IN newusrwhatsapp character varying, IN newusrlandphone character varying, IN newusrmfaactivated integer, IN newusrssoactivated integer, IN newusrnotes character varying, IN newusrroledid uuid)
    LANGUAGE plpgsql
    AS $$
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
 �  DROP PROCEDURE public.spinserttouser(IN newusrfirstname character varying, IN newusrlastname character varying, IN newusrknownas character varying, IN newusraddress character varying, IN newusrprimaryemail character varying, IN newusrsecondaryemail character varying, IN newusrmobile character varying, IN newusrwhatsapp character varying, IN newusrlandphone character varying, IN newusrmfaactivated integer, IN newusrssoactivated integer, IN newusrnotes character varying, IN newusrroledid uuid);
       public          postgres    false    4                       1255    121026 �   spinserttouser(uuid, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, uuid) 	   PROCEDURE     Z  CREATE PROCEDURE public.spinserttouser(IN usridtoupdate uuid, IN newusrfirstname character varying, IN newusrlastname character varying, IN newusrknownas character varying, IN newusraddress character varying, IN newusrprimaryemail character varying, IN newusrsecondaryemail character varying, IN newusrmobile character varying, IN newusrwhatsapp character varying, IN newusrlandphone character varying, IN newusrmfaactivated integer, IN newusrssoactivated integer, IN newusrnotes character varying, IN newusrroledid uuid)
    LANGUAGE plpgsql
    AS $$
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
 	  DROP PROCEDURE public.spinserttouser(IN usridtoupdate uuid, IN newusrfirstname character varying, IN newusrlastname character varying, IN newusrknownas character varying, IN newusraddress character varying, IN newusrprimaryemail character varying, IN newusrsecondaryemail character varying, IN newusrmobile character varying, IN newusrwhatsapp character varying, IN newusrlandphone character varying, IN newusrmfaactivated integer, IN newusrssoactivated integer, IN newusrnotes character varying, IN newusrroledid uuid);
       public          postgres    false    4                       1255    235657    spselectallroles() 	   PROCEDURE     �   CREATE PROCEDURE public.spselectallroles()
    LANGUAGE plpgsql
    AS $$
	 begin
	 execute 'SELECT roleid, rolenumber, rolename, roleisdeleted   FROM public.tblroles ;';
    commit;
end;$$;
 *   DROP PROCEDURE public.spselectallroles();
       public          postgres    false    4                       1255    129203    spshowallcontroldisplay() 	   PROCEDURE     *  CREATE PROCEDURE public.spshowallcontroldisplay()
    LANGUAGE plpgsql
    AS $$
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
 1   DROP PROCEDURE public.spshowallcontroldisplay();
       public          postgres    false    4            �            1255    129204    spshowallcontroldisplay(uuid) 	   PROCEDURE     b  CREATE PROCEDURE public.spshowallcontroldisplay(IN selectedctrddspid uuid)
    LANGUAGE plpgsql
    AS $$
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
 J   DROP PROCEDURE public.spshowallcontroldisplay(IN selectedctrddspid uuid);
       public          postgres    false    4            	           1255    121028 ?  spupdatefacilities(uuid, uuid, uuid, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, double precision, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spupdatefacilities(IN fltyidtoupdate uuid, IN newfltytype uuid, IN newfltyowner uuid, IN newfltyname character varying, IN newfltydescription character varying, IN newfltyaddress character varying, IN newfltytelephone character varying, IN newfltyemail character varying, IN newfltywebsite character varying, IN newfltybankname character varying, IN newfltybankaccountname character varying, IN newfltybankaccountnumber character varying, IN newfltybanksortcode character varying, IN newfltybankifsccode character varying, IN newfltyisdeleted integer, IN newfltyactive integer, IN newfltybankiban character varying, IN newfltyrate double precision, IN newfltycurrency character varying)
    LANGUAGE plpgsql
    AS $$
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
 �  DROP PROCEDURE public.spupdatefacilities(IN fltyidtoupdate uuid, IN newfltytype uuid, IN newfltyowner uuid, IN newfltyname character varying, IN newfltydescription character varying, IN newfltyaddress character varying, IN newfltytelephone character varying, IN newfltyemail character varying, IN newfltywebsite character varying, IN newfltybankname character varying, IN newfltybankaccountname character varying, IN newfltybankaccountnumber character varying, IN newfltybanksortcode character varying, IN newfltybankifsccode character varying, IN newfltyisdeleted integer, IN newfltyactive integer, IN newfltybankiban character varying, IN newfltyrate double precision, IN newfltycurrency character varying);
       public          postgres    false    4            �            1255    129199 E   spupdatelcontroldisplay(uuid, uuid, uuid, character varying, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.spupdatelcontroldisplay(IN updatedctrddspid uuid, IN newctrdspctrid uuid, IN newctrdsplanid uuid, IN newctrdsptext character varying, IN newctrdspisdeleted integer)
    LANGUAGE plpgsql
    AS $$
begin
update  tblControlDisplay set
ctrdspCtrID =newctrdspCtrID,
ctrdsplanID =newctrdsplanID,
ctrdspText =newctrdspText,
ctrdspIsDeleted= newctrdspIsDeleted
where ctrddspID= updatedctrddspID;
     commit;
end;$$;
 �   DROP PROCEDURE public.spupdatelcontroldisplay(IN updatedctrddspid uuid, IN newctrdspctrid uuid, IN newctrdsplanid uuid, IN newctrdsptext character varying, IN newctrdspisdeleted integer);
       public          postgres    false    4            �            1255    129197 F   spupdatelcontrols(uuid, character varying, character varying, integer) 	   PROCEDURE     h  CREATE PROCEDURE public.spupdatelcontrols(IN newctrid uuid, IN newctrname character varying, IN newctrdescription character varying, IN newctrisdeleted integer)
    LANGUAGE plpgsql
    AS $$
begin
update  tblControls set
ctrName =newctrName,
ctrDescription =newctrDescription,
ctrIsDeleted =newctrIsDeleted
where ctrID= newctrID;
     commit;
end;$$;
 �   DROP PROCEDURE public.spupdatelcontrols(IN newctrid uuid, IN newctrname character varying, IN newctrdescription character varying, IN newctrisdeleted integer);
       public          postgres    false    4            �            1255    129195 G   spupdatellanguages(uuid, character varying, character varying, integer) 	   PROCEDURE     m  CREATE PROCEDURE public.spupdatellanguages(IN newlanid uuid, IN newlanname character varying, IN newlandescription character varying, IN newlanisdeleted integer)
    LANGUAGE plpgsql
    AS $$
begin
update  tblLanguages set
lanName =newlanName,
lanDescription =  newlanDescription,
lanIsDeleted = newlanIsDeleted
where lanID= newlanID;
     commit;
end;$$;
 �   DROP PROCEDURE public.spupdatellanguages(IN newlanid uuid, IN newlanname character varying, IN newlandescription character varying, IN newlanisdeleted integer);
       public          postgres    false    4            �            1255    121025 %   spupdaterole(uuid, character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.spupdaterole(IN updateroleid uuid, IN updaterolename character varying)
    LANGUAGE plpgsql
    AS $$
begin
 

update public.tblroles
set rolename =updateRoleName 
where roleid= updateRoleid;

 
	
    commit;
end;$$;
 _   DROP PROCEDURE public.spupdaterole(IN updateroleid uuid, IN updaterolename character varying);
       public          postgres    false    4                       1255    121032 H   spupdtefacilitiesattachments(uuid, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.spupdtefacilitiesattachments(IN fltyattachmentidtoupdate uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying)
    LANGUAGE plpgsql
    AS $$
begin
 update  public.tblfacilityattachments
 set  
	 fltyattachmentname = newFltyAttachmentName, 
	 fltyattachmentpath = newFltyAttachmentPath, 
	 fltyattachmentUpdatedOn = now 
	where fltyattachmentid=fltyAttachmentIdToUpdate
;
	
    commit;
   
end;$$;
 �   DROP PROCEDURE public.spupdtefacilitiesattachments(IN fltyattachmentidtoupdate uuid, IN newfltyattachmentname character varying, IN newfltyattachmentpath character varying);
       public          postgres    false    4            �            1259    111525    fltybookingnumberseq    SEQUENCE     �   CREATE SEQUENCE public.fltybookingnumberseq
    START WITH 1001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.fltybookingnumberseq;
       public          postgres    false    4            �            1259    111521    fltynumberseq    SEQUENCE     v   CREATE SEQUENCE public.fltynumberseq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.fltynumberseq;
       public          postgres    false    4            �            1259    111527    rolenumberseq    SEQUENCE     y   CREATE SEQUENCE public.rolenumberseq
    START WITH 1001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.rolenumberseq;
       public          postgres    false    4            �            1259    129176    tblcontroldisplay    TABLE     �   CREATE TABLE public.tblcontroldisplay (
    ctrddspid uuid NOT NULL,
    ctrdspctrid uuid NOT NULL,
    ctrdsplanid uuid NOT NULL,
    ctrdsptext character varying(250),
    ctrdspisdeleted integer
);
 %   DROP TABLE public.tblcontroldisplay;
       public         heap    postgres    false    4            �            1259    129168    tblcontrols    TABLE     �   CREATE TABLE public.tblcontrols (
    ctrid uuid NOT NULL,
    ctrname character varying(50) NOT NULL,
    ctrdescription character varying(500),
    ctrisdeleted integer DEFAULT 0
);
    DROP TABLE public.tblcontrols;
       public         heap    postgres    false    4            �            1259    111470    tblfacilities    TABLE     �  CREATE TABLE public.tblfacilities (
    fltyid uuid NOT NULL,
    fltynumber integer DEFAULT nextval('public.fltynumberseq'::regclass),
    fltytype uuid,
    fltyowner uuid,
    fltyname character varying(50),
    fltydescription character varying(500),
    fltyaddress character varying(250),
    fltytelephone character varying(50),
    fltyemail character varying(50),
    fltywebsite character varying(50),
    fltybankname character varying(100),
    fltybankaccountname character varying(50),
    fltybankaccountnumber character varying(40),
    fltybanksortcode character varying(10),
    fltybankifsccode character varying(25),
    fltyisdeleted integer DEFAULT 0,
    fltyactive integer DEFAULT 0,
    fltybankiban character varying(50),
    fltyrate double precision,
    fltycurrency character varying(10),
    fltycreatedon timestamp without time zone,
    fltycomments character varying(1000),
    fltyupdatedon timestamp without time zone,
    fltyactivatedon timestamp without time zone
);
 !   DROP TABLE public.tblfacilities;
       public         heap    postgres    false    221    4            �            1259    111489    tblfacilityattachments    TABLE        CREATE TABLE public.tblfacilityattachments (
    fltyattachmentid uuid NOT NULL,
    fltyid uuid,
    fltyattachmentname character varying(250),
    fltyattachmentpath character varying(250),
    fltyattachmentapproved integer DEFAULT 0,
    fltyattachmentisdeleted integer DEFAULT 0,
    fltyattachmentuploadedon timestamp without time zone,
    fltyattachmentapprovedon timestamp without time zone,
    fltyattachmentcomments character varying(1000),
    fltyattachmentupdatedon timestamp without time zone
);
 *   DROP TABLE public.tblfacilityattachments;
       public         heap    postgres    false    4            �            1259    111503    tblfacilitybooking    TABLE     @  CREATE TABLE public.tblfacilitybooking (
    fltybookingid uuid NOT NULL,
    fltybookingnumber integer DEFAULT nextval('public.fltybookingnumberseq'::regclass),
    fltybookedon timestamp without time zone,
    fltybookedby uuid,
    fltybookingdate timestamp without time zone,
    fltybookinghoursfrom integer,
    fltybookinghoursto integer,
    fltybookingapproved integer DEFAULT 0,
    fltybookingapprovedon timestamp without time zone,
    fltybookingisdeleted integer DEFAULT 0,
    fltybookingnotes character varying(250),
    fltybookingpaid integer DEFAULT 0,
    fltyid uuid,
    fltybookingrate double precision,
    fltybookingamountpaid double precision,
    fltybookingiscancelled double precision,
    fltybookingcancelledon timestamp without time zone,
    fltybookingcancelledcomments character varying(1000)
);
 &   DROP TABLE public.tblfacilitybooking;
       public         heap    postgres    false    222    4            �            1259    111435    tblfacilitytypes    TABLE     �   CREATE TABLE public.tblfacilitytypes (
    fltytypeid uuid NOT NULL,
    fltytypename character varying(50),
    fltytypedescription character varying(500),
    fltyisdeleted integer DEFAULT 0,
    fltytypenotes character varying(1000)
);
 $   DROP TABLE public.tblfacilitytypes;
       public         heap    postgres    false    4            �            1259    129160    tbllanguages    TABLE     �   CREATE TABLE public.tbllanguages (
    lanid uuid NOT NULL,
    lanname character varying(50) NOT NULL,
    landescription character varying(500),
    lanisdeleted integer DEFAULT 0
);
     DROP TABLE public.tbllanguages;
       public         heap    postgres    false    4            �            1259    111429    tblroles    TABLE     �   CREATE TABLE public.tblroles (
    roleid uuid NOT NULL,
    rolenumber integer DEFAULT nextval('public.rolenumberseq'::regclass),
    rolename character varying(50),
    roleisdeleted integer DEFAULT 0
);
    DROP TABLE public.tblroles;
       public         heap    postgres    false    223    4            �            1259    111529    usrnumberseq    SEQUENCE     x   CREATE SEQUENCE public.usrnumberseq
    START WITH 1001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.usrnumberseq;
       public          postgres    false    4            �            1259    111443    tblusers    TABLE       CREATE TABLE public.tblusers (
    usrid uuid NOT NULL,
    usrnumber integer DEFAULT nextval('public.usrnumberseq'::regclass),
    usrfirstname character varying(50),
    usrlastname character varying(50),
    usrknownas character varying(50),
    usraddress character varying(250),
    usrprimaryemail character varying(50),
    usrsecondaryemail character varying(50),
    usrmobile character varying(50),
    usrwhatsapp character varying(50),
    usrlandphone character varying(50),
    usrmfaactivated integer DEFAULT 0,
    usrssoactivated integer DEFAULT 0,
    usrnotes character varying(250),
    usrisdeleted integer,
    usrroledid uuid,
    usrcreatedon timestamp without time zone,
    usrlastupdatedon timestamp without time zone,
    usrcomments character varying(1000)
);
    DROP TABLE public.tblusers;
       public         heap    postgres    false    224    4            (          0    129176    tblcontroldisplay 
   TABLE DATA           m   COPY public.tblcontroldisplay (ctrddspid, ctrdspctrid, ctrdsplanid, ctrdsptext, ctrdspisdeleted) FROM stdin;
    public          postgres    false    227   ��       '          0    129168    tblcontrols 
   TABLE DATA           S   COPY public.tblcontrols (ctrid, ctrname, ctrdescription, ctrisdeleted) FROM stdin;
    public          postgres    false    226   ��                 0    111470    tblfacilities 
   TABLE DATA           {  COPY public.tblfacilities (fltyid, fltynumber, fltytype, fltyowner, fltyname, fltydescription, fltyaddress, fltytelephone, fltyemail, fltywebsite, fltybankname, fltybankaccountname, fltybankaccountnumber, fltybanksortcode, fltybankifsccode, fltyisdeleted, fltyactive, fltybankiban, fltyrate, fltycurrency, fltycreatedon, fltycomments, fltyupdatedon, fltyactivatedon) FROM stdin;
    public          postgres    false    218   ��                  0    111489    tblfacilityattachments 
   TABLE DATA             COPY public.tblfacilityattachments (fltyattachmentid, fltyid, fltyattachmentname, fltyattachmentpath, fltyattachmentapproved, fltyattachmentisdeleted, fltyattachmentuploadedon, fltyattachmentapprovedon, fltyattachmentcomments, fltyattachmentupdatedon) FROM stdin;
    public          postgres    false    219   �       !          0    111503    tblfacilitybooking 
   TABLE DATA           �  COPY public.tblfacilitybooking (fltybookingid, fltybookingnumber, fltybookedon, fltybookedby, fltybookingdate, fltybookinghoursfrom, fltybookinghoursto, fltybookingapproved, fltybookingapprovedon, fltybookingisdeleted, fltybookingnotes, fltybookingpaid, fltyid, fltybookingrate, fltybookingamountpaid, fltybookingiscancelled, fltybookingcancelledon, fltybookingcancelledcomments) FROM stdin;
    public          postgres    false    220   9�                 0    111435    tblfacilitytypes 
   TABLE DATA           w   COPY public.tblfacilitytypes (fltytypeid, fltytypename, fltytypedescription, fltyisdeleted, fltytypenotes) FROM stdin;
    public          postgres    false    216   V�       &          0    129160    tbllanguages 
   TABLE DATA           T   COPY public.tbllanguages (lanid, lanname, landescription, lanisdeleted) FROM stdin;
    public          postgres    false    225   s�                 0    111429    tblroles 
   TABLE DATA           O   COPY public.tblroles (roleid, rolenumber, rolename, roleisdeleted) FROM stdin;
    public          postgres    false    215   ��                 0    111443    tblusers 
   TABLE DATA           $  COPY public.tblusers (usrid, usrnumber, usrfirstname, usrlastname, usrknownas, usraddress, usrprimaryemail, usrsecondaryemail, usrmobile, usrwhatsapp, usrlandphone, usrmfaactivated, usrssoactivated, usrnotes, usrisdeleted, usrroledid, usrcreatedon, usrlastupdatedon, usrcomments) FROM stdin;
    public          postgres    false    217   D�       0           0    0    fltybookingnumberseq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.fltybookingnumberseq', 1001, false);
          public          postgres    false    222            1           0    0    fltynumberseq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.fltynumberseq', 2, false);
          public          postgres    false    221            2           0    0    rolenumberseq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.rolenumberseq', 1004, true);
          public          postgres    false    223            3           0    0    usrnumberseq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usrnumberseq', 1001, false);
          public          postgres    false    224            �           2606    129180 (   tblcontroldisplay tblcontroldisplay_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tblcontroldisplay
    ADD CONSTRAINT tblcontroldisplay_pkey PRIMARY KEY (ctrddspid);
 R   ALTER TABLE ONLY public.tblcontroldisplay DROP CONSTRAINT tblcontroldisplay_pkey;
       public            postgres    false    227            �           2606    129175    tblcontrols tblcontrols_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tblcontrols
    ADD CONSTRAINT tblcontrols_pkey PRIMARY KEY (ctrid);
 F   ALTER TABLE ONLY public.tblcontrols DROP CONSTRAINT tblcontrols_pkey;
       public            postgres    false    226            z           2606    111478     tblfacilities tblfacilities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tblfacilities
    ADD CONSTRAINT tblfacilities_pkey PRIMARY KEY (fltyid);
 J   ALTER TABLE ONLY public.tblfacilities DROP CONSTRAINT tblfacilities_pkey;
       public            postgres    false    218            |           2606    111497 2   tblfacilityattachments tblfacilityattachments_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.tblfacilityattachments
    ADD CONSTRAINT tblfacilityattachments_pkey PRIMARY KEY (fltyattachmentid);
 \   ALTER TABLE ONLY public.tblfacilityattachments DROP CONSTRAINT tblfacilityattachments_pkey;
       public            postgres    false    219            ~           2606    111510 *   tblfacilitybooking tblfacilitybooking_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.tblfacilitybooking
    ADD CONSTRAINT tblfacilitybooking_pkey PRIMARY KEY (fltybookingid);
 T   ALTER TABLE ONLY public.tblfacilitybooking DROP CONSTRAINT tblfacilitybooking_pkey;
       public            postgres    false    220            v           2606    111442 &   tblfacilitytypes tblfacilitytypes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.tblfacilitytypes
    ADD CONSTRAINT tblfacilitytypes_pkey PRIMARY KEY (fltytypeid);
 P   ALTER TABLE ONLY public.tblfacilitytypes DROP CONSTRAINT tblfacilitytypes_pkey;
       public            postgres    false    216            �           2606    129167    tbllanguages tbllanguages_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tbllanguages
    ADD CONSTRAINT tbllanguages_pkey PRIMARY KEY (lanid);
 H   ALTER TABLE ONLY public.tbllanguages DROP CONSTRAINT tbllanguages_pkey;
       public            postgres    false    225            t           2606    111434    tblroles tblroles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tblroles
    ADD CONSTRAINT tblroles_pkey PRIMARY KEY (roleid);
 @   ALTER TABLE ONLY public.tblroles DROP CONSTRAINT tblroles_pkey;
       public            postgres    false    215            x           2606    111451    tblusers tblusers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tblusers
    ADD CONSTRAINT tblusers_pkey PRIMARY KEY (usrid);
 @   ALTER TABLE ONLY public.tblusers DROP CONSTRAINT tblusers_pkey;
       public            postgres    false    217            �           2606    129181 .   tblcontroldisplay tblcontroldisplay_ctrid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblcontroldisplay
    ADD CONSTRAINT tblcontroldisplay_ctrid_fkey FOREIGN KEY (ctrdspctrid) REFERENCES public.tblcontrols(ctrid);
 X   ALTER TABLE ONLY public.tblcontroldisplay DROP CONSTRAINT tblcontroldisplay_ctrid_fkey;
       public          postgres    false    226    4738    227            �           2606    111484 *   tblfacilities tblfacilities_fltyowner_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblfacilities
    ADD CONSTRAINT tblfacilities_fltyowner_fkey FOREIGN KEY (fltyowner) REFERENCES public.tblusers(usrid);
 T   ALTER TABLE ONLY public.tblfacilities DROP CONSTRAINT tblfacilities_fltyowner_fkey;
       public          postgres    false    218    4728    217            �           2606    111479 )   tblfacilities tblfacilities_fltytype_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblfacilities
    ADD CONSTRAINT tblfacilities_fltytype_fkey FOREIGN KEY (fltytype) REFERENCES public.tblfacilitytypes(fltytypeid);
 S   ALTER TABLE ONLY public.tblfacilities DROP CONSTRAINT tblfacilities_fltytype_fkey;
       public          postgres    false    216    4726    218            �           2606    111498 9   tblfacilityattachments tblfacilityattachments_fltyid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblfacilityattachments
    ADD CONSTRAINT tblfacilityattachments_fltyid_fkey FOREIGN KEY (fltyid) REFERENCES public.tblfacilities(fltyid);
 c   ALTER TABLE ONLY public.tblfacilityattachments DROP CONSTRAINT tblfacilityattachments_fltyid_fkey;
       public          postgres    false    219    4730    218            �           2606    111511 7   tblfacilitybooking tblfacilitybooking_fltybookedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblfacilitybooking
    ADD CONSTRAINT tblfacilitybooking_fltybookedby_fkey FOREIGN KEY (fltybookedby) REFERENCES public.tblusers(usrid);
 a   ALTER TABLE ONLY public.tblfacilitybooking DROP CONSTRAINT tblfacilitybooking_fltybookedby_fkey;
       public          postgres    false    217    4728    220            �           2606    111516 1   tblfacilitybooking tblfacilitybooking_fltyid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblfacilitybooking
    ADD CONSTRAINT tblfacilitybooking_fltyid_fkey FOREIGN KEY (fltyid) REFERENCES public.tblfacilities(fltyid);
 [   ALTER TABLE ONLY public.tblfacilitybooking DROP CONSTRAINT tblfacilitybooking_fltyid_fkey;
       public          postgres    false    218    220    4730            �           2606    129186 *   tblcontroldisplay tbllanguagesy_lanid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblcontroldisplay
    ADD CONSTRAINT tbllanguagesy_lanid_fkey FOREIGN KEY (ctrdsplanid) REFERENCES public.tbllanguages(lanid);
 T   ALTER TABLE ONLY public.tblcontroldisplay DROP CONSTRAINT tbllanguagesy_lanid_fkey;
       public          postgres    false    227    4736    225            �           2606    111533 !   tblusers tblusers_usrroledid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tblusers
    ADD CONSTRAINT tblusers_usrroledid_fkey FOREIGN KEY (usrroledid) REFERENCES public.tblroles(roleid);
 K   ALTER TABLE ONLY public.tblusers DROP CONSTRAINT tblusers_usrroledid_fkey;
       public          postgres    false    215    4724    217            (      x������ � �      '      x������ � �            x������ � �             x������ � �      !      x������ � �            x������ � �      &      x������ � �         �   x�˱N1 �9�/F���9ciwV�q$�T�������y�KG@����"MsRB��T�Z��y?�����s�u����\��U�`c�8�Zޞ���c!�k�d�S@�4 �IQ�1Z9?~~���I�jG"�P��F��n�ގD��z����eY�?/5�            x������ � �     