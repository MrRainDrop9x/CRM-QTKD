using Dapper;
using Microsoft.AspNetCore.Mvc;
using MISA.WEB06.CRM.Entities;
using MySqlConnector;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace MISA.WEB06.CRM.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExportController : ControllerBase
    {
        readonly string _connectionString;
        MySqlConnection _connection;

        public ExportController()
        {
            // Khai báo database
            _connectionString = "Host=localhost;" +
                      "Port=3306;" +
                      "Database=misa.web06.qtkd.hai;" +
                      "User Id =root;" +
                      "Password=anhlaso1;";

            // Khởi tạo kết nối
            _connection = new MySqlConnection(_connectionString);
            _connection.Open();
        }
        /// <summary>
        /// Xuất dữ liệu ra file excel
        /// </summary>
        /// <param name="cancellationToken"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> GetExcelFiels(CancellationToken cancellationToken)
        {
           try
            {
                await Task.Yield();
                // Thực thi lấy dữ liệu:
                string sqlCommand = "SELECT * FROM Leads";

                // Trả về dữ liệu cho client:
                var leads = _connection.Query<Lead>(sqlCommand).ToList();

                var stream = new MemoryStream();

                using (var package = new ExcelPackage(stream))
                {
                    // Tạo một sheet mới
                    var workSheet = package.Workbook.Worksheets.Add("CRM LEADS");

                    // Mặc định chiều rộng
                    workSheet.DefaultColWidth = 10;

                    // create title
                    /*workSheet.Cells["A1:F1"].Merge = true;
                    workSheet.Cells["A1"].Value = "Danh sách tiềm năng";
                    workSheet.Cells["A1"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    workSheet.Cells["A1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    workSheet.Cells["A1"].Style.Font.Bold = true;*/

                    // fill header
                    List<string> listHeader = new List<string>()
                    {
                        "A1","B1","C1","D1","E1","F1", "G1","H1","I1","J1","K1","L1","M1","N1","O1","P1","Q1","R1"
                    };
                    listHeader.ForEach(c =>
                    {
                        workSheet.Cells[c].Style.Font.Bold = true;
                        workSheet.Cells[c].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        workSheet.Cells[c].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        workSheet.Cells[c].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        workSheet.Cells[c].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    });
                    workSheet.Cells[listHeader[0]].Value = "Thẻ";
                    workSheet.Cells[listHeader[1]].Value = "Xưng hô";
                    workSheet.Cells[listHeader[2]].Value = "Họ và tên";
                    workSheet.Cells[listHeader[3]].Value = "Chức danh";
                    workSheet.Cells[listHeader[4]].Value = "ĐT di động";
                    workSheet.Cells[listHeader[5]].Value = "ĐT cơ quan"; //6

                    workSheet.Cells[listHeader[6]].Value = "Email cơ quan";
                    workSheet.Cells[listHeader[7]].Value = "Email cá nhân";
                    workSheet.Cells[listHeader[8]].Value = "Tổ chức";
                    workSheet.Cells[listHeader[9]].Value = "Địa chỉ";
                    workSheet.Cells[listHeader[10]].Value = "Tỉnh/Thành phố";
                    workSheet.Cells[listHeader[11]].Value = "Quận/Huyện";
                    workSheet.Cells[listHeader[12]].Value = "Phường/Xã";
                    workSheet.Cells[listHeader[13]].Value = "Nguồn gốc";
                    workSheet.Cells[listHeader[14]].Value = "Loại hình";
                    workSheet.Cells[listHeader[15]].Value = "Lĩnh vực";
                    workSheet.Cells[listHeader[16]].Value = "Mô tả";
        
                    //fill data
                    for (int i = 0; i < leads.Count; i++)
                    {
                        workSheet.Cells[i + 2, 1].Value = ' ';
                        workSheet.Cells[i + 2, 2].Value = leads[i].SalutationName;
                        workSheet.Cells[i + 2, 3].Value = (leads[i].FirstName != null) ? leads[i].FirstName : "-";
                        workSheet.Cells[i + 2, 4].Value = (leads[i].TitleName != null) ? leads[i].TitleName : '-';
                        workSheet.Cells[i + 2, 5].Value = leads[i].Mobile != null ? leads[i].Mobile : "-";
                       

                        workSheet.Cells[i + 2, 6].Value = leads[i].OfficeMobile != null ? leads[i].OfficeMobile : "-";
                        workSheet.Cells[i + 2, 7].Value = leads[i].Email != null ? leads[i].Email : "-";
                        workSheet.Cells[i + 2, 8].Value = leads[i].OfficeEmail != null ? leads[i].OfficeEmail : "-";
                        workSheet.Cells[i + 2, 9].Value = leads[i].CompanyName != null ? leads[i].CompanyName : "-";
                        workSheet.Cells[i + 2, 10].Value = leads[i].Address != null ? leads[i].Address : "-";
                        workSheet.Cells[i + 2, 11].Value = leads[i].ProvinceName != null ? leads[i].ProvinceName : "-";
                        workSheet.Cells[i + 2, 12].Value = leads[i].DistrictName != null ? leads[i].DistrictName : "-";
                        workSheet.Cells[i + 2, 13].Value = leads[i].WardName != null ? leads[i].WardName : "-";
                        workSheet.Cells[i + 2, 14].Value = leads[i].LeadSourceName != null ? leads[i].LeadSourceName : "-";
                        workSheet.Cells[i + 2, 15].Value = leads[i].BusinessTypeName != null ? leads[i].BusinessTypeName : "-";
                        workSheet.Cells[i + 2, 16].Value = leads[i].SectorName != null ? leads[i].SectorName : "-";
                        workSheet.Cells[i + 2, 17].Value = leads[i].Description != null ? leads[i].Description : "-";
                        
                    }

                    // format column width
                    for (int i = 1; i < 19; i++)
                    {
                        workSheet.Column(i).AutoFit();
                    }

                    // format cell border
                    for (int i = 0; i < leads.Count; i++)
                    {
                        for (int j = 1; j < 19; j++)
                        {
                            workSheet.Cells[i + 2, j].Style.Font.Size = 10;
                            workSheet.Cells[i + 2, j].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                            workSheet.Cells[i + 2, j].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                            workSheet.Cells[i + 2, j].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                            workSheet.Cells[i + 2, j].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        }
                    }

                    package.Save();

                }
                stream.Position = 0;

                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Leads.xlsx");

            }

            catch (Exception ex)
            {
                Console.WriteLine(Resouces.ResourceVN.Error_Exception);
                return StatusCode(400, ex.Message);

            }
        }
    }
}
