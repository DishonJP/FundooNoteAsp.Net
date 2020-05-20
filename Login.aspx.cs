using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FundooNote
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Projects\FundooNote\App_Data\FundooAppDB.mdf;Integrated Security=True");
                string FindQuery = "select * from UserDetails where Email="+ txtEmail.Text + " AND Password="+ txtPassword.Text;
                SqlCommand cmd = new SqlCommand(FindQuery, conn);
                cmd.CommandType = System.Data.CommandType.Text;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                Response.Write(reader.Read());
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }
    }
}