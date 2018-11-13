using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Northwind.Persistence;

namespace Northwind.Application.Products.Queries
{
    public class GetAllProductsQueryHandler : IRequestHandler<GetAllProductsQuery, ProductsListResult>
    {
        private readonly NorthwindDbContext _dbContext;
        private readonly ILogger<GetAllProductsQueryHandler> _logger;
        public GetAllProductsQueryHandler(NorthwindDbContext context, ILogger<GetAllProductsQueryHandler> logger)
        {
            this._logger = logger;
            this._dbContext = context;
        }
        public async Task<ProductsListResult> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {
            var products = await _dbContext.Products
                .Select(x => new ProductDto {ProductName = x.ProductName})
                .ToListAsync(cancellationToken);

            return new ProductsListResult {Products = products};
        }
    }
}
