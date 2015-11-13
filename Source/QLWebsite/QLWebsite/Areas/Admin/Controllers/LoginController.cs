using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLWebsite.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Admin/Login/
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult CheckLogin(string email,string password)
        {
            Session["user"] = email;
            return RedirectToAction("Index","Admin");
        }
	}
}