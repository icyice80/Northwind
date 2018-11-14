using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Northwind.Persistence;

namespace Northwind.Application.Products.Queries.GetProduct
{
    public class GetProductQueryHandler : IRequestHandler<GetProductQuery, ProductResult>
    {
        private readonly NorthwindDbContext _dbContext;
        private readonly ILogger<GetProductQueryHandler> _logger;
        private readonly IMapper _mapper;
        public GetProductQueryHandler(NorthwindDbContext context, IMapper mapper, ILogger<GetProductQueryHandler> logger)
        {
            this._mapper = mapper;
            this._logger = logger;
            this._dbContext = context;
        }
        public async Task<ProductResult> Handle(GetProductQuery request, CancellationToken cancellationToken)
        {
            var product = await _dbContext.Products
                .Where(p => p.ProductId == request.Id)
                .Select(x => this._mapper.Map<ProductDto>(x))
                .SingleOrDefaultAsync(cancellationToken);

            return new ProductResult { Product = product };
        }
    }
}
