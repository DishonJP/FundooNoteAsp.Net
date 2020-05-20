using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FundooNote.Views.Home
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Projects\FundooNote\App_Data\FundooAppDB.mdf;Integrated Security=True");
                conn.Open();
                //string insertQuery = "insert into UserDetails values(@firstName,@lastName,@email,@password)";
                SqlCommand cmd = new SqlCommand("dbo.AddUser", conn);
                cmd.Parameters.AddWithValue("@FirstName", txtFName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.ExecuteNonQuery();
                Response.Write("Registration Successful");
                conn.Close();
                Response.Redirect("Login.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }
    }
}