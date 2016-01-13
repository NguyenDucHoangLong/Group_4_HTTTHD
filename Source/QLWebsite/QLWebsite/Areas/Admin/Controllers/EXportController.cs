using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLWebsite.Models;

using System.IO;
using System.Web.UI;
using System.Text;
using System.Data.OleDb;
using Excel = Microsoft.Office.Interop.Excel;


namespace QLWebsite.Areas.Admin.Controllers
{
    public class ExportController : Controller
    {
        //
        // GET: /Admin/EXport/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ExportToExcel(string ExcelFilePath, string LoaiSP)
        {
            DataTable Tb1 = GetData(LoaiSP);
            try
            {
                if (Tb1 == null || Tb1.Columns.Count == 0)
                    throw new Exception("ExportToExcel: Null or empty input table!\n");

                // load excel, and create a new workbook
                Excel.Application excelApp = new Excel.Application();
                excelApp.Workbooks.Add();

                // single worksheet
                Excel._Worksheet workSheet = excelApp.ActiveSheet;

                // column headings
                for (int i = 0; i < Tb1.Columns.Count; i++)
                {
                    workSheet.Cells[1, (i + 1)] = Tb1.Columns[i].ColumnName;
                }

                // rows
                for (int i = 0; i < Tb1.Rows.Count; i++)
                {
                    // to do: format datetime values before printing
                    for (int j = 0; j < Tb1.Columns.Count; j++)
                    {
                        workSheet.Cells[(i + 2), (j + 1)] = Tb1.Rows[i][j];
                    }
                }

                // check fielpath
                if (ExcelFilePath != null && ExcelFilePath != "")
                {
                    try
                    {
                        workSheet.SaveAs(@"D:\" + ExcelFilePath + ".xlsx");
                        excelApp.Quit();
                        //MessageBox.Show("Excel file saved!");
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("ExportToExcel: Excel file could not be saved! Check filepath.\n" + ex.Message);
                    }
                }
                else    // no filepath is given
                {
                    excelApp.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("ExportToExcel: \n" + ex.Message);
            }
            return RedirectToAction("Index", "Admin");
        }
        private DataTable GetData(string LoaiSP)
        {
            String conString = @"data source=QLWEBSITE.mssql.somee.com;user id=nplinh234;pwd=123456789;initial catalog=QLWEBSITE; persist security info=False;";
            String sql = "select * from SanPham where LoaiSP=" + int.Parse(LoaiSP);
            if (LoaiSP == "0")
                sql = "select * from SanPham";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = conString;
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            try
            {
                sda.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }
	}
}