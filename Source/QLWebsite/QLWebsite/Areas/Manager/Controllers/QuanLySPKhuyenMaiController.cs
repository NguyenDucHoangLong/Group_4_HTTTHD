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
    public class QuanLySPKhuyenMaiController : Controller
    {

        QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: Manager/QuanLySPKhuyenMai
        public ActionResult Index(int? Page)
        {
            int pageNumber = (Page ?? 1);
            int pageSize = 10;
            return View(db.SanPhamKhuyenMais.ToList().OrderBy(n => n.MaKM).ToPagedList(pageNumber, pageSize));
        }

        //Chi tiết
        public ActionResult ChiTiet(int MaKM, int MaSP)
        {
            SanPhamKhuyenMai spKhuyenMai = db.SanPhamKhuyenMais
                .Where(n => n.MaKM == MaKM && n.MaSP == MaSP).SingleOrDefault();
            return View(spKhuyenMai);
        }

        //Thêm mới
        [HttpGet]
        public ActionResult ThemMoi()
        {
            ViewBag.MaKM = new SelectList(db.CTKhuyenMais, "MaKM", "TenCTKM");
            ViewBag.MaSP = new SelectList(db.SanPhams, "MaSP", "TenSP");
            return View();
        }

        [HttpPost]
        public ActionResult ThemMoi(FormCollection f)
        {
            SanPhamKhuyenMai spKhuyenMai = new SanPhamKhuyenMai();
            spKhuyenMai.MaKM = int.Parse(f["MaKM"]);
            spKhuyenMai.MaSP = int.Parse(f["MaSP"]);
            SanPhamKhuyenMai is_spKhuyenMai;
            is_spKhuyenMai = db.SanPhamKhuyenMais.Where(n => n.MaKM == spKhuyenMai.MaKM && n.MaSP == spKhuyenMai.MaSP).SingleOrDefault();
            if(is_spKhuyenMai == null)
            {
                
                spKhuyenMai.ChietKhau = int.Parse(f["ChietKhau"]);
                db.SanPhamKhuyenMais.Add(spKhuyenMai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("ThemMoi");
            }

        }

        //Chỉnh sửa
        [HttpGet]
        public ActionResult ChinhSua(int MaKM, int MaSP)
        {
            //Lấy ra đối tượng theo mã
            SanPhamKhuyenMai spKhuyenMai = db.SanPhamKhuyenMais
                .Where(n => n.MaKM == MaKM && n.MaSP == MaSP).SingleOrDefault();
            if (spKhuyenMai == null )
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(spKhuyenMai);
        }

        [HttpPost]
        public ActionResult ChinhSua(FormCollection f, int MaKM, int MaSP)
        {
            SanPhamKhuyenMai spKhuyenMai = db.SanPhamKhuyenMais
                .Where(n => n.MaKM == MaKM && n.MaSP == MaSP).SingleOrDefault();
            spKhuyenMai.ChietKhau = int.Parse(f["ChietKhau"]);

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //Xóa
        [HttpGet]
        public ActionResult Xoa(int MaKM, int MaSP)
        {

            //Lấy ra đối tượng theo mã
            SanPhamKhuyenMai spKhuyenMai = db.SanPhamKhuyenMais
                .Where(n => n.MaKM == MaKM && n.MaSP == MaSP).SingleOrDefault();
            if (spKhuyenMai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(spKhuyenMai);
        }

        [HttpPost, ActionName("Xoa")]
        public ActionResult XacNhanXoa(int MaKM, int MaSP)
        {
            //Lấy ra đối tượng theo mã
            SanPhamKhuyenMai spKhuyenMai = db.SanPhamKhuyenMais
                .Where(n => n.MaKM == MaKM && n.MaSP == MaSP).SingleOrDefault();
            if (spKhuyenMai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SanPhamKhuyenMais.Remove(spKhuyenMai);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult CheckName(string makm, string masp)
        {
            int MaKM = int.Parse(makm);
            int MaSP = int.Parse(masp);
            var respone = new { Code = "1", Mgs = "success" };
            var result = db.SanPhamKhuyenMais.Where(s => s.MaKM == MaKM && s.MaSP == MaSP).FirstOrDefault();
            if (result != null)
                respone = new { Code = "0", Mgs = "fail" };
            return Json(respone, JsonRequestBehavior.AllowGet);
        }

    }
}