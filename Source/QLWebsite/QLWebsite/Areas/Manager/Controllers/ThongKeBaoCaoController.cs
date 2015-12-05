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

        public ActionResult ThongKe_BieuDo()
        {
            return View();
        }
        //public ActionResult ThongKe_TiLe(FormCollection f)
        //{
        //    DateTime NgayBatDau = DateTime.Parse(f["NgayBatDau"]);
        //    DateTime NgayKetThuc = DateTime.Parse(f["NgayKetThuc"]);

        //    string SoDHDaNhan = db.ThongKe_TiLeDonHang(NgayBatDau, NgayKetThuc, 1).ToString();
        //    string SoDHBiHuy = db.ThongKe_TiLeDonHang(NgayBatDau, NgayKetThuc, -1).ToString();
        //    string SoDHDangCho = db.ThongKe_TiLeDonHang(NgayBatDau, NgayKetThuc, 0).ToString();


        //}


    }
}