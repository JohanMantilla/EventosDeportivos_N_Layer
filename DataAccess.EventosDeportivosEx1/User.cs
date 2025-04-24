using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace DataAccess.EventosDeportivosEx1
{
    public class User
    {
        private string strConnectionString;
        public User(string strConnString)
        {
            strConnectionString = strConnString;
        }

        public int Save(EntityLayer.EventosDeportivosEx1.User user)
        {
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sentence = "INSERT INTO [TBL_USER]([USERNAME], [PASSWORD], [EMAIL], [USER_TYPE]";
                    if (user.Birthday != string.Empty && user.Birthday != null)
                    {
                        sentence += ", [BIRTHDAY]";
                    }

                    sentence += ") VALUES(" +
                    "@USERNAME" +
                    ",@PASSWORD" +
                    ",@EMAIL" +
                    ",@USER_TYPE";
                    if (user.Birthday != string.Empty && user.Birthday != null)
                    {
                        sentence += ",@BIRTHDAY";
                    }

                    sentence += ")";
                    cmd.CommandText = sentence;
                    cmd.Parameters.AddWithValue("@USERNAME", user.UserName);
                    cmd.Parameters.AddWithValue("@PASSWORD", user.Password);
                    cmd.Parameters.AddWithValue("@EMAIL", user.Email);
                    cmd.Parameters.AddWithValue("@USER_TYPE", user.UserType);
                    if (user.Birthday != string.Empty && user.Birthday != null)
                    {
                        cmd.Parameters.AddWithValue("@BIRTHDAY", user.Birthday);
                    }
 
                    cmd.Connection = con;
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }
        public int CheckExistUser(string userName)
        {
            object returnValue;
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT [ID_USER] FROM [TBL_USER] WHERE [USERNAME] = @USERNAME";
                    cmd.Parameters.AddWithValue("@USERNAME", userName);
                    cmd.Connection = con;
                    con.Open();
                    returnValue = cmd.ExecuteScalar();
                    return (returnValue == null) ? 0 : (int)returnValue;
                }
            }
        }
        public int CheckExistEmail(string email)
        {
            object returnValue;
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT [ID_USER] FROM [TBL_USER] WHERE [EMAIL] = @EMAIL";
                    cmd.Parameters.AddWithValue("@EMAIL", email);
                    cmd.Connection = con;
                    con.Open();
                    returnValue = cmd.ExecuteScalar();
                    return returnValue == null ? 0 : (int)returnValue;
                }
            }
        }
        public DataTable Read()
        {
            DataTable dtUser = new DataTable();
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [ID_USER] ,[USERNAME] ,[PASSWORD] ,[EMAIL], [BIRTHDAY],[USER_TYPE] FROM [TBL_USER]", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dtUser);
                        return dtUser;
                    }
                }
            }
        }

        public int Update(EntityLayer.EventosDeportivosEx1.User user)
        {
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sentence = "UPDATE [TBL_USER] SET " +
                        "[USERNAME] = @USERNAME " +
                        ", [USER_TYPE] = @USER_TYPE ";
                    if (user.Password != string.Empty && user.Password != null)
                    {
                        sentence += ", [PASSWORD] = @PASSWORD ";
                    }
                    sentence += ", [EMAIL] = @EMAIL ";
                    if (user.Birthday != string.Empty && user.Birthday != null)
                    {
                        sentence += ", [BIRTHDAY] = @BIRTHDAY ";
                    }
    
                    sentence += " WHERE [ID_USER] = @ID_USER";
                    cmd.CommandText = sentence;
                    cmd.Parameters.AddWithValue("@ID_USER", user.ID);
                    cmd.Parameters.AddWithValue("@USERNAME", user.UserName);
                    cmd.Parameters.AddWithValue("@USER_TYPE", user.UserType);
                    if (user.Password != string.Empty && user.Password != null)
                    {
                        cmd.Parameters.AddWithValue("@PASSWORD", user.Password);
                    }
                    cmd.Parameters.AddWithValue("@EMAIL", user.Email);
                    if (user.Birthday != string.Empty && user.Birthday != null)
                    {
                        cmd.Parameters.AddWithValue("@BIRTHDAY", user.Birthday);
                    }
                    
                    cmd.Connection = con;
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public int Delete(int idUserName)
        {
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "DELETE [TBL_USER] WHERE [ID_USER] = @ID_USER";
                    cmd.Parameters.AddWithValue("@ID_USER", idUserName);
                    cmd.Connection = con;
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public DataTable AuthenticateUser(string login, string password)
        {
            DataTable dtUser = new DataTable();
            using (SqlConnection con = new SqlConnection(strConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("", con))
                {
                    string sentence = "SELECT [ID_USER] ,[USERNAME] ,[PASSWORD] ,[EMAIL], [BIRTHDAY],[USER_TYPE] " +
                        "FROM [TBL_USER] " +
                        "WHERE [USERNAME] = @USERNAME AND [PASSWORD] = @PASSWORD";
                    cmd.CommandText = sentence;
                    cmd.Parameters.AddWithValue("@USERNAME", login);
                    cmd.Parameters.AddWithValue("@PASSWORD", password);
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dtUser);
                        return dtUser;
                    }
                }
            }
        }
    }

}
