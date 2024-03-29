﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using FundooModel.Models;
using FundooWebforms.Persistance;

namespace FundooWebforms.Controllers
{
    public class NoteController : ApiController
    {
        

        // GET: api/Note
        public IQueryable<NoteModel> GetnoteModels()
        {
            DataContext db = new DataContext();
            return db.noteModels;
        }

        // GET: api/Note/5
        [ResponseType(typeof(NoteModel))]
        public async Task<IHttpActionResult> GetNoteModel(int id)
        {
            DataContext db = new DataContext();
            NoteModel noteModel = await db.noteModels.FindAsync(id);
            if (noteModel == null)
            {
                return NotFound();
            }

            return Ok(noteModel);
        }

        // PUT: api/Note/5
        [HttpPost]
        [Route("api/Note/Update/{id}")]
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutNoteModel(int id, NoteModel noteModel)
        {
            DataContext db = new DataContext();
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != noteModel.NoteId)
            {
                return BadRequest();
            }

            db.Entry(noteModel).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NoteModelExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Note
        [ResponseType(typeof(NoteModel))]
        public async Task<IHttpActionResult> PostNoteModel(NoteModel noteModel)
        {
            DataContext db = new DataContext();
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.noteModels.Add(noteModel);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = noteModel.NoteId }, noteModel);
        }

        // DELETE: api/Note/5
        [HttpPost]
        [Route("api/Note/delete/{id}")]
        [ResponseType(typeof(NoteModel))]
        public async Task<IHttpActionResult> DeleteNoteModel(int id)
        {
            DataContext db = new DataContext();
            NoteModel noteModel = await db.noteModels.FindAsync(id);
            if (noteModel == null)
            {
                return NotFound();
            }

            db.noteModels.Remove(noteModel);
            await db.SaveChangesAsync();

            return Ok(noteModel);
        }

        protected override void Dispose(bool disposing)
        {
            DataContext db = new DataContext();
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool NoteModelExists(int id)
        {
            DataContext db = new DataContext();
            return db.noteModels.Count(e => e.NoteId == id) > 0;
        }
    }
}