using MISA.WEB06.CRM.Entities;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace MISA.WEB06.CRM.Helper
{
    public class ExportExcelHelper
    {
        public static async Task<byte[]> GenerateExcelFile(List<Lead> leads)
        {
            var package = new ExcelPackage();
            var workSheet = package.Workbook.Worksheets.Add("CRM LEADS");

            workSheet.DefaultColWidth = 10;

            // create title
            workSheet.Cells["A1:F1"].Merge = true;
            workSheet.Cells["A1"].Value = "Danh sách tiềm năng";
            workSheet.Cells["A1"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            workSheet.Cells["A1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Cells["A1"].Style.Font.Bold = true;
            
            // fill header
            List<string> listHeader = new List<string>()
            {
                "A2","B2","C2","D2","E2","F2"
            };
            listHeader.ForEach(c =>
            {
                workSheet.Cells[c].Style.Font.Bold = true;
                workSheet.Cells[c].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                workSheet.Cells[c].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                workSheet.Cells[c].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                workSheet.Cells[c].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            });
            workSheet.Cells[listHeader[0]].Value = "#";
            workSheet.Cells[listHeader[1]].Value = "LeadID";
            workSheet.Cells[listHeader[2]].Value = "LeadCode";
            workSheet.Cells[listHeader[3]].Value = "FirstName";
            workSheet.Cells[listHeader[4]].Value = "LastName";
            workSheet.Cells[listHeader[5]].Value = "Mobile";
            
            //fill data
            for (int i = 0; i < leads.Count; i++)
            {
                workSheet.Cells[i + 3, 1].Value = (i + 1).ToString();
                workSheet.Cells[i + 3, 2].Value = leads[i].LeadID;
                workSheet.Cells[i + 3, 3].Value =  leads[i].LeadCode;
                workSheet.Cells[i + 3, 4].Value = (leads[i].FirstName != null) ? leads[i].FirstName : "-";
                workSheet.Cells[i + 3, 5].Value = leads[i].LastName != null ? leads[i].LastName : "-";
                workSheet.Cells[i + 3, 6].Value = leads[i].Mobile != null ? leads[i].Mobile : "-";
            }
            
            // format column width
            for (int i = 1; i < 7; i++)
            {
                workSheet.Column(i).AutoFit();
            }
            
            // format cell border
            for (int i = 0; i < leads.Count; i++)
            {
                for (int j = 1; j < 7; j++)
                {
                    workSheet.Cells[i + 2, j].Style.Font.Size = 10;
                    workSheet.Cells[i + 2, j].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    workSheet.Cells[i + 2, j].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                    workSheet.Cells[i + 2, j].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                    workSheet.Cells[i + 2, j].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                }
            }
            return await package.GetAsByteArrayAsync();
        }
    }
}
