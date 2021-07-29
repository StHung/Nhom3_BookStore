using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;
namespace Nhom3_BookStore.Controllers
{
    public class HomeController : Controller
    {
        BookStoreDBContext db = new BookStoreDBContext();
        // GET: Home
        public ActionResult Index(string id)
        {
            List<Book> books = new List<Book>();
            if (id == null)
            {
                books = db.Books.ToList();
            }
            else
            {
                books = db.Books.Where(b => b.CategoryID.Equals(id)).ToList();
            }
            return View(books);
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = db.Books.Find(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
        }

        [ChildActionOnly]
        public ActionResult _Sidebar()
        {
            var categories = db.Categories;
            return PartialView(categories.ToList());
        }
    }
}