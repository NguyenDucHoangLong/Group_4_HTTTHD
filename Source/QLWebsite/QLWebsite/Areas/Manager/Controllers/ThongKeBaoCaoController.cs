using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLWebsite.Models;

namespace QLWebsite.Areas.Manager.Controllers
{
    public class ThongKeBaoCaoController : Controller
    {
        QLWEBSITEEntities db = new QLWEBSITEEntities();
        // GET: Manager/ThongKeBaoCao
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public JsonResult ThongKe(string pNgayBatDau, string pNgayKetThuc, string TinhTrangDonHang)
        {
            DateTime NgayBatDau = DateTime.Parse(pNgayBatDau);
            DateTime NgayKetThuc = DateTime.Parse(pNgayKetThuc);

            int TT;
            if (TinhTrangDonHang == "Đã nhận hàng")
                TT = 1;
            else if (TinhTrangDonHang == "Đơn hàng bị hủy")
                TT = -1;
            else
                TT = 0;
        
            var LstDonHang = db.ThongKe(NgayBatDau, NgayKetThuc, TT);
            

            return Json(LstDonHang, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult ThongKe_BieuDo(string pNgayBatDau, string pNgayKetThuc)
        {
            DateTime NgayBatDau = DateTime.Parse(pNgayBatDau);
            DateTime NgayKetThuc = DateTime.Parse(pNgayKetThuc);
            var SoDHDaNhan = db.ThongKe_TiLeDonHang(NgayBatDau, NgayKetThuc, 1);
            var SoDHBiHuy = db.ThongKe_TiLeDonHang(NgayBatDau, NgayKetThuc, -1);
            var SoDHDangCho = db.ThongKe_TiLeDonHang(NgayBatDau, NgayKetThuc, 0);

            var lst = new {
                soDHDaNhan = SoDHDaNhan.First(),
                soDHBiHuy = SoDHBiHuy.First(),
                soDHDangCho = SoDHDangCho.First()
            };

            return Json(lst, JsonRequestBehavior.AllowGet);

    }
      

    }
}