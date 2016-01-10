using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QLWebsite.Models;
using PagedList;

namespace QLWebSite.Areas.Admin.Controllers
{
    public class CTDHController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: /Admin/CTDH/
        public ActionResult Index(int id,int page=1, int pageSize=10)
        {
            var ctdonhangs = db.CTDonHangs.Include(c => c.SanPham).Where(c=>c.MaDH==id).OrderBy(c=>c.MaSP).ToPagedList(page,pageSize);
            return View(ctdonhangs);
        }

        // GET: /Admin/CTDH/Delete/5
        public ActionResult Delete(int madh, int masp)
        {
            CTDonHang ctdonhang = db.CTDonHangs.Where(c=>c.MaDH==madh && c.MaSP==masp).FirstOrDefault();
            if (ctdonhang == null)
            {
                return HttpNotFound();
            }
            db.CTDonHangs.Remove(ctdonhang);
            db.SaveChanges();
            return View("Index", new { id=madh });
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
