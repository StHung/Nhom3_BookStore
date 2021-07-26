namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [Key]
        [StringLength(20)]
        public string BillNo { get; set; }

        [Required]
        [StringLength(20)]
        public string CartID { get; set; }

        public DateTime? PurchaseDate { get; set; }

        [StringLength(100)]
        public string DeliveryMethod { get; set; }

        [StringLength(100)]
        public string PaymentMethod { get; set; }

        [StringLength(500)]
        public string DeliveryAddress { get; set; }

        [StringLength(100)]
        public string DeliveryState { get; set; }

        public virtual ShoppingCart ShoppingCart { get; set; }
    }
}
