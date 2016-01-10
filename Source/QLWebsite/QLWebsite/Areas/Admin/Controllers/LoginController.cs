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

namespace QLWebsite.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();
        //
        // GET: /Admin/Login/
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult CheckLogin(string username,string password)
        {
            TaiKhoan taikhoan = db.TaiKhoans.Where(s => s.TenTaiKhoan == username && s.MatKhau == password).FirstOrDefault();
            if(taikhoan==null || (taikhoan.Quyen!=1 && taikhoan.Quyen!=2))
            {
                ModelState.AddModelError("fail", "Tên đăng nhập hoặc mật khẩu không đúng");
                return Redirect("/Admin/Login/Login");
            }
            else
            {
                Session["user"] = username;
                Session["quyen"] = taikhoan.Quyen;
                if(taikhoan.Quyen==2)
                    return RedirectToAction("Index", "Admin");
                else
                    return Redirect("/Manager/Manager/Index");
            }
        }
        /// tài khoản
        public ActionResult Index(int page=1, int pageSize=10)
        {
            return View(db.TaiKhoans.OrderBy(s => s.ID).ToPagedList(page, pageSize));
        }

        public ActionResult Fillter(string quyen, int page = 1, int pageSize = 10)
        {
            int id = int.Parse(quyen);
            if (id == 0)
                return RedirectToAction("Index");
            var taikhoans = db.TaiKhoans.Where(s=>s.Quyen == id).OrderBy(s => s.ID).ToPagedList(page, pageSize);
            return View(taikhoans);
        }

        // GET: /Admin/Default1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taikhoan = db.TaiKhoans.Find(id);
            if (taikhoan == null)
            {
                return HttpNotFound();
            }
            return View(taikhoan);
        }

        // GET: /Admin/Default1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/Default1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TenTaiKhoan,MatKhau,TrangThai,Quyen,MaND,Email")] TaiKhoan taikhoan)
        {
            if (ModelState.IsValid)
            {
                db.TaiKhoans.Add(taikhoan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(taikhoan);
        }

        // GET: /Admin/Default1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taikhoan = db.TaiKhoans.Find(id);
            if (taikhoan == null)
            {
                return HttpNotFound();
            }
            return View(taikhoan);
        }

        // POST: /Admin/Default1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TenTaiKhoan,MatKhau,TrangThai,Quyen,MaND,Email")] TaiKhoan taikhoan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(taikhoan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(taikhoan);
        }

        // GET: /Admin/Default1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TaiKhoan taikhoan = db.TaiKhoans.Find(id);
            if (taikhoan == null)
            {
                return HttpNotFound();
            }
            return View(taikhoan);
        }

        // POST: /Admin/Default1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaiKhoan taikhoan = db.TaiKhoans.Find(id);
            db.TaiKhoans.Remove(taikhoan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult CheckName(string username)
        {
            TaiKhoan taikhoan = db.TaiKhoans.Where(s => s.TenTaiKhoan == username).FirstOrDefault();
            var respone = new { Code = "0", Mgs = "false" };
            if (taikhoan != null)
                respone = new { Code = "1", Mgs = "true" };
            return Json(respone, JsonRequestBehavior.AllowGet);
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