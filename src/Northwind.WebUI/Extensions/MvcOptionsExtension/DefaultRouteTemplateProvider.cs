using Microsoft.AspNetCore.Mvc.Routing;

namespace Northwind.WebUI.Extensions.MvcOptionsExtension
{
    public class DefaultRouteTemplateProvider : IRouteTemplateProvider
    {
        public string Template => "api/[controller]/[action]";
        public int? Order { get; }
        public string Name { get; }
    }
}
