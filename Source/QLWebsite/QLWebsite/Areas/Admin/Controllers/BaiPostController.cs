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
    public class BaiPostController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: /Admin/BaiPost/
        public ActionResult Index(int page=1, int pageSize=10)
        {
            var baiposts = db.BaiPosts.Where(b=>b.TrangThai!=false).Include(b => b.TaiKhoan).OrderBy(b=>b.MaPost).ToPagedList(page, pageSize);
            foreach(var item in baiposts)
            {
                if(item.NoiDung.Length>65)
                {
                    item.NoiDung = item.NoiDung.Substring(0,65);
                }
            }
            return View(baiposts);
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiPost baipost = db.BaiPosts.Find(id);
            if (baipost == null)
            {
                return HttpNotFound();
            }
            return View(baipost);
        }

        // GET: /Admin/BaiPost/Create
        public ActionResult Create()
        {
            ViewBag.NguoiPost = new SelectList(db.TaiKhoans.Where(s=>s.Quyen==1||s.Quyen==2), "ID", "TenTaiKhoan");
            return View();
        }

        // POST: /Admin/BaiPost/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="MaPost,NoiDung,ThoiGianPost,HinhAnh,TrangThai,NguoiPost")] BaiPost baipost)
        {
            if (ModelState.IsValid)
            {
                baipost.ThoiGianPost = DateTime.Today;
                // trạng thái là true thì được hiển thị trên diễn đàn
                baipost.TrangThai = true;
                db.BaiPosts.Add(baipost);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.NguoiPost = new SelectList(db.TaiKhoans.Where(s=>s.Quyen==1||s.Quyen==2), "ID", "TenTaiKhoan", baipost.NguoiPost);
            return View(baipost);
        }

        // GET: /Admin/BaiPost/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiPost baipost = db.BaiPosts.Find(id);
            if (baipost == null)
            {
                return HttpNotFound();
            }
            ViewBag.NguoiPost = new SelectList(db.TaiKhoans, "ID", "TenTaiKhoan", baipost.NguoiPost);
            return View(baipost);
        }

        // POST: /Admin/BaiPost/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="MaPost,NoiDung,ThoiGianPost,HinhAnh,TrangThai,NguoiPost")] BaiPost baipost)
        {
            if (ModelState.IsValid)
            {
                db.Entry(baipost).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.NguoiPost = new SelectList(db.TaiKhoans, "ID", "TenTaiKhoan", baipost.NguoiPost);
            return View(baipost);
        }

        // GET: /Admin/BaiPost/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaiPost baipost = db.BaiPosts.Find(id);
            if (baipost == null)
            {
                return HttpNotFound();
            }
            else
            {
                var result = db.BinhLuanBaiPosts.Where(s => s.MaPost == baipost.MaPost).FirstOrDefault();
                if(result!=null)
                {
                    var result1 = db.BinhLuanBaiPosts.Where(s => s.MaPost == baipost.MaPost);
                    foreach (var item in result1)
                    {
                        db.BinhLuanBaiPosts.Remove(item);
                    }
                }
                db.BaiPosts.Remove(baipost);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
        public ActionResult LogPost(int id)
        {
            BaiPost baipost = db.BaiPosts.Find(id);
            if(baipost==null)
            {
                return HttpNotFound();
            }
            else
            {
                // trạng thái là false thì không hiển thị trên diễn đàn
                baipost.TrangThai = false;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
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
