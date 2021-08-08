using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;
using PagedList;
namespace Nhom3_BookStore.Controllers
{
    public class HomeController : Controller
    {
        BookStoreDBContext db = new BookStoreDBContext();
        // GET: Home
        public ActionResult Index(string id, string searchString, int? page)
        {
            List<Book> books = new List<Book>();

            if (id != null)
            {
                ViewBag.CategoryName = db.Categories.Find(id).CategoryName;
                books = db.Books.Where(b => b.CategoryID.Equals(id)).ToList();
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                books = db.Books.Where(b => b.Tittle.Contains(searchString)).ToList();
            }
            else
            {
                books = db.Books.ToList();
            }

            int pageSize = 16;

            int pageNumber = (page ?? 1);

            return View(books.ToPagedList(pageNumber, pageSize));
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


        public ActionResult Contact()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult _Sidebar()
        {
            var categories = db.Categories;
            return PartialView(categories.ToList());
        }

        public PartialViewResult _Search()
        {
            return PartialView();
        }
    }
}