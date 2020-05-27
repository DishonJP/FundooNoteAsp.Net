using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace FundooNote.Persistance
{
    public class DataContext:DbContext
    {
       
        public DbSet<AddNote> AddNotes{ get; set; }
    }
}