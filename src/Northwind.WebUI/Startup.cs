using System.Reflection;
using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using Northwind.Application;
using Northwind.Application.Products.Queries.GetAllProducts;
using Northwind.Persistence;
using Northwind.WebUI.Extensions.MvcOptionsExtension;

namespace Northwind.WebUI
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
           
            services.AddMediatR(typeof(GetAllProductsQueryHandler).GetTypeInfo().Assembly);

            services.AddAutoMapper(c=>c.AddProfile(typeof(ApplicationProfile)));

            services.AddDbContext<NorthwindDbContext>(opts =>
            {
                opts.UseSqlServer(Configuration.GetConnectionString("MemoryConnection"))
                    .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
            });

            services.AddMvc(c => { c.UseRoutePrefix(new DefaultRouteTemplateProvider()); })
                    .AddJsonOptions(t=>t.SerializerSettings.NullValueHandling = NullValueHandling.Ignore)
                    .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors(b=>b.AllowAnyOrigin());

            app.UseMvc();
        }
    }
}
