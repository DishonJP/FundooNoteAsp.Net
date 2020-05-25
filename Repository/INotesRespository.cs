using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FundooNote.Repository
{
    public interface INotesRespository
    {
        string AddNote(AddNote note); 
    }
}
