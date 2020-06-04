using FundooModel.Models;
using System;
using System.Data.Entity;

namespace FundooWebforms.Persistance
{
    public class DataContext : DbContext
    {
        /*public DataContext()
        {
            this.Configuration.ProxyCreationEnabled = false;
        }*/
        public DbSet<UserModel> userModels { get;set; }
        public DbSet<NoteModel> noteModels { get; set; }
        public DbSet<Test> tests { get; set; }
    }
}