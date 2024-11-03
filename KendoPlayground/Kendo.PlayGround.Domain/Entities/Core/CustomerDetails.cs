using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Kendo.PlayGround.Domain.Entities;

[Table("CustomerDetails", Schema = "Core")]
public partial class CustomerDetails
{
    [Key]
    public int CustomerDetailsID { get; set; }

    public int CustomerID { get; set; }

    [StringLength(255)]
    public string Address { get; set; } = null!;

    [StringLength(100)]
    public string City { get; set; } = null!;

    [StringLength(50)]
    public string State { get; set; } = null!;

    [StringLength(10)]
    public string ZipCode { get; set; } = null!;

    [StringLength(50)]
    public string Country { get; set; } = null!;

    [Column(TypeName = "date")]
    public DateTime? DateOfBirth { get; set; }

    [StringLength(50)]
    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    [StringLength(50)]
    public string? ModifiedBy { get; set; }

    public DateTime? ModifiedDate { get; set; }

    [ForeignKey("CustomerID")]
    [InverseProperty("CustomerDetails")]
    public virtual Customer Customer { get; set; } = null!;
}
