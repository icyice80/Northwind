using MediatR;

namespace Northwind.Application.Products.Queries
{
    public class GetAllProductsQuery : IRequest<ProductsListResult>
    {
    }
}
