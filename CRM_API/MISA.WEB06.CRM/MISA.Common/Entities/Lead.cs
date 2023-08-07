using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MISA.Common.Entities
{
    public class Lead
    {
        public Guid LeadsId { get; set; }

        public string? LeadsName { get; set; }

        public String? Email { get; set; }

        public String? Phone { get; set; }
    }
}
