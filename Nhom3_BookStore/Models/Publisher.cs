namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Publisher")]
    public partial class Publisher
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Publisher()
        {
            Books = new HashSet<Book>();
        }

        [StringLength(20, ErrorMessage = "Mã nhà xuất bản tối đa 20 kí tự")]
        [Required(ErrorMessage = "Mã nhà xuất bản không được để trống")]
        [DisplayName("Mã nhà xuất bản")]
        public string PublisherID { get; set; }

        [Required(ErrorMessage = "Tên nhà xuất bản không được để trống")]
        [StringLength(100, ErrorMessage = "Tên nhà xuất bản tối đa 100 kí tự")]
        [DisplayName("Tên nhà xuất bản")]
        public string PublisherName { get; set; }

        [StringLength(150, ErrorMessage = "Địa chỉ tối đa 1500 kí tự")]
        [DisplayName("Địa chỉ")]
        public string Address { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Book> Books { get; set; }
    }
}
