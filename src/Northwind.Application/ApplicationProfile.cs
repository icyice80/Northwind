using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using AutoMapper.Configuration;
using Northwind.Application.Products.Queries;
using Norwind.Domain.Entities;

namespace Northwind.Application
{
    public class ApplicationProfile : Profile
    {
        public ApplicationProfile() : this("ApplicationProfile")
        {
        }

        private ApplicationProfile(string profileName) : base(profileName)
        {
            this.CreateMap();
        }


        private void CreateMap()
        {
            CreateMap<Product, ProductDto>();
        }
    }
}
