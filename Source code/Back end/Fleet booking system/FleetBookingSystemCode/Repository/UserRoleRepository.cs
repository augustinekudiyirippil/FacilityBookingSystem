using FleetBookingSystemCode.DBOperations;
using FleetBookingSystemCode.Interface;
using FleetBookingSystemCode.Model;
using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace FleetBookingSystemCode.Repository
{
    public class UserRoleRepository
    {

        string sqlQuery;
        string sqlConnectionString;
        NpgsqlConnection sqlConnection = new NpgsqlConnection();

        NpgsqlCommand sqlCommand = new NpgsqlCommand();

        NpgsqlDataAdapter ada = new NpgsqlDataAdapter();

        NpgsqlDataReader sqlDataReader;

        DataSet ds;

        List<UserRoles> listUserRoles = new List<UserRoles>
        {
            new UserRoles{  roleid= new Guid( "7AC69D82-8077-4C36-90F9-23563C04D67A"), rolenumber =1, rolename="Admin", roleisdeleted =0},
            new UserRoles{  roleid= new Guid("76386840-F006-4043-AA05-EDCD67D4D333"), rolenumber =2, rolename="Owner", roleisdeleted =0},
            new UserRoles{  roleid= new Guid("1C171AB1-9CFE-4C69-ADB5-2ECC608FD39D"), rolenumber =3, rolename="Customer", roleisdeleted =0}


        };
        public List<UserRoles> GetAllEUserRoles()
        {

            getUserRoles();

            return listUserRoles;
        }

        public UserRoles GetUserRole(int id)
        {
            return listUserRoles.FirstOrDefault(x => x.rolenumber == id);
        }


      
        public void getUserRoles()
        {
            DBClass sqlClass = new DBClass();

            // sqlQuery = "SELECT roleid, rolenumber, rolename, roleisdeleted   FROM public.tblroles ";

            sqlDataReader = sqlClass.readSQLDataByProcedure("spSelectAllRoles");







        }

        public UserRoles addUserRole(UserRoles userRoles)
        {
           
            DBClass sqlClass = new DBClass();

            sqlConnectionString=sqlClass.getSQLConnectionString();

            try
            {
                sqlConnection.ConnectionString = sqlConnectionString;
                if (sqlConnection.State == ConnectionState.Closed)
                {

                    sqlConnection.Open();
                }

                    
                //sqlCommand.Connection = sqlConnection;
                //sqlCommand.CommandType = CommandType.StoredProcedure;
                //sqlCommand.CommandText = "public.spAddRole";
                //sqlCommand.Parameters.Add("@newrolename", NpgsqlDbType.Varchar, userRoles.rolename);
              

                
                


                using var cmd = new NpgsqlCommand("CALL spAddRole($1)", sqlConnection);

             
                cmd.Parameters.AddWithValue("newrolename", NpgsqlDbType.Varchar, userRoles.rolename);

                cmd.ExecuteNonQuery();

               

                sqlConnection.Close();
                sqlClass.updateTableByProcedure(sqlQuery);



            }
            catch(Exception ex)
            {


            }

            return userRoles;


        }

    }
}
