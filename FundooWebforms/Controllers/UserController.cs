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

namespace FundooWebforms.Controllers
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
        public async Task<IHttpActionResult> GetUserModel(int id)
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
        public async Task<IHttpActionResult> PutUserModel(int id, UserModel userModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != userModel.UserId)
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

            db.userModels.Add(userModel);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = userModel.UserId }, userModel);
        }

        // DELETE: api/User/5
        [ResponseType(typeof(UserModel))]
        public async Task<IHttpActionResult> DeleteUserModel(int id)
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

        private bool UserModelExists(int id)
        {
            return db.userModels.Count(e => e.UserId == id) > 0;
        }
    }
}