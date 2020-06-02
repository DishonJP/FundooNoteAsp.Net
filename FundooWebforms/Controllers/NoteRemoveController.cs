using FundooModel.Models;
using FundooWebforms.Persistance;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace FundooWebforms.Controllers
{
    public class NoteRemoveController : ControllerBase
    {
        private DataContext db = new DataContext();


        [Route("NoteRemove/Delete/{id}")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int? id)
        {
            NoteModel noteModel = await db.noteModels.FindAsync(id);
            db.noteModels.Remove(noteModel);
            await db.SaveChangesAsync();
            return null;
        }

        protected override void ExecuteCore()
        {
            throw new NotImplementedException();
        }
    }
}