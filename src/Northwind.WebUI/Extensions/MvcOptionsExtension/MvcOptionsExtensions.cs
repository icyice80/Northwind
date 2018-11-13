using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;

namespace Northwind.WebUI.Extensions.MvcOptionsExtension
{
    public static class MvcOptionsExtensions
    {
        public static void UseRoutePrefix(this MvcOptions opts, IRouteTemplateProvider routeTemplateProvider)
        {
            opts.Conventions.Add(new RoutePrefixConvention(routeTemplateProvider));
        }
    }
}
