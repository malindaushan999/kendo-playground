﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using System;
using System.Data;
using System.Linq;
using Kendo.PlayGround.Persistence;

namespace Kendo.PlayGround.Persistence
{
    public partial class KendoPlayGroundContext
    {

        [DbFunction("TVFServerSideGrid", "dbo")]
        public IQueryable<TVFServerSideGridResult> TVFServerSideGrid(int? UserId)
        {
            return FromExpression(() => TVFServerSideGrid(UserId));
        }

        protected void OnModelCreatingGeneratedFunctions(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TVFServerSideGridResult>().HasNoKey();
        }
    }
}
