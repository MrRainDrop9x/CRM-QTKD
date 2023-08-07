using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MISA.Common.Entities;
using Dapper;
using MySqlConnector;

namespace MISA.DL.Repository
{
    public class LeadRepository: IDisposable
    {
        readonly string _connectionString;
        MySqlConnection _connection;

        public LeadRepository()
        {
            // Khai báo database
            _connectionString =  "Host=3.0.89.182;" +
                      "Port=3306;" +
                      "Database=MISA.WEB06.QTKD.HAI;" +
                      "User Id =dev;" +
                      "Password=12345678;";

            // Khởi tạo kết nối
            _connection = new MySqlConnection(_connectionString);
            _connection.Open();
        }

        public void Dispose()
        {
            _connection.Dispose();
            _connection.Close();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Lead> getAll()
        {
            // Khai báo database
            var connectionString = "";

            // Khởi tạo kết nối
            var connection = new MySqlConnection(connectionString);

            // Khai báo sqlCommand
            var sql = "SELECT * FROM Lead";

            // Thực hiện lấy dữ liệu:
            var leads = connection.Query<Lead>(sql);
            return leads;
        }

        /// <summary>
        /// Lấy thông tin tiềm năng theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Đối tượng có id tương ứng</returns>
        public Lead GetByID(Guid id)
        {
            
         

            
            

            // Khai báo sqlCommand
            var sql = "SELECT * FROM Lead WHERE LeadsID = @id";

            // Khai báo parameters:
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);

            // Thực hiện lấy dữ liệu:
            var lead = _connection.QueryFirstOrDefault<Lead>(sql, param: parameters);
            return lead;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="lead"></param>
        /// <returns></returns>
        public int Insert(Lead lead)
        {
           

            // Thực hiện transaction: 
            using (var transaction = _connection.BeginTransaction())
            {
                var storeName = "Proc_InsertLead";

                var parameters = new DynamicParameters();
                parameters.Add("@id", Guid.NewGuid());
                parameters.Add("@name", lead.LeadsName);
                parameters.Add("@email", lead.Email);
                parameters.Add("@phone", lead.Phone);

                parameters.Add("m_LeadName", lead.LeadsName);
                var rowsEffect = _connection.Execute(storeName, param: parameters, transaction: transaction,commandType: System.Data.CommandType.StoredProcedure);
                transaction.Commit();

                return 1;
            }

            // Khai báo sqlCommand
           // var sql = "SELECT * FROM Lead WHERE @id";
        }
    }
}
