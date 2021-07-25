namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CartDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string CartID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string BookID { get; set; }

        public int Amount { get; set; }

        public virtual Book Book { get; set; }

        public virtual ShoppingCart ShoppingCart { get; set; }
    }
}
