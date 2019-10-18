using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        static readonly object _object = new object();
        // GET api/values
        [HttpGet]
        public async Task Get()
        {
            using (var con = new SqlConnection("Server=.;Database=TestDB;Trusted_Connection=True;"))
            {
                con.Open();
                lock (_object)
                {
                    Task[] tasks = new Task[1];
                    tasks[0] = (InsertData(1, "Kannan", con));
                    Task.WaitAll(tasks);
                };

            }
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        private async Task<int> GetId(SqlConnection con)
        {

            int id = 0;
            using (var cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "SELECT MAX(Id) FROM tbl_Test";
                var idfromDb = await Task.Factory.StartNew(() => cmd.ExecuteScalar());
                id = string.IsNullOrEmpty(idfromDb.ToString()) ? 0 : (int)idfromDb;
            }
            return id + 1;

        }
        private async Task InsertData(int id, string name, SqlConnection con)
        {
            Thread.Sleep(30000);
            using (var cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = $"Insert into tbl_Test(Id,Name) VALUES({await GetId(con)},'{name}')";
                await cmd.ExecuteNonQueryAsync();

            }
        }
        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
