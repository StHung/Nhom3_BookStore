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
                    Session["CustomerID"] = user.FirstOrDefault().CustomerID;
                    Session["CustomerName"] = user.FirstOrDefault().CustomerName;
                    Session["Email"] = user.FirstOrDefault().Email;
                    Session["Password"] = user.FirstOrDefault().Password;

                    //create shopping cart
                    ShoppingCart currentCart = db.ShoppingCarts.ToList().LastOrDefault();
                    if (db.Bills.Where(b => b.CartID.Equals(currentCart.CartID)).ToList().Count > 0 || currentCart == null)
                    {
                        //make random cart id
                        bool isValid = false;
                        ShoppingCart shoppingCart = new ShoppingCart();
                        while (isValid == false)
                        {
                            Random rand = new Random();
                            string id = "C" + rand.Next(0, 9999).ToString("0000");
                            if (db.ShoppingCarts.Where(c => c.CartID.Equals(id)).ToList().Count == 0)
                            {
                                shoppingCart.CartID = id;
                                shoppingCart.CustomerID = user.FirstOrDefault().CustomerID;
                                Session["cartid"] = id;
                                db.ShoppingCarts.Add(shoppingCart);
                                db.SaveChanges();
                                isValid = true;
                            }
                        }
                    }
                    else if (currentCart != null)
                    {
                        Session["cartid"] = currentCart.CartID;
                    }

                    return RedirectToAction("Index");
                }
            }
            ViewBag.Error = "Tài khoản hoặc mật khẩu không chính xác!";
            return View();
        }

        public ActionResult ViewAccountInfo(string userid)
        {
            Customer customer = db.Customers.Find(userid);
            return View(customer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAccountInfo([Bind(Include = "CustomerID,CustomerName,Gender,DateOfBirth,PhoneNumber,Email,Address,Password,Lock")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                //Session.Remove("CustomerName");
                //Session["CustomerName"] = customer.CustomerName;
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Logout");
            }
            return View(customer);
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
        public ActionResult Register([Bind(Include = "CustomerName,Gender,DateOfBirth,PhoneNumber,Email,Address,Password")] Customer customer)
        {
            if (db.Customers.Where(c => c.Email.Equals(customer.Email)).ToList().Count > 0)
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
                    if (db.Customers.Where(c => c.CustomerID.Equals(id)).ToList().Count == 0)
                    {
                        customer.CustomerID = id;
                        isOK = true;
                    }
                }

                customer.Lock = false;

                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Login");
            }
            return View(customer);
        }

        public ActionResult AddToCart(string bookid)
        {
            string cartid = db.ShoppingCarts.ToList().LastOrDefault().CartID;

            if (cartid == null || db.Bills.Where(b => b.CartID.Equals(cartid)).ToList().Count > 0)
            {
                return RedirectToAction("Login");
            }
            else
            {
                CartDetail records = db.CartDetails.Where(c => c.CartID.Equals(cartid) && c.BookID.Equals(bookid))
                                                    .ToList().FirstOrDefault();
                if (records != null)
                {
                    records.Amount += 1;
                    db.Entry(records).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else
                {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.CartID = cartid;
                    cartDetail.BookID = bookid;
                    cartDetail.Amount = 1;

                    db.CartDetails.Add(cartDetail);
                    db.SaveChanges();
                }
            }
            return RedirectToAction("ViewCart");
        }

        public ActionResult RemoveBookInCart(string cartid, string bookid)
        {
            CartDetail record = db.CartDetails.Where(c => c.CartID.Equals(cartid) &&
                                                              c.BookID.Equals(bookid)).
                                                   ToList().FirstOrDefault();

            db.CartDetails.Remove(record);
            db.SaveChanges();
            return RedirectToAction("ViewCart");
        }

        public ActionResult ViewCart()
        {
            string cartid = db.ShoppingCarts.ToList().LastOrDefault().CartID;

            if (cartid == null || db.Bills.Where(b => b.CartID.Equals(cartid)).ToList().Count > 0)
            {
                return RedirectToAction("Login");
            }

            var cartDetails = db.CartDetails.Where(c => c.CartID.Equals(cartid)).ToList();
            if(cartDetails.Count == 0)
            {
                ViewBag.Message = "Giỏ hàng trống";
            }

            return View(cartDetails);
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