﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Kendo.PlayGround.Domain.Entities;
using Kendo.PlayGround.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;

#nullable disable

namespace Kendo.PlayGround.Persistence.Configurations
{
    public partial class CustomerConfiguration : IEntityTypeConfiguration<Customer>
    {
        public void Configure(EntityTypeBuilder<Customer> entity)
        {
            entity.HasKey(e => e.CustomerID)
                .HasName("PK_Customer_CustomerID")
                .IsClustered(false);

            entity.Property(e => e.CreatedBy).HasDefaultValueSql("1");
            entity.Property(e => e.CreatedDate).HasDefaultValueSql("GETDATE()");

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Customer> entity);
    }
}
