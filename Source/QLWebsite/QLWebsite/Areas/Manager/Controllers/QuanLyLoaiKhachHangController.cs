using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLWebsite.Models;
using PagedList;
using PagedList.Mvc;

namespace QLWebsite.Areas.Manager.Controllers
{
    public class QuanLyLoaiKhachHangController : Controller
    {
        QLWEBSITEEntities db = new QLWEBSITEEntities();
        // GET: Manager/QuanLyLoaiKhachHang
        public ActionResult Index(int? Page)
        {
            int pageNumber = (Page ?? 1);
            int pageSize = 5;
            return View(db.LoaiKHs.ToList().OrderBy(n => n.MaCapBac).ToPagedList(pageNumber, pageSize));
        }
        
        //Chi tiết
        public ActionResult ChiTiet(int MaCapBac)
        {
            //Lấy ra đối tượng theo mã
            LoaiKH loaiKH = db.LoaiKHs.SingleOrDefault(n => n.MaCapBac == MaCapBac);
            if(loaiKH == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(loaiKH);
        }

        //Thêm mới
        [HttpGet]
        public ActionResult ThemMoi()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemMoi(FormCollection f)
        {
            LoaiKH loaiKH = new LoaiKH();
            loaiKH.TenCapBac = f["TenCapBac"];
            loaiKH.ChietKhau = float.Parse(f["ChietKhau"]);
            loaiKH.NgayApDung = DateTime.Parse(f["NgayApDung"]);
            db.LoaiKHs.Add(loaiKH);
             db.SaveChanges();
            
            return View();
        }

        //Chỉnh sửa
        [HttpGet]
        public ActionResult ChinhSua(int MaCapBac)
        {
            //Lấy ra đối tượng theo mã
            LoaiKH loaiKH = db.LoaiKHs.SingleOrDefault(n => n.MaCapBac == MaCapBac);
            if(loaiKH == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(loaiKH);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChinhSua(int MaCapBac, FormCollection f)
        {
            
            LoaiKH loaiKh = db.LoaiKHs.SingleOrDefault(n => n.MaCapBac == MaCapBac);
            loaiKh.TenCapBac = f["TenCapBac"];
            loaiKh.ChietKhau = int.Parse(f["ChietKhau"]);
            loaiKh.NgayApDung = DateTime.Parse(f["NgayApDung"]);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //Xóa loại khách hàng
        [HttpGet]
        public ActionResult Xoa(int MaCapBac)
        {
            //Lấy ra đối tượng theo mã
            LoaiKH loaiKH = db.LoaiKHs.SingleOrDefault(n => n.MaCapBac == MaCapBac);
            if (loaiKH == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(loaiKH);
        }

        [HttpPost, ActionName("Xoa")]
        public ActionResult XacNhanXoa(int MaCapBac)
        {
            //Lấy ra đối tượng theo mã
            LoaiKH loaiKH = db.LoaiKHs.SingleOrDefault(n => n.MaCapBac == MaCapBac);
            if (loaiKH == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.LoaiKHs.Remove(loaiKH);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}