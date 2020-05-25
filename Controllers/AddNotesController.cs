using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FundooNote.Models;
using FundooNote.Persistance;

namespace FundooNote.Controllers
{
    public class AddNotesController : Controller
    {
        private DataContext db = new DataContext();

        // GET: AddNotes
        public ActionResult Index()
        {
            return View(db.AddNotes.ToList());
        }

        // GET: AddNotes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AddNote addNote = db.AddNotes.Find(id);
            if (addNote == null)
            {
                return HttpNotFound();
            }
            return View(addNote);
        }

        // GET: AddNotes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AddNotes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,Description")] AddNote addNote)
        {
            if (ModelState.IsValid)
            {
                addNote.Id = Guid.NewGuid();
                db.AddNotes.Add(addNote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(addNote);
        }

        // GET: AddNotes/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AddNote addNote = db.AddNotes.Find(id);
            if (addNote == null)
            {
                return HttpNotFound();
            }
            return View(addNote);
        }

        // POST: AddNotes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Description")] AddNote addNote)
        {
            if (ModelState.IsValid)
            {
                db.Entry(addNote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(addNote);
        }

        // GET: AddNotes/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AddNote addNote = db.AddNotes.Find(id);
            if (addNote == null)
            {
                return HttpNotFound();
            }
            return View(addNote);
        }

        // POST: AddNotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            AddNote addNote = db.AddNotes.Find(id);
            db.AddNotes.Remove(addNote);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
