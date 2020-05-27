using FundooNote.Models;
using FundooRespository.InterfaceRepository;
using FundooRespository.Utility;
using System;
using System.Data.SqlClient;


namespace FundooRespository.ImplClassRepository
{
    class UserRespository:IUserRepository
    {
            public bool AddUser(AddUser user)
            {
            try
            {
                SqlConnection conn = new SqlConnection(ConnectionString.ConnectionName);
                conn.Open();
                string insertQuery = "insert into UserDetails values(@Id,@FirstName,@LastName,@Email,@Password)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@Id", user.Id);
                cmd.Parameters.AddWithValue("@FirstName", user.FirstName);
                cmd.Parameters.AddWithValue("@LastName", user.LastName);
                cmd.Parameters.AddWithValue("@Email", user.Email);
                cmd.Parameters.AddWithValue("@Password", user.Password);
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
