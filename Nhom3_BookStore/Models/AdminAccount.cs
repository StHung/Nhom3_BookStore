namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AdminAccount")]
    public partial class AdminAccount
    {
        [Key]
        [DisplayName("Tên tài khoản")]
        [StringLength(30)]
        public string Username { get; set; }

        [Required]
        [StringLength(30)]
        [DisplayName("Mật khẩu")]
        public string Password { get; set; }
        [DisplayName("Họ tên")]
        [Required]
        [StringLength(100)]
        public string FullName { get; set; }

        [Required]
        [StringLength(150)]

        public string Email { get; set; }

        [Required]
        [DisplayName("Số điện thoại")]
        [StringLength(20)]
        public string PhoneNumber { get; set; }
    }
}
