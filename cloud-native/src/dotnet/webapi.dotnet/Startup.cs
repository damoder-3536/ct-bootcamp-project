using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using webapi.dotnet.Configuration;
using webapi.dotnet.Data;
using webapi.dotnet.HealthCheck;
using webapi.dotnet.HealthCheck.Implementations;
using webapi.dotnet.Service;

namespace webapi.dotnet
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var config = new AppSettingsManager();

            Configuration.Bind(config);

            var todoContext = new TodoContext(config.MongoDB);

            var todoService = new TodoItemService(todoContext);
            services.AddSingleton<ITodoItemService>(todoService);

            services.AddRouting(options => options.LowercaseUrls = true);

            services.AddControllers();

            services.AddHealthChecks()
                .AddCheck<CustomHealthCheck>("Custom-healthcheck", tags: new[] { "readiness", "liveness"})
                .AddMongoDb(mongodbConnectionString: config.MongoDB.ConnectionString,
                        name: "MongoDB",
                        failureStatus: HealthStatus.Unhealthy,
                        tags: new[] { "readiness", "liveness" });

            // Register Health check UI Dashboard
            // services.AddHealthChecksUI()
                        //.AddInMemoryStorage();

            // Register the Swagger generator, defining 1 or more Swagger documents
            services.AddSwaggerGen(c => {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "Cloud Native - Neudesic App Mode ToDo API",
                    Description = "Cloud Native - Neudesic App Mode Initiative",
                });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            // Ping healthcheck endpoint
            app.UseHealthChecks("/health", new HealthCheckOptions {  Predicate = _ => true });

            // Endpoints for Healthprobes - readiness
            app.UseHealthChecks("/health/readiness", new HealthCheckOptions
            {
                Predicate = reg => reg.Tags.Contains("readiness"),
                ResponseWriter = ExtendedHealthCheckOptions.Options.ResponseWriter
            });

            // Endpoints for Healthprobes - liveness
            app.UseHealthChecks("/health/liveness", new HealthCheckOptions
            {
                Predicate = reg => reg.Tags.Contains("liveness"),
                ResponseWriter = ExtendedHealthCheckOptions.Options.ResponseWriter
            });

            //app.UseHealthChecksUI();
            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
