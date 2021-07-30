using System;
using System.Collections.Generic;
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

            if (id == null)
            {
                books = db.Books.ToList();
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                books = db.Books.Where(b => b.Tittle.Contains(searchString)).ToList();
            }
            else
            {
                books = db.Books.Where(b => b.CategoryID.Equals(id)).ToList();
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

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                var user = db.Customers.Where(u => u.Email.Equals(email) && u.Password.Equals(password)).ToList();
                if (user.Count > 0)
                {
                    Session["CustomerName"] = user.FirstOrDefault().CustomerName;
                    Session["Password"] = user.FirstOrDefault().Password;
                    Session["AccountID"] = user.FirstOrDefault().CustomerID;
                    return RedirectToAction("Index");
                }
            }
            ViewBag.Error = "Tài khoản hoặc mật khẩu không chính xác!";
            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include ="CustomerName,Gender,DateOfBirth,PhoneNumber,Email,Address,Password")] Customer customer)
        {
            if(db.Customers.Where( c => c.Email.Equals(customer.Email)).ToList().Count > 0)
            {
                ViewBag.Error = "Email đã được sử dụng!";
                return View(customer);
            }

            if (ModelState.IsValid)
            {
                bool isOK = false;
                while (isOK == false)
                {
                    Random rand = new Random();
                    string id = "KH" + rand.Next(0, 9999).ToString("0000");
                    if(db.Customers.Where(c => c.CustomerID.Equals(id)).ToList().Count == 0)
                    {
                        customer.CustomerID = id;
                        isOK = true;
                    }
                }

                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Login");
            }
            return View(customer);
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