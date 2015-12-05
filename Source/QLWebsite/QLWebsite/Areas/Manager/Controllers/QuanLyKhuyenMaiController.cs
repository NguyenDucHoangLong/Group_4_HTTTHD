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
    public class QuanLyKhuyenMaiController : Controller
    {
        QLWEBSITEEntities db = new QLWEBSITEEntities();
        // GET: Manager/QuanLyKhuyenMai
        public ActionResult Index(int? Page)
        {
            int pageNumber = (Page ?? 1);
            int pageSize = 2;
            return View(db.CTKhuyenMais.ToList().OrderBy(n => n.MaKM).ToPagedList(pageNumber, pageSize));
        }

        //Chi tiết
        public ActionResult ChiTiet(int MaKM)
        {
            //Lấy đối tượng theo mã
            CTKhuyenMai ctKhuyenMai = db.CTKhuyenMais.SingleOrDefault(n => n.MaKM == MaKM);
            if(ctKhuyenMai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ctKhuyenMai);
        }
        //Thêm mới
        [HttpGet]
        public ActionResult ThemMoi()
        {
            //Đưa dữ liệu vào dropdownlist
            ViewBag.MaSP = new SelectList(db.SanPhams.ToList().OrderBy(n => n.TenSP), "MaSP", "TenSP");
            return View();
        }

        [HttpPost]
        public ActionResult ThemMoi(FormCollection f)
        {
            //Đưa dữ liệu vào dropdownlist
            ViewBag.MaSP = new SelectList(db.SanPhams.ToList().OrderBy(n => n.TenSP), "MaSP", "TenSP");
            CTKhuyenMai ctKhuyenMai = new CTKhuyenMai();
            ctKhuyenMai.MaKM = int.Parse(f["MaKM"]);
            ctKhuyenMai.MaSP = int.Parse(f["MaSP"]);
            ctKhuyenMai.ChietKhau = float.Parse(f["ChietKhau"]);
            ctKhuyenMai.NgayBD = DateTime.Parse(f["NgayBD"]);
            ctKhuyenMai.NgayKT = DateTime.Parse(f["NgayKT"]);

            db.CTKhuyenMais.Add(ctKhuyenMai);
            db.SaveChanges();

            return View();
        }

        //Chỉnh sửa
        [HttpGet]
        public ActionResult ChinhSua(int MaKM)
        {

            //Lấy đối tượng theo mã
            CTKhuyenMai ctKhuyenMai = db.CTKhuyenMais.SingleOrDefault(n => n.MaKM == MaKM);
            if(ctKhuyenMai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ctKhuyenMai);
        }
        [HttpPost]
        public ActionResult ChinhSua(int MaKM, FormCollection f)
        {

            CTKhuyenMai ctKhuyenMai = db.CTKhuyenMais.SingleOrDefault(n => n.MaKM == MaKM);
            ctKhuyenMai.ChietKhau = float.Parse(f["ChietKhau"]);
            ctKhuyenMai.NgayBD = DateTime.Parse(f["NgayBD"]);
            ctKhuyenMai.NgayKT = DateTime.Parse(f["NgayKT"]);

            db.SaveChanges();

            return RedirectToAction("Index");
        }

        //Xóa chương trình khuyến mãi
        [HttpGet]
        public ActionResult Xoa(int MaKM)
        {
            //Lấy ra đối tượng theo mã
           CTKhuyenMai ctKhuyenMai = db.CTKhuyenMais.SingleOrDefault(n => n.MaKM == MaKM);
            if (ctKhuyenMai == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(ctKhuyenMai);
        }

        [HttpPost, ActionName("Xoa")]
        public ActionResult XacNhanXoa(int MaKM)
        {
            //Lấy ra đối tượng theo mã
            CTKhuyenMai ctKhuyenMai = db.CTKhuyenMais.SingleOrDefault(n => n.MaKM == MaKM);
            if (ctKhuyenMai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.CTKhuyenMais.Remove(ctKhuyenMai);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    
    }
}