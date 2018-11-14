using MediatR;

namespace Northwind.Application.Products.Queries.GetProducts
{
    public class GetAllProductsQuery : IRequest<ProductsListResult>
    {
    }
}
