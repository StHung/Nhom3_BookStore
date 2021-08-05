namespace Nhom3_BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
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
        [Key]
        [StringLength(20)]
        [DisplayName("Mã sách")]
        [Required(ErrorMessage = "Mã sách không được để trống!")]
        public string BookID { get; set; }

        [Required(ErrorMessage = "Mã nhà xuất bản không được để trống!")]
        [StringLength(20)]
        [DisplayName("Mã nhà xuất bản")]
        public string PublisherID { get; set; }

        [Required(ErrorMessage = "Mã danh mục không được để trống!")]
        [StringLength(20)]
        [DisplayName("Mã danh mục")]
        public string CategoryID { get; set; }

        [Required(ErrorMessage = "Tiêu đề không được để trống!")]
        [StringLength(150)]
        [DisplayName("Tiêu đề")]
        public string Tittle { get; set; }

        [Required(ErrorMessage = "Tác giả không được để trống!")]
        [StringLength(50)]
        [DisplayName("Tác giả")]
        public string Author { get; set; }

        [DisplayName("Năm phát hành")]
        [Range(0, int.MaxValue, ErrorMessage = "Năm phát hành không hợp lệ!")]
        public int? ReleaseYear { get; set; }

        [DisplayName("Số trang")]
        [Range(0, int.MaxValue, ErrorMessage = "Số trang không hợp lệ!")]
        public int? NumberOfPages { get; set; }

        [Required(ErrorMessage = "Giá bán không được để trống!")]
        [DisplayName("Giá bán")]
        [DisplayFormat(DataFormatString = "{0: #,###}")]
        public decimal? Price { get; set; }

        [Column(TypeName = "ntext")]
        [DisplayName("Mô tả")]
        public string Description { get; set; }

        [StringLength(50)]
        [DisplayName("Kích thước")]
        public string Dimension { get; set; }

        [StringLength(150)]
        [DisplayName("Ảnh")]
        public string Images { get; set; }

        [DisplayName("Lượng có")]
        [Range(1, int.MaxValue, ErrorMessage = "Số lượng tối thiểu phải là một!")]
        public int? Quantity { get; set; }

        public virtual Category Category { get; set; }

        public virtual Publisher Publisher { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CartDetail> CartDetails { get; set; }
    }
}
