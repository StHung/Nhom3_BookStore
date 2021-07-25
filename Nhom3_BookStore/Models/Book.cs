namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Book")]
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            CartDetails = new HashSet<CartDetail>();
        }

        [StringLength(20)]
        public string BookID { get; set; }

        [Required]
        [StringLength(20)]
        public string PublisherID { get; set; }

        [Required]
        [StringLength(20)]
        public string CategoryID { get; set; }

        [Required]
        [StringLength(150)]
        public string Tittle { get; set; }

        [Required]
        [StringLength(50)]
        public string Author { get; set; }

        public int? ReleaseYear { get; set; }

        public int? NumberOfPages { get; set; }

        public decimal? Price { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        [StringLength(50)]
        public string Dimension { get; set; }

        [StringLength(150)]
        public string Images { get; set; }

        public int? Quantity { get; set; }

        public virtual Category Category { get; set; }

        public virtual Publisher Publisher { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CartDetail> CartDetails { get; set; }
    }
}
