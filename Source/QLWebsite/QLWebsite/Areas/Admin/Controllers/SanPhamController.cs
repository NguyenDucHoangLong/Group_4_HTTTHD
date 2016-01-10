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
    public class SanPhamController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: /Admin/SanPham/
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var sanphams = db.SanPhams.Include(s=>s.DanhMuc).Include(s => s.LoaiSanPham).OrderBy(s=>s.MaSP).ToPagedList(page, pageSize);
            return View(sanphams);
        }

        public ActionResult Fillter(string loaisp, int page=1, int pageSize=10)
        {
            int id=int.Parse(loaisp);
            if (id == 0)
                return RedirectToAction("Index");
            var sanphams=db.SanPhams.Where(s=>s.LoaiSP == id).OrderBy(s=>s.MaSP).ToPagedList(page,pageSize);
            return View(sanphams);
        }
        // GET: /Admin/SanPham/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanpham = db.SanPhams.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            return View(sanpham);
        }

        // GET: /Admin/SanPham/Create
        public ActionResult Create()
        {
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc");
            ////ViewBag.LoaiSP = new SelectList(db.LoaiSanPhams, "MaLoai", "TenLoaiSP");
            return View();
        }

        // POST: /Admin/SanPham/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="MaSP,LoaiSP,TenSP,GiaBan,MaDanhMuc,SLTon,NhaSanXuat,NgayCapNhat,MoTa,HinhAnh")] SanPham sanpham)
        {
            if (ModelState.IsValid)
            {
                sanpham.NgayCapNhat = DateTime.Today;
                db.SanPhams.Add(sanpham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", sanpham.DanhMuc);
            ViewBag.LoaiSP = new SelectList(db.LoaiSanPhams, "MaLoai", "TenLoaiSP", sanpham.LoaiSP);
            return View(sanpham);
        }

        // GET: /Admin/SanPham/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanpham = db.SanPhams.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", sanpham.DanhMuc);
            ViewBag.LoaiSP = new SelectList(db.LoaiSanPhams, "MaLoai", "TenLoaiSP", sanpham.LoaiSP);
            return View(sanpham);
        }

        // POST: /Admin/SanPham/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="MaSP,LoaiSP,TenSP,GiaBan,MaDanhMuc,SLTon,NhaSanXuat,NgayCapNhat,MoTa,HinhAnh")] SanPham sanpham)
        {
            if (ModelState.IsValid)
            {
                sanpham.NgayCapNhat = DateTime.Today;
                db.Entry(sanpham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", sanpham.DanhMuc);
            ViewBag.LoaiSP = new SelectList(db.LoaiSanPhams, "MaLoai", "TenLoaiSP", sanpham.LoaiSP);
            return View(sanpham);
        }

        // GET: /Admin/SanPham/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanpham = db.SanPhams.Find(id);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            return View(sanpham);
        }

        // POST: /Admin/SanPham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanpham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanpham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult CheckName(string tensp)
        {
            SanPham sanpham = db.SanPhams.Where(s => s.TenSP==tensp).FirstOrDefault();
            var respone = new { Code = "0", Mgs = "false" };
            if (sanpham != null)
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
