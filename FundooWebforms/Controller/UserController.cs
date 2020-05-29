using System;
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

namespace FundooWebforms.Controller
{
    public class UserController : ApiController
    {
        private DataContext db = new DataContext();

        // GET: api/User
        public IQueryable<UserModel> GetuserModels()
        {
            return db.userModels;
        }

        // GET: api/User/5
        [ResponseType(typeof(UserModel))]
        public async Task<IHttpActionResult> GetUserModel(Guid id)
        {
            UserModel userModel = await db.userModels.FindAsync(id);
            if (userModel == null)
            {
                return NotFound();
            }

            return Ok(userModel);
        }

        // PUT: api/User/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutUserModel(Guid id, UserModel userModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != userModel.Id)
            {
                return BadRequest();
            }

            db.Entry(userModel).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserModelExists(id))
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

        // POST: api/User
        [ResponseType(typeof(UserModel))]
        public async Task<IHttpActionResult> PostUserModel(UserModel userModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            userModel.Id = Guid.NewGuid();
            db.userModels.Add(userModel);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (UserModelExists(userModel.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = userModel.Id }, userModel);
        }

        // DELETE: api/User/5
        [ResponseType(typeof(UserModel))]
        public async Task<IHttpActionResult> DeleteUserModel(Guid id)
        {
            UserModel userModel = await db.userModels.FindAsync(id);
            if (userModel == null)
            {
                return NotFound();
            }

            db.userModels.Remove(userModel);
            await db.SaveChangesAsync();

            return Ok(userModel);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserModelExists(Guid id)
        {
            return db.userModels.Count(e => e.Id == id) > 0;
        }
    }
}