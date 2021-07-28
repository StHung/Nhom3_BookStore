using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;
namespace Nhom3_BookStore.Controllers
{
    public class HomeController : Controller
    {
        BookStoreDBContext db = new BookStoreDBContext();
        // GET: Home
        public ActionResult Index(string categoryid)
        {
            List<Book> books = new List<Book>();
            if(categoryid == null)
            {
                books = db.Books.ToList();
            }
            else
            {
                books = db.Books.Where(b => b.CategoryID.Equals(categoryid)).ToList();
            }
            return View(books);
        }
        [ChildActionOnly]
        public ActionResult _Sidebar()
        {
            var categories = db.Categories;
            return PartialView(categories.ToList());
        }
    }
}