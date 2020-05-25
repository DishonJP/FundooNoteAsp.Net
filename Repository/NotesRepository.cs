using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FundooNote.Repository
{
    public class NotesRepository:INotesRespository
    {
        public string AddNote(AddNote note)
        {
            using (SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Projects\FundooNote\App_Data\FundooNote.Persistance.DataContext.mdf;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("insert into AddNotes values(@Title, @Description)", connection);

                cmd.Parameters.AddWithValue("Title", note);
                cmd.Parameters.AddWithValue("Description", note);
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                return "success";
            }
        }

    }
}