using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QLWebsite.Models;

namespace QLWebsite.Areas.Manager.Controllers
{
    public class SanPhamKhuyenMaisController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: Manager/SanPhamKhuyenMais
        public ActionResult Index()
        {
            var sanPhamKhuyenMais = db.SanPhamKhuyenMais.Include(s => s.CTKhuyenMai).Include(s => s.SanPham);
            return View(sanPhamKhuyenMais.ToList());
        }

        // GET: Manager/SanPhamKhuyenMais/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPhamKhuyenMai sanPhamKhuyenMai = db.SanPhamKhuyenMais.Find(id);
            if (sanPhamKhuyenMai == null)
            {
                return HttpNotFound();
            }
            return View(sanPhamKhuyenMai);
        }

        // GET: Manager/SanPhamKhuyenMais/Create
        public ActionResult Create()
        {
            ViewBag.MaKM = new SelectList(db.CTKhuyenMais, "MaKM", "TenCTKM");
            ViewBag.MaSP = new SelectList(db.SanPhams, "MaSP", "TenSP");
            return View();
        }

        // POST: Manager/SanPhamKhuyenMais/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaKM,MaSP,ChietKhau")] SanPhamKhuyenMai sanPhamKhuyenMai)
        {
            if (ModelState.IsValid)
            {
                db.SanPhamKhuyenMais.Add(sanPhamKhuyenMai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaKM = new SelectList(db.CTKhuyenMais, "MaKM", "TenCTKM", sanPhamKhuyenMai.MaKM);
            ViewBag.MaSP = new SelectList(db.SanPhams, "MaSP", "TenSP", sanPhamKhuyenMai.MaSP);
            return View(sanPhamKhuyenMai);
        }

        // GET: Manager/SanPhamKhuyenMais/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPhamKhuyenMai sanPhamKhuyenMai = db.SanPhamKhuyenMais.Find(id);
            if (sanPhamKhuyenMai == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKM = new SelectList(db.CTKhuyenMais, "MaKM", "TenCTKM", sanPhamKhuyenMai.MaKM);
            ViewBag.MaSP = new SelectList(db.SanPhams, "MaSP", "TenSP", sanPhamKhuyenMai.MaSP);
            return View(sanPhamKhuyenMai);
        }

        // POST: Manager/SanPhamKhuyenMais/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaKM,MaSP,ChietKhau")] SanPhamKhuyenMai sanPhamKhuyenMai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPhamKhuyenMai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaKM = new SelectList(db.CTKhuyenMais, "MaKM", "TenCTKM", sanPhamKhuyenMai.MaKM);
            ViewBag.MaSP = new SelectList(db.SanPhams, "MaSP", "TenSP", sanPhamKhuyenMai.MaSP);
            return View(sanPhamKhuyenMai);
        }

        // GET: Manager/SanPhamKhuyenMais/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPhamKhuyenMai sanPhamKhuyenMai = db.SanPhamKhuyenMais.Find(id);
            if (sanPhamKhuyenMai == null)
            {
                return HttpNotFound();
            }
            return View(sanPhamKhuyenMai);
        }

        // POST: Manager/SanPhamKhuyenMais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPhamKhuyenMai sanPhamKhuyenMai = db.SanPhamKhuyenMais.Find(id);
            db.SanPhamKhuyenMais.Remove(sanPhamKhuyenMai);
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
