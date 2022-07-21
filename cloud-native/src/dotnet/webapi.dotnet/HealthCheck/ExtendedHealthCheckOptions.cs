using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Newtonsoft.Json;

namespace webapi.dotnet.HealthCheck
{
    public static class ExtendedHealthCheckOptions
    {
        public static HealthCheckOptions Options { get; set; } = new HealthCheckOptions
        {
            ResponseWriter = async (context, report) =>
            {
                context.Response.ContentType = "application/json";

                var response = new HealthCheckResponse
                {
                    Status = report.Status.ToString(),
                    Checks = report.Entries.Select(x => new HealthCheckItem
                    {
                        Component = x.Key,
                        Status = x.Value.Status.ToString(),
                        Description = x.Value.Description,
                        Duration = x.Value.Duration

                    }),
                    Duration = report.TotalDuration
                };

                await context.Response.WriteAsync(JsonConvert.SerializeObject(response));
            }
        };
    }
}
