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
    public class UserRoleRepository : IUserRoles
    {
        public Guid roleid { get; set; }
        public int rolenumber { get; set; }
        public string rolename { get; set; }


        string sqlQuery;
        string sqlConnectionString;
        NpgsqlConnection sqlConnection = new NpgsqlConnection();

        NpgsqlCommand sqlCommand = new NpgsqlCommand();

        NpgsqlDataAdapter ada = new NpgsqlDataAdapter();

        NpgsqlDataReader sqlDataReader;

        DataSet ds;
        List<UserRoles> listUserRoles = new List<UserRoles> { };

        string operationResult;

        public List<UserRoles> GetAllEUserRoles()
        {

            return getUserRoles();


        }

        public UserRoles GetUserRole(int id)
        {
            return listUserRoles.FirstOrDefault(x => x.rolenumber == id);
        }



        public List<UserRoles> getUserRoles()
        {
            DBClass sqlClass = new DBClass();


            sqlDataReader = sqlClass.readSQLData("SELECT * from  fnGetAllUserRoles();");

            while (sqlDataReader.Read())
            {

                listUserRoles.Add(new UserRoles { roleid = sqlDataReader.GetGuid(0), rolenumber = sqlDataReader.GetInt32("fmRoleNumber"), rolename = sqlDataReader.GetString("fmRoleName") });

            }

            sqlClass.closeSQLConnection();

            return listUserRoles;


        }


        public List<UserRoles> GetUserRole(Guid id)
        {
            DBClass sqlClass = new DBClass();


            sqlDataReader = sqlClass.readSQLData("SELECT * from  public.fnGetSeletedUserRole('" + id + "');");

            while (sqlDataReader.Read())
            {

                listUserRoles.Add(new UserRoles { roleid = sqlDataReader.GetGuid(0), rolenumber = sqlDataReader.GetInt32("fmRoleNumber"), rolename = sqlDataReader.GetString("fmRoleName") });

            }

            sqlClass.closeSQLConnection();

            return listUserRoles;


        }




        public string addUserRole(string userRoleName)
        {

            DBClass sqlClass = new DBClass();

            sqlConnectionString = sqlClass.getSQLConnectionString();

            try
            {
                sqlConnection.ConnectionString = sqlConnectionString;
                if (sqlConnection.State == ConnectionState.Closed)
                {

                    sqlConnection.Open();
                }


                using var cmd = new NpgsqlCommand("CALL spAddRole($1)", sqlConnection);


                cmd.Parameters.AddWithValue(userRoleName);

                cmd.ExecuteNonQuery();


                sqlConnection.Close();

                operationResult = userRoleName;


            }
            catch (Exception ex)
            {
                operationResult = ex.Message.ToString();

            }

            return operationResult;


        }



        public string updateUserRole(Guid userRoleID, string  userRolename)
        {

            DBClass sqlClass = new DBClass();

            sqlConnectionString = sqlClass.getSQLConnectionString();

            try
            {
                sqlConnection.ConnectionString = sqlConnectionString;
                if (sqlConnection.State == ConnectionState.Closed)
                {

                    sqlConnection.Open();
                }


                using var cmd = new NpgsqlCommand("CALL spupdaterole($1,$2)", sqlConnection);

                cmd.Parameters.AddWithValue(userRoleID);

                cmd.Parameters.AddWithValue(userRolename);

                cmd.ExecuteNonQuery();


                sqlConnection.Close();

                operationResult = userRolename;


            }
            catch (Exception ex)
            {
                operationResult = ex.Message.ToString();

            }

            return operationResult;


        }


        public string deleteUserRole(Guid userRoleID)
        {

            DBClass sqlClass = new DBClass();

            sqlConnectionString = sqlClass.getSQLConnectionString();

            try
            {
                sqlConnection.ConnectionString = sqlConnectionString;
                if (sqlConnection.State == ConnectionState.Closed)
                {

                    sqlConnection.Open();
                }


                using var cmd = new NpgsqlCommand("CALL deleteUserRole($1)", sqlConnection);

                cmd.Parameters.AddWithValue(userRoleID);

               

                cmd.ExecuteNonQuery();


                sqlConnection.Close();

                operationResult = "Selected role deleted";


            }
            catch (Exception ex)
            {
                operationResult = ex.Message.ToString();

            }

            return operationResult;


        }

        public List<UserRoles> GetUserRoles()
        {
            throw new NotImplementedException();
        }

        UserRoles IUserRoles.deleteUserRole(Guid id)
        {
            throw new NotImplementedException();
        }
    }





}

