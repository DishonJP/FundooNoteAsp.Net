using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FundooNote.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [Route("Home/AddNote")]
        public ActionResult AddNote()
        {
            return Redirect("Index");
        }
        
        
    }
}