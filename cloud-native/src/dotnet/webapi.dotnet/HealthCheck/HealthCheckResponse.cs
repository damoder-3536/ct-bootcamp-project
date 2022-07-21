using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace webapi.dotnet.HealthCheck
{
    public class HealthCheckResponse
    {
        public string Status { get; set; }

        public IEnumerable<HealthCheckItem> Checks { get; set; }

        public TimeSpan Duration { get; set; }
    }
}
