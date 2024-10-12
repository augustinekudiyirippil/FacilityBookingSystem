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
    public class UserAccountRepository : IUserAccounts
    {
    


        string sqlQuery;
        string sqlConnectionString;
        NpgsqlConnection sqlConnection = new NpgsqlConnection();

        NpgsqlCommand sqlCommand = new NpgsqlCommand();

        NpgsqlDataAdapter ada = new NpgsqlDataAdapter();

        NpgsqlDataReader sqlDataReader;

        DataSet ds;
        List<UserAccounts> listUserAccounts = new List<UserAccounts> { };



        string operationResult;
        public List<UserAccounts> GetUserAccounts()
        {

            return getAllUserAccounts();


        }

        //public UserRoles GetUserRole(int id)
        //{
        //    return listUserRoles.FirstOrDefault(x => x.rolenumber == id);
        //}



        public List<UserAccounts> getAllUserAccounts()
        {
            DBClass sqlClass = new DBClass();


            sqlDataReader = sqlClass.readSQLData("SELECT * from  fnGetAllUserAccount();");

            while (sqlDataReader.Read())
            {

                listUserAccounts.Add(new UserAccounts
                { 
    
                   
                    usrid = sqlDataReader.GetGuid(0),
                    usrnumber = sqlDataReader.GetInt32(0),
                    usrfirstname = sqlDataReader.GetString(0),
                    usrlastname = sqlDataReader.GetString(0),
                    usrknownas = sqlDataReader.GetString(0),
                    usraddress = sqlDataReader.GetString(0),
                    usrprimaryemail = sqlDataReader.GetString(0),
                    usrsecondaryemail = sqlDataReader.GetString(0),
                    usrmobile = sqlDataReader.GetString(0),
                    usrwhatsapp = sqlDataReader.GetString(0),
                    usrlandphone = sqlDataReader.GetString(0),
                    usrmfaactivated = sqlDataReader.GetInt32(0),
                    usrssoactivated = sqlDataReader.GetInt32(0),
                    usrnotes = sqlDataReader.GetString(0),
                    usrisdeleted = sqlDataReader.GetInt32(0),
                    usrroledid = sqlDataReader.GetGuid(0),
                    usrcreatedon = sqlDataReader.GetDateTime(0),
                    usrlastupdatedon = sqlDataReader.GetDateTime(0),
                    usrcomments = sqlDataReader.GetString(0)

                });

            }

            sqlClass.closeSQLConnection();

            return listUserAccounts;


        }


        public List<UserAccounts> getUserAccount(Guid id)
        {
            DBClass sqlClass = new DBClass();


            sqlDataReader = sqlClass.readSQLData("SELECT * from  public.fnGetSelectedUserAccount('" + id + "');");

            while (sqlDataReader.Read())
            {

                listUserAccounts.Add(new UserAccounts
                {
  

                    usrid = sqlDataReader.GetGuid(0),
                    usrnumber = sqlDataReader.GetInt32(0),
                    usrfirstname = sqlDataReader.GetString(0),
                    usrlastname = sqlDataReader.GetString(0),
                    usrknownas = sqlDataReader.GetString(0),
                    usraddress = sqlDataReader.GetString(0),
                    usrprimaryemail = sqlDataReader.GetString(0),
                    usrsecondaryemail = sqlDataReader.GetString(0),
                    usrmobile = sqlDataReader.GetString(0),
                    usrwhatsapp = sqlDataReader.GetString(0),
                    usrlandphone = sqlDataReader.GetString(0),
                    usrmfaactivated = sqlDataReader.GetInt32(0),
                    usrssoactivated = sqlDataReader.GetInt32(0),
                    usrnotes = sqlDataReader.GetString(0),
                    usrisdeleted = sqlDataReader.GetInt32(0),
                    usrroledid = sqlDataReader.GetGuid(0),
                    usrcreatedon = sqlDataReader.GetDateTime(0),
                    usrlastupdatedon = sqlDataReader.GetDateTime(0),
                    usrcomments = sqlDataReader.GetString(0)

                });


            }

            sqlClass.closeSQLConnection();

            return listUserAccounts;


        }




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

            DBClass sqlClass = new DBClass();

            sqlConnectionString = sqlClass.getSQLConnectionString();

            try
            {
                sqlConnection.ConnectionString = sqlConnectionString;
                if (sqlConnection.State == ConnectionState.Closed)
                {

                    sqlConnection.Open();
                }


                using var cmd = new NpgsqlCommand("CALL spinserttouser($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)", sqlConnection);

                cmd.Parameters.AddWithValue(newusrfirstname);
                cmd.Parameters.AddWithValue(newusrlastname);
                cmd.Parameters.AddWithValue(newusrknownas);
                cmd.Parameters.AddWithValue(newusraddress);
                cmd.Parameters.AddWithValue(newusrprimaryemail);
                cmd.Parameters.AddWithValue(newusrsecondaryemail);
                cmd.Parameters.AddWithValue(newusrmobile);
                cmd.Parameters.AddWithValue(newusrwhatsapp);
                cmd.Parameters.AddWithValue(newusrlandphone);
                cmd.Parameters.AddWithValue(newusrnotes);


                cmd.ExecuteNonQuery();


                sqlConnection.Close();

                operationResult = newusrfirstname+ " "+newusrlastname;


            }
            catch (Exception ex)
            {
                operationResult = ex.Message.ToString();

            }

            return operationResult;


        }



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

            DBClass sqlClass = new DBClass();

            sqlConnectionString = sqlClass.getSQLConnectionString();

            try
            {
                sqlConnection.ConnectionString = sqlConnectionString;
                if (sqlConnection.State == ConnectionState.Closed)
                {

                    sqlConnection.Open();
                }


                using var cmd = new NpgsqlCommand("CALL spupdaterole($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14)", sqlConnection);


                cmd.Parameters.AddWithValue(usridtoupdate);
                cmd.Parameters.AddWithValue(newusrfirstname);
                cmd.Parameters.AddWithValue(newusrlastname);
                cmd.Parameters.AddWithValue(newusrknownas);
                cmd.Parameters.AddWithValue(newusraddress);
                cmd.Parameters.AddWithValue(newusrprimaryemail);
                cmd.Parameters.AddWithValue(newusrsecondaryemail);
                cmd.Parameters.AddWithValue(newusrmobile);
                cmd.Parameters.AddWithValue(newusrwhatsapp);
                cmd.Parameters.AddWithValue(newusrlandphone);
                cmd.Parameters.AddWithValue(newusrmfaactivated);
                cmd.Parameters.AddWithValue(newusrssoactivated);
                cmd.Parameters.AddWithValue(newusrnotes);
                cmd.Parameters.AddWithValue(newusrroledid);




                cmd.ExecuteNonQuery();


                sqlConnection.Close();

                operationResult =" Updated "+ newusrfirstname+" "+ newusrfirstname;


            }
            catch (Exception ex)
            {
                operationResult = ex.Message.ToString();

            }

            return operationResult;


        }


        public string deleteUserAccount(Guid usridtodelete, string usrnotes)
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


                using var cmd = new NpgsqlCommand("CALL spdeleteuser($1,$2)", sqlConnection);

                cmd.Parameters.AddWithValue(usridtodelete);
                cmd.Parameters.AddWithValue(usrnotes);



                cmd.ExecuteNonQuery();


                sqlConnection.Close();

                operationResult = "Selected user account deleted";


            }
            catch (Exception ex)
            {
                operationResult = ex.Message.ToString();

            }

            return operationResult;


        }

    }





}

