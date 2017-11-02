using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TLog.Models
{
    public class ActivityViewModel
    {
        public int Id { get; set; }
        public int ServiceLineId { get; set; }
        public string ServiceLineName { get; set; }

        public string Name { get; set; }
        public bool Active { get; set; }
    }
}