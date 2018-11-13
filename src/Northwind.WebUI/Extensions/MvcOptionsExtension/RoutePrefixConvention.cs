using System.Linq;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.AspNetCore.Mvc.Routing;

namespace Northwind.WebUI.Extensions.MvcOptionsExtension
{
    public class RoutePrefixConvention : IApplicationModelConvention
    {

        private readonly AttributeRouteModel _routePrefix;
        public RoutePrefixConvention(IRouteTemplateProvider routeAttribute)
        {
            this._routePrefix = new AttributeRouteModel(routeAttribute);
        }
        public void Apply(ApplicationModel application)
        {
            foreach (var selector in application.Controllers.SelectMany(c=>c.Selectors))
            {
                selector.AttributeRouteModel = selector.AttributeRouteModel != null ? AttributeRouteModel.CombineAttributeRouteModel(_routePrefix,selector.AttributeRouteModel) : this._routePrefix;
            }
        }
    }
}
