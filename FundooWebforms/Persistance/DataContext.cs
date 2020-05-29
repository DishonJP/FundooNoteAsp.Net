using FundooModel.Models;
using System;
using System.Data.Entity;

namespace FundooWebforms.Persistance
{
    public class DataContext : DbContext
    {
        public DbSet<UserModel> userModels { get;set; }
    }
}