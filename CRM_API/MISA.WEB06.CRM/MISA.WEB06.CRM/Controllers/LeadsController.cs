using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Dapper;
using MySqlConnector;
using MISA.WEB06.CRM.Entities;

namespace MISA.WEB06.CRM.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadsController : ControllerBase
    {
        #region Properties
        readonly string _connectionString;
        MySqlConnection _connection;
        #endregion

        public LeadsController()
        {
            // Khai báo database
            _connectionString = "Host=127.0.0.1;" +
                      "Port=3306;" +
                      "Database=misa.web06.qtkd.hai;" +
                      "User Id =root;" +
                      "Password=anhlaso1;";

            // Khởi tạo kết nối
            _connection = new MySqlConnection(_connectionString);
            _connection.Open();
        }

        /// <summary>
        /// Lấy toàn bổ bản ghi tiềm năng
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IActionResult GetAllLeads()
        {
            try
            {
                // Thực thi lấy dữ liệu:
                string sqlCommand = "SELECT * FROM Leads";

                // Trả về dữ liệu cho client:
                var data = _connection.Query<Lead>(sqlCommand);
                
                return Ok(data);
            }
            catch (Exception ex)
            {
                Console.WriteLine(Resouces.ResourceVN.Error_Exception);
                return StatusCode(400, ex.Message);

            }
        }

        /// <summary>
        /// Lấy thông tin tiềm năng qua mã tiềm năng
        /// </summary>
        /// <param name="leadCode"></param>
        /// <returns></returns>
        /// CreateBy: 
        [HttpGet("{leadCode}")]
        public IActionResult GetLeadById(String leadCode)
        {
            try
            {
                //  lấy dữ liệu
                //  Câu lệnh truy vấn lấy dữ liệu:
                string sqlCommand = "SELECT * FROM Leads l WHERE l.LeadCode = @leadCode";

                // Lưu ý: nếu có tham số truyền trong câu lệnh truy vấn sql thì phải sử dụng DynamicParameter
                var parameters = new DynamicParameters();

                parameters.Add("@leadCode", leadCode);

                // Thực hiện lấy dữ liệu
                var lead = _connection.QueryFirstOrDefault<object>(sql: sqlCommand, param: parameters);

                // trả kết quả cho Client:
                return Ok(lead);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);

            }

        }

        /// <summary>
        /// Xoá một bản ghi tiềm năng bằng id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public IActionResult DeleteLeadById(Guid id)
        {
            try
            {
                //  lấy dữ liệu
                //  Câu lệnh truy vấn lấy dữ liệu:
                string sqlCommand = "DELETE FROM Leads WHERE LeadsID = @leadID";

                // Lưu ý: nếu có tham số truyền trong câu lệnh truy vấn sql thì phải sử dụng DynamicParameter
                var parameters = new DynamicParameters();

                parameters.Add("@leadID", id);

                // Thực hiện lấy dữ liệu
                var lead = _connection.QueryFirstOrDefault<object>(sql: sqlCommand, param: parameters);

                // trả kết quả cho Client:
                return StatusCode(204, "Xóa thành công");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);

            }

        }

        /// <summary>
        /// Thêm mới 1 tiềm năng
        /// </summary>
        /// <param name="newLead"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult AddNewLead([FromBody] Lead newLead)
        {
            try
            {
                //  lấy dữ liệu
                //  Câu lệnh truy vấn lấy dữ liệu:
                var sqlCommand =
                    "INSERT INTO Leads (LeadID, LeadCode, LastName,FirstName, Email, Mobile)" +
                    "VALUES (@LeadID,@LeadCode,@LastName, @FirstName, @Email, @Mobile);";

                // Chuẩn bị tham số đầu vào cho câu lệnh 
                // Lưu ý: nếu có tham số truyền trong câu lệnh truy vấn sql thì phải sử dụng DynamicParameter
                var parameters = new DynamicParameters();
                parameters.Add("@LeadID", Guid.NewGuid().ToString());
                parameters.Add("@LeadCode", newLead.LeadCode);
                parameters.Add("@LastName", newLead.LastName);
                parameters.Add("@FirstName", newLead.FirstName);
                parameters.Add("@Email", newLead.Email);
                parameters.Add("@Mobile", newLead.Mobile);

                // Thực hiện thêm dữ liệu
                var lead = _connection.Query<Lead>(sql: sqlCommand, param: parameters);
                
                if(String.IsNullOrEmpty(newLead.FirstName))
                {
                    var response = new
                    {
                        statusCode = 401,
                    };
                    return Ok(response);
                }

                // trả kết quả cho Client:
                return Ok(newLead);
            }
            catch (Exception ex)
            {
                var response = new
                {
                    statusCode = 400,
                    devMsg = ex.Message,
                    userMsg = ex.Message,
                };
                return Ok(response);
            }
        }

        /// <summary>
        /// Chỉnh xửa một bản ghi
        /// </summary>
        /// <param name="leadId"></param>
        /// <param name="lead"></param>
        /// <returns></returns>
        [HttpPut]
        public IActionResult EditLead(String leadCode, [FromBody] Lead lead)
        {
            try
            {
                //  lấy dữ liệu
                //  Câu lệnh truy vấn lấy dữ liệu:
                var sqlCommand =
                    "UPDATE Leads l" + " SET l.FirstName = @FirstName " + "WHERE l.leadCode = @leadCode;";

                // Lưu ý: nếu có tham số truyền trong câu lệnh truy vấn sql thì phải sử dụng DynamicParameter
                var parameters = new DynamicParameters();

                parameters.Add("@leadCode", leadCode);

                parameters.Add("@LastName", lead.LastName);

                parameters.Add("@FirstName", lead.FirstName);

                // Thực hiện cập nhật dữ liệu
                var leads = _connection.Query<Lead>(sqlCommand, parameters);

                // trả kết quả cho Client:
                return Ok(leads);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);

                throw;
            }
        }

        /// <summary>
        /// Xóa nhiều bản ghi tiềm năng bằng id
        /// </summary>
        /// <param name="leadsID"></param>
        /// <returns></returns>
        [HttpDelete]
        public IActionResult DeleteListLead([FromBody] string[] leadsID)
        {
            try
            {
                // 2. lấy dữ liệu
                // 2.1 Liệt kê các leadID cần xóa:
                string listID = "";

                // Lưu ý: nếu có tham số truyền trong câu lệnh truy vấn sql thì phải sử dụng DynamicParameter
                var parameters = new DynamicParameters();

                for (int i = 0; i < leadsID.Length; i++)
                {
                    string param = $"@param{i}";
                    if (i < leadsID.Length - 1)
                    {
                        listID += param + ",";
                    }
                    else
                    {
                        listID += param;
                    }

                    parameters.Add(param, leadsID[i]);
                }
                // 2.1 Câu lệnh truy vấn xóa dữ liệu:
                string sqlCommand = $"DELETE FROM Leads WHERE leadID IN ({listID})";

                // 2.2 Thực hiện xóa dữ liệu
                var lead = _connection.Query<Lead>(sql: sqlCommand, param: parameters);

                // trả kết quả cho Client:
                return Ok(lead);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// Tạo mới một mã nhân viên = max + 1
        /// </summary>
        /// <returns></returns>
        [HttpGet("NewCode")]
        public string NewLeadCode()
        {
            using (_connection)
            {
                var sqlCommand = "SELECT MAX(l.LeadCode) FROM Leads l;";
                var res = _connection.QueryFirstOrDefault<string>(sql: sqlCommand);
                string[] words = res.Split("-");
                res = words[0] + "-" + (Convert.ToInt32(words[1]) + 1);
                return res;
            }
        }

        /// <summary>
        /// Thực hiện phân trang và lọc khi nhập vào ô input
        /// </summary>
        /// <param name="searchWord"></param>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        [HttpGet("filter")]
        public IActionResult GetResultFilterLead([FromQuery]string? searchWord, [FromQuery]int pageSize = 10, [FromQuery]int pageNumber = 1)
        {
            var procLeadsPaging = "Proc_LeadsPaging";

            using(_connection)
            {
                var parameters = new DynamicParameters();
                parameters.Add("@v_PageNumber", pageNumber);
                parameters.Add("@v_PageSize", pageSize);
                parameters.Add("@v_SearchWord", searchWord);
                parameters.Add("@v_TotalRecord", dbType: System.Data.DbType.Int32, direction: System.Data.ParameterDirection.Output);
                parameters.Add("@v_TotalPage", dbType: System.Data.DbType.Int32, direction: System.Data.ParameterDirection.Output);


                var res = _connection.Query<Lead>(sql: procLeadsPaging, param: parameters, commandType: System.Data.CommandType.StoredProcedure);
                var response = new
                {
                    TotalRecord = parameters.Get<int>("@v_TotalRecord"),
                    TotalPage = parameters.Get<int>("@v_TotalPage"),
                    CurrentPage = pageNumber,
                    CurrentPageRecords = pageSize,
                    Data = res
                };

                return Ok(response);
            }
        }
    }
}
