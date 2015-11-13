using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLWebsite.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/Admin/
        public ActionResult Index()
        {
            if (Session["user"] == null)
                return RedirectToAction("Login", "Login");
            else
                return View();
        }
	}
}