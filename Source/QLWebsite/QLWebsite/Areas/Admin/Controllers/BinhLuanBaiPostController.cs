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
    public class BinhLuanBaiPostController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: /Admin/BinhLuanBaiPost/
        public ActionResult Index(int id, int page=1, int pageSize=10)
        {
            var binhluanbaiposts = db.BinhLuanBaiPosts.Include(b => b.BaiPost).Include(b => b.TaiKhoan).Where(b=>b.MaPost==id && b.TrangThai!=false).OrderBy(b=>b.MaPost).ToPagedList(page, pageSize);
            foreach (var item in binhluanbaiposts)
            {
                if (item.NoiDungBinhLuan.Length > 85)
                {
                    item.NoiDungBinhLuan = item.NoiDungBinhLuan.Substring(0, 85);
                }
            }
            return View(binhluanbaiposts);
        }

        // GET: /Admin/BinhLuanBaiPost/Edit/5
        public ActionResult Edit(int mapost, int manguoi, DateTime thoigian)
        {
            
            BinhLuanBaiPost binhluanbaipost = db.BinhLuanBaiPosts.Where(s=>s.MaPost==mapost && s.NguoiBinhLuan==manguoi && s.ThoiGianBinhLuan==thoigian).FirstOrDefault();
            if (binhluanbaipost == null)
            {
                return HttpNotFound();
            }
            else
            {
                // trạng thái là fasle thì bình luận không hiển thị
                binhluanbaipost.TrangThai = false;
                db.SaveChanges();
                return RedirectToAction("Index", "BinhLuanBaiPost", new { id = mapost });
            }
        }


        // GET: /Admin/BinhLuanBaiPost/Delete/5
        public ActionResult Delete(int mapost, int manguoi, DateTime thoigian)
        {
            BinhLuanBaiPost binhluanbaipost = db.BinhLuanBaiPosts.Where(s => s.MaPost == mapost && s.NguoiBinhLuan == manguoi && s.ThoiGianBinhLuan == thoigian).FirstOrDefault();
            if (binhluanbaipost == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.BinhLuanBaiPosts.Remove(binhluanbaipost);
                db.SaveChanges();
                return RedirectToAction("Index", "BinhLuanBaiPost", new { id = mapost });
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
