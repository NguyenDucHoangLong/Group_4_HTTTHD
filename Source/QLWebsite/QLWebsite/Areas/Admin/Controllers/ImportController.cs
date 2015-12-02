using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace QLWebsite.Areas.Admin.Controllers
{
    public class ImportController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Importexcel()
        {


            if (Request.Files["FileUpload1"].ContentLength > 0)
            {
                string extension = System.IO.Path.GetExtension(Request.Files["FileUpload1"].FileName);
                string path1 = string.Format("{0}/{1}", Server.MapPath("~/Content/UploadedFolder"), Request.Files["FileUpload1"].FileName);
                if (System.IO.File.Exists(path1))
                    System.IO.File.Delete(path1);

                Request.Files["FileUpload1"].SaveAs(path1);
                string sqlConnectionString = @"Data Source=BRIGHTSMILE\SQLEXPRESS;Initial Catalog=QLWEBSITE;Integrated Security=True";


                //Create connection string to Excel work book
                string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path1 + ";Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1\";";
                //Create Connection to Excel work book
                OleDbConnection excelConnection = new OleDbConnection(excelConnectionString);
                //Create OleDbCommand to fetch data from Excel
                OleDbCommand cmd = new OleDbCommand("Select [MaSP],[LoaiSP],[TenSP],[GiaBan],[DanhMuc],[SLTon],[NhaSanXuat],[NgayCapNhat],[MoTa],[HinhAnh] from [Sheet1$]", excelConnection);

                excelConnection.Open();
                OleDbDataReader dReader;
                dReader = cmd.ExecuteReader();

                SqlBulkCopy sqlBulk = new SqlBulkCopy(sqlConnectionString);
                //Give your Destination table name
                sqlBulk.DestinationTableName = "SanPham";
                sqlBulk.WriteToServer(dReader);
                excelConnection.Close();


            }

            return RedirectToAction("Index", "Admin");
        }

    }
}
