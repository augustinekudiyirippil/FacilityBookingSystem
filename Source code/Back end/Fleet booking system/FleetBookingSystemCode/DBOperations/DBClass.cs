using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Npgsql;
using System;
using System.Configuration;
using System.Data;

namespace FleetBookingSystemCode.DBOperations
{
    public class DBClass
    {




        NpgsqlConnection sqlConnection = new NpgsqlConnection();

        NpgsqlCommand sqlCommand = new NpgsqlCommand();

        NpgsqlDataAdapter ada = new NpgsqlDataAdapter();

        NpgsqlDataReader sqlDataReader;

        DataSet ds;

        public string connectionString, sqlServer, sqlPort, sqlUserName, sqlPassword, sqlDatabase;

        string exceptionMessage = "";

        string successMessage = "";

    
        public int   getConnectionString()
        {
            int connectionResult = 0;

            try
            {


                var postgreSQLConnectionstring = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetSection("ConnectionStrings")["DefaultConnection"];


                //Connect to database
                sqlConnection.ConnectionString = postgreSQLConnectionstring; 
                //"Server=" + sqlServer + "; Port=" + sqlPort + "; User Id=" + sqlUserName + "; Password=" + sqlPassword + "; Database=" + sqlDatabase;


                sqlCommand.Connection = sqlConnection;



                connectionResult = 1;
            }
            catch (Exception ex)
            {
                exceptionMessage = ex.Message;

                connectionResult = 0;

            }

            return connectionResult;
            

        }


        public  string getSQLConnectionString()
        {
            string connectionString;

            try
            {


                connectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetSection("ConnectionStrings")["DefaultConnection"];

 
            }
            catch (Exception ex)
            {
                exceptionMessage = ex.Message;

                connectionString = "";

            }

            return connectionString;


        }




        //To open SQL connection
        public void openSQLConnection()
        {
            
            sqlConnection.Open();
        }


        //To close sql connection
        public void closeSQLConnection()
        {
            sqlDataReader.Close();
            sqlConnection.Close();
        }




        public string  readSQLData(string strSQLCommand)
        {
            try
            {
                getConnectionString();
                if (sqlConnection.State == ConnectionState.Closed)
                    openSQLConnection();
                else
                {
                }

                sqlCommand.CommandText = strSQLCommand;
                sqlDataReader = sqlCommand.ExecuteReader();

                closeSQLConnection();
                successMessage = "Success";

            }
            catch (Exception ex)
            {
                exceptionMessage = ex.Message;
                successMessage = exceptionMessage;

            }

            return successMessage;
        }



        public NpgsqlDataReader readSQLDataByProcedure(string strSQLCommand)
        {
            try
            {
                getConnectionString();
                if (sqlConnection.State == ConnectionState.Closed)
                    openSQLConnection();
                else
                {
                }
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = strSQLCommand;
                sqlDataReader = sqlCommand.ExecuteReader();

                closeSQLConnection();
                successMessage = "Success";

            }
            catch (Exception ex)
            {
                exceptionMessage = ex.Message;
                successMessage = exceptionMessage;

            }

            return sqlDataReader;
        }







        public string updateData(string strSQLCommand)
        {
            try
            {
                if (sqlConnection.State == ConnectionState.Closed)
                    openSQLConnection();
                else
                {
                }
                sqlCommand.CommandText = strSQLCommand;
                sqlCommand.ExecuteNonQuery();
                successMessage = "Success";
            }
            catch (Exception ex)
            {
                exceptionMessage = ex.Message;
                successMessage = exceptionMessage;
            }
            return successMessage;
        }



        public string updateTableByProcedure(string strSQLCommand)
        {
            try
            {
                if (sqlConnection.State == ConnectionState.Closed)
                    openSQLConnection();
                else
                {
                }
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = strSQLCommand;

                sqlCommand.ExecuteNonQuery();
                successMessage = "Success";

            }
            catch (Exception ex)
            {
                exceptionMessage = ex.Message;
                successMessage = exceptionMessage;
            }
            return successMessage;
        }



    }









}



