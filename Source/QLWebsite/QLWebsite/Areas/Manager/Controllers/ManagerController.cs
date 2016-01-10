using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLWebsite.Areas.Manager.Controllers
{
    public class ManagerController : Controller
    {
        //
        // GET: /Manager/Manager/
        public ActionResult Index()
        {
            if (Session["user"] == null ||  Session["quyen"].ToString() != "1")
                return Redirect("/Admin/Login/Login");
            else
                return View();
        }
	}
}