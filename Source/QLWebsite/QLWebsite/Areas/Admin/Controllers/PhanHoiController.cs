using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using QLWebsite.Models;
using PagedList;

namespace QLWebSite.Areas.Admin.Controllers
{
    public class PhanHoiController : Controller
    {
        private QLWEBSITEEntities db = new QLWEBSITEEntities();

        // GET: /Admin/PhanHoi/
        public ActionResult Index(int page=1, int pageSize=10)
        {
            var phanhoi = db.PhanHois.Where(s=>s.TrangThai==false).OrderBy(s => s.MaPhanHoi).ToPagedList(page, pageSize);
            foreach (var item in phanhoi)
            {
                if (item.NoiDung.Length > 65)
                {
                    item.NoiDung = item.NoiDung.Substring(0, 65);
                }
            }
            return View(phanhoi);
        }
        public ActionResult Fillter(string chude, int page = 1, int pageSize = 10)
        {
            if (chude == "Tất cả")
                return RedirectToAction("Index");
            var phanhoi = db.PhanHois.Where(s => s.TrangThai == false && s.ChuDe==chude).OrderBy(s => s.MaPhanHoi).ToPagedList(page, pageSize);
            foreach (var item in phanhoi)
            {
                if (item.NoiDung.Length > 65)
                {
                    item.NoiDung = item.NoiDung.Substring(0, 65);
                }
            }
            return View(phanhoi);
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanHoi phanhoi = db.PhanHois.Find(id);
            if (phanhoi == null)
            {
                return HttpNotFound();
            }
            return View(phanhoi);
        }
        // GET: /Admin/PhanHoi/Delete/5
        public ActionResult Delete(int id)
        {
            PhanHoi phanhoi = db.PhanHois.Find(id);
            if (phanhoi == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.PhanHois.Remove(phanhoi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
        public ActionResult Reply(int MaPost, string ChuDe, string Email)
        {
            ViewData["MaPost"] = MaPost;
            ViewData["ChuDe"] = ChuDe;
            ViewData["Email"] = Email;
            return View();
        }
        public ActionResult SendMail(string mapost, string email, string chude, string noidung)
        {
            SmtpClient smtp = new SmtpClient();
            try 
            {
                // địa chỉ smtp sever
                smtp.Host = "smtp.gmail.com";
                // cổng smtp
                smtp.Port = 587;
                // mã hóa mail
                smtp.EnableSsl = true;
                // username, password mail người gửi
                smtp.Credentials = new NetworkCredential("yoloshop12345@gmail.com", "yolo12345");
                // gửi mail
                smtp.Send("yoloshop12345@gmail.com", email, chude, noidung);
                // Chỉnh sửa trạng thái phản hồi
                PhanHoi phanhoi = db.PhanHois.Find(int.Parse(mapost));
                phanhoi.TrangThai = true;
                db.SaveChanges();
                var respone = new { Code="1", Mgs="Success"};
                return Json(respone, JsonRequestBehavior.AllowGet);
            }
            catch(Exception ex)
            {
                var respone = new { Code = "0", Mgs = ex.Message };
                return Json(respone, JsonRequestBehavior.AllowGet);
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
