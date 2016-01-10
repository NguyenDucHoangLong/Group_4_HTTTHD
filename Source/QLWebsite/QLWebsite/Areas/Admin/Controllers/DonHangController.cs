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
    public class DonHangController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: /Admin/DonHang/
        public ActionResult Index(int page=1, int pageSize=10)
        {
            var donhangs = db.DonHangs.Include(d => d.KhachHang).OrderBy(d=>d.MaDH).ToPagedList(page,pageSize);
            return View(donhangs);
        }
        public ActionResult Fillter(string trangthai,int page = 1, int pageSize = 10)
        {
            int id = int.Parse(trangthai);
            if (id == 0)
                return RedirectToAction("Index");
            var donhangs = db.DonHangs.Include(d => d.KhachHang).Where(d=>d.TinhTrangDonHang == id).OrderBy(d => d.MaDH).ToPagedList(page, pageSize);
            return View(donhangs);
        }
        // GET: /Admin/DonHang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donhang = db.DonHangs.Find(id);
            if (donhang == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKH = new SelectList(db.KhachHangs, "MaKH", "TenKH", donhang.MaKH);
            return View(donhang);
        }

        // POST: /Admin/DonHang/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="MaDH,NgayLap,NgayGiao,DiaChiGiao,TinhTrangDonHang,DaThanhToan,TongTien,MaKH")] DonHang donhang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donhang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaKH = new SelectList(db.KhachHangs, "MaKH", "TenKH", donhang.MaKH);
            return View(donhang);
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
