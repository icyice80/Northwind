using System.Collections.Generic;

namespace Northwind.Application.Products.Queries.GetProducts
{
    public class ProductsListResult
    {
        public IList<ProductDto> Products { get; set; }
    }
}
