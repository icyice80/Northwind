using System.Collections.Generic;

namespace Northwind.Application.Products.Queries.GetAllProducts
{
    public class ProductsListResult
    {
        public IList<ProductDto> Products { get; set; }
    }
}
