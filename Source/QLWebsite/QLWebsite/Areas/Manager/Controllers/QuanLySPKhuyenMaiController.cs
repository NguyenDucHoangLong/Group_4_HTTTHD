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
            int pageSize = 5;
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
            return View();
        }

        [HttpPost]
        public ActionResult ThemMoi(FormCollection f)
        {
            SanPhamKhuyenMai spKhuyenMai = new SanPhamKhuyenMai();
            spKhuyenMai.MaKM = int.Parse(f["MaKM"]);
   
            return View();
        }
    }
}