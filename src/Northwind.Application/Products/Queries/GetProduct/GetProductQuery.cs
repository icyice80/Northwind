using MediatR;

namespace Northwind.Application.Products.Queries.GetProduct
{
    public class GetProductQuery : IRequest<ProductResult>
    {
        public GetProductQuery(int id)
        {
            this.Id = id;
        }
        public int Id { get; }
    }
}
