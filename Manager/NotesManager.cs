using FundooNote.Models;
using FundooNote.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FundooNote.Manager
{
    public class NotesManager : INotesManager
    {
        private readonly INotesRespository _respository;

        public NotesManager(INotesRespository respository)
        {
            this._respository = respository;
        }
        public string AddNote(AddNote note)
        {
            return this._respository.AddNote(note);
        }
    }
}