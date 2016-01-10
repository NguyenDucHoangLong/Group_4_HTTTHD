using Microsoft.Office.Interop.Excel;
using QLWebsite.Models;
using System;
using System.Collections.Generic;
using System.Data;
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
        private QLWEBSITEEntities db = new QLWEBSITEEntities();
        public ActionResult Index()
        {
            return View();
        }


        //Import dữ liệu từ excel vào database
        private void ImportIntoDatabase(System.Data.DataTable data)
        {
            try
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    int masp;
                    SanPham sp = new SanPham();
                    masp = Int32.Parse(data.Rows[i]["MaSP"].ToString().Trim());
                    sp.LoaiSP = Int32.Parse(data.Rows[i]["LoaiSP"].ToString().Trim());
                    sp.MaDanhMuc = Int32.Parse(data.Rows[i]["MaDanhMuc"].ToString().Trim());
                    sp.SLTon = Int32.Parse(data.Rows[i]["SLTon"].ToString().Trim());
                    sp.TenSP = data.Rows[i]["TenSP"].ToString().Trim();
                    sp.NhaSanXuat = data.Rows[i]["NhaSanXuat"].ToString().Trim();
                    sp.MoTa = data.Rows[i]["MoTa"].ToString().Trim();
                    sp.HinhAnh = data.Rows[i]["HinhAnh"].ToString().Trim();
                    sp.GiaBan = Decimal.Parse(data.Rows[i]["GiaBan"].ToString().Trim());
                    sp.NgayCapNhat = DateTime.Parse(data.Rows[i]["NgayCapNhat"].ToString().Trim());
                    SanPham result = db.SanPhams.Find(masp);
                    if (result == null)
                    {
                        db.SanPhams.Add(sp);
                        db.SaveChanges();
                    }
                    else
                    {
                        result.TenSP = sp.TenSP;
                        result.LoaiSP = sp.LoaiSP;
                        result.DanhMuc = sp.DanhMuc;
                        result.SLTon = sp.SLTon;
                        result.NgayCapNhat = sp.NgayCapNhat;
                        result.GiaBan = sp.GiaBan;
                        result.HinhAnh = sp.HinhAnh;
                        result.MoTa = sp.MoTa;
                        result.TenSP = sp.TenSP;
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {

            }
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
                //string sqlConnectionString = @"Data Source=BRIGHTSMILE\SQLEXPRESS;Initial Catalog=QLWEBSITE;Integrated Security=True";

                System.Data.DataTable data = new System.Data.DataTable();
                //Create connection string to Excel work book
                string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path1 + ";Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1\";";
                //Create Connection to Excel work book
                OleDbConnection excelConnection = new OleDbConnection(excelConnectionString);
                //Create OleDbCommand to fetch data from Excel
                OleDbCommand cmd = new OleDbCommand("Select [MaSP],[LoaiSP],[TenSP],[GiaBan],[DanhMuc],[SLTon],[NhaSanXuat],[NgayCapNhat],[MoTa],[HinhAnh] from [Sheet1$]", excelConnection);

                excelConnection.Open();
                //OleDbDataReader dReader;
                //dReader = cmd.ExecuteReader();
                OleDbDataAdapter oleda = new OleDbDataAdapter();

                oleda.SelectCommand = cmd;

                // Tạo đối tượng DataSet để hứng dữ liệu từ tập tin excel
                DataSet ds = new DataSet();

                // Đổ đữ liệu từ tập excel vào DataSet
                oleda.Fill(ds);

                data = ds.Tables[0];

                ImportIntoDatabase(data);

                //SqlBulkCopy sqlBulk = new SqlBulkCopy(sqlConnectionString);
                ////Give your Destination table name
                //sqlBulk.DestinationTableName = "SanPham";
                //sqlBulk.WriteToServer(dReader);
                excelConnection.Close();


            }

            return RedirectToAction("Index", "Admin");
        }

    }
}
