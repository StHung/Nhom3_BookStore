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
        public ActionResult Index()
        {
            var books = db.Books.ToList();
            return View(books);
        }
    }
}