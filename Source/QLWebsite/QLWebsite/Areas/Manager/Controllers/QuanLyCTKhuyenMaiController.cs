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
    public class QuanLyCTKhuyenMaiController : Controller
    {
        QLWEBSITEEntities db = new QLWEBSITEEntities();
        // GET: Manager/QuanLyCTKhuyenMai
        public ActionResult Index(int? Page)
        {
            int pageNumber = (Page ?? 1);
            int pageSize = 5;
            return View(db.CTKhuyenMais.ToList().OrderBy(n => n.MaKM).ToPagedList(pageNumber, pageSize));
        }

        //Chi tiết
        public ActionResult ChiTiet(int MaKM)
        {
            //Lấy ra đối tượng theo mã
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
            return View();
        }

        [HttpPost]
        public ActionResult ThemMoi(FormCollection f)
        {
            CTKhuyenMai ctKhuyenMai = new CTKhuyenMai();
            ctKhuyenMai.TenCTKM = f["TenCTKM"];
            ctKhuyenMai.NgayBD = DateTime.Parse(f["ngayBD"]);
            ctKhuyenMai.NgayKT = DateTime.Parse(f["ngayKT"]);

            db.CTKhuyenMais.Add(ctKhuyenMai);
            db.SaveChanges();
            return View();
        }

        //Chỉnh sửa
        [HttpGet]
        public ActionResult ChinhSua(int MaKM)
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

        [HttpPost]
        public ActionResult ChinhSua(FormCollection f, int MaKM)
        {

            CTKhuyenMai ctKhuyenMai = db.CTKhuyenMais.SingleOrDefault(n => n.MaKM == MaKM);
            ctKhuyenMai.TenCTKM = f["TenCTKM"];
            ctKhuyenMai.NgayBD = DateTime.Parse(f["ngayBD"]);
            ctKhuyenMai.NgayKT = DateTime.Parse(f["ngayKT"]);

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //Xóa
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