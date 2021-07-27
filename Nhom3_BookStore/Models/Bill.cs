namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [Key]
        [StringLength(20)]
        [DisplayName("Mã Hóa đơn")]
        [Required(ErrorMessage = "Không được để trống Mã Hóa đơn")]
        public string BillNo { get; set; }

        [DisplayName("Mã Thẻ")]
        [Required(ErrorMessage = "Không được để trống Mã Thẻ")]
        [StringLength(20)]
        public string CartID { get; set; }

        [DisplayName("Ngày Thanh toán"), DataType(DataType.Date)]
        public DateTime? PurchaseDate { get; set; }

        [DisplayName("PT vận chuyển")]
        [StringLength(100)]
        public string DeliveryMethod { get; set; }

        [DisplayName("Phương thức thanh toán")]
        [StringLength(100)]
        public string PaymentMethod { get; set; }

        [DisplayName("Địa chỉ giao hàng")]
        [StringLength(500)]
        public string DeliveryAddress { get; set; }

        [StringLength(100)]
        [DisplayName("Trang thái giao hàng")]
        public string DeliveryState { get; set; }

        [DisplayName("Giỏ hàng")]
        public virtual ShoppingCart ShoppingCart { get; set; }
    }
}
