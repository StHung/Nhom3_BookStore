namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            ShoppingCarts = new HashSet<ShoppingCart>();
        }
        [Key]
        [StringLength(20)]
        [DisplayName("Mã khách hàng")]
        // [Required(ErrorMessage = "Mã khách hàng không được để trống!")]
        public string CustomerID { get; set; }

        [StringLength(100)]
        [DisplayName("Tên khách hàng")]
        [Required(ErrorMessage = "Tên khách hàng không được để trống!")]
        public string CustomerName { get; set; }

        [DisplayName("Giới tính")]
        [Required(ErrorMessage = "Giới tính không được để trống!")]
        [StringLength(10)]
        public string Gender { get; set; }

        [DisplayName("Ngày sinh")]
        [Required(ErrorMessage = "Ngày sinh không được để trống!")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateOfBirth { get; set; }


        [DisplayName("Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được để trống!")]
        [StringLength(15)]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }


        [DisplayName("Email"), DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "Email không được để trống!")]
        [StringLength(100)]
        public string Email { get; set; }


        [DisplayName("Địa chỉ")]
        [Required(ErrorMessage = "Địa chỉ không được để trống!")]
        [StringLength(150)]
        public string Address { get; set; }

        [Required(ErrorMessage = "Mật khẩu không được để trống!")]
        [StringLength(50)]
        [DisplayName("Mật khẩu đăng nhập")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [DisplayName("Khóa")]
        public bool Lock { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
