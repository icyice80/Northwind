using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Northwind.Persistence;

namespace Northwind.Application.Products.Queries.GetAllProducts
{
    public class GetAllProductsQueryHandler : IRequestHandler<GetAllProductsQuery, ProductsListResult>
    {
        private readonly NorthwindDbContext _dbContext;
        private readonly ILogger<GetAllProductsQueryHandler> _logger;
        private readonly IMapper _mapper;
        public GetAllProductsQueryHandler(NorthwindDbContext context, IMapper mapper, ILogger<GetAllProductsQueryHandler> logger)
        {
            this._mapper = mapper;
            this._logger = logger;
            this._dbContext = context;
        }
        public async Task<ProductsListResult> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {


            var products = await _dbContext.Products
                .Select(x => this._mapper.Map<ProductDto>(x))
                .ToListAsync(cancellationToken);

            return new ProductsListResult {Products = products};
        }
    }
}
