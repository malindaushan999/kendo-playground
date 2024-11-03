using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Kendo.PlayGround.Domain.Entities;

[Table("Customer", Schema = "Core")]
[Index("Email", Name = "UQ_Customer_Email", IsUnique = true)]
public partial class Customer
{
    [Key]
    public int CustomerID { get; set; }

    [StringLength(50)]
    public string FirstName { get; set; } = null!;

    [StringLength(50)]
    public string LastName { get; set; } = null!;

    [StringLength(100)]
    public string Email { get; set; } = null!;

    [StringLength(15)]
    public string? Phone { get; set; }

    [StringLength(50)]
    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    [StringLength(50)]
    public string? ModifiedBy { get; set; }

    public DateTime? ModifiedDate { get; set; }

    [InverseProperty("Customer")]
    public virtual ICollection<CustomerDetails> CustomerDetails { get; set; } = new List<CustomerDetails>();
}
