namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Category")]
    public partial class Category
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Category()
        {
            Books = new HashSet<Book>();
        }

        [Required(ErrorMessage = "Mã danh mục không được để trống")]
        [StringLength(20, ErrorMessage = "Mã danh mục tối đa 20 kí tự")]
        [DisplayName("Mã danh mục")]
        public string CategoryID { get; set; }

        [Required(ErrorMessage = "Tên danh mục không được để trống")]
        [StringLength(50, ErrorMessage = "Tên danh mục tối đa 50 kí tự")]
        [DisplayName("Tên danh mục")]
        public string CategoryName { get; set; }

        [Required(ErrorMessage = "Mô tả không được để trống")]
        [StringLength(200, ErrorMessage = "mô tả tối đa 200 kí tự")]
        [DisplayName("Mô tả")]
        public string CategoryDescription { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Book> Books { get; set; }
    }
}
