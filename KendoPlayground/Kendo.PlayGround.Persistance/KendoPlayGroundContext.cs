
using Kendo.PlayGround.Domain.Entities;
using Microsoft.EntityFrameworkCore;
namespace Kendo.PlayGround.Persistence;

public partial class KendoPlayGroundContext : DbContext
{
    public KendoPlayGroundContext(DbContextOptions<KendoPlayGroundContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Customer> Customer { get; set; }

    public virtual DbSet<CustomerDetails> CustomerDetails { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new Configurations.CustomerConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.CustomerDetailsConfiguration());

        OnModelCreatingGeneratedFunctions(modelBuilder);
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
