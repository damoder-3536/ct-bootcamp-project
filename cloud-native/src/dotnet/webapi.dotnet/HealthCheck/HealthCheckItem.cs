using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace webapi.dotnet.HealthCheck
{
    public class HealthCheckItem
    {
        public string Status { get; set; }

        public string Component { get; set; }

        public string Description { get; set; }

        public TimeSpan Duration { get; set; }
    }
}
