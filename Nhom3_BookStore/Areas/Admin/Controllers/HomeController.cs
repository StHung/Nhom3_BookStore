using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;
namespace Nhom3_BookStore.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private BookStoreDBContext db = new BookStoreDBContext();
        // GET: Admin/Home
        public ActionResult Index()
        {
            int productNumber = db.Books.ToList().Count;
            int customerNumber = db.Customers.ToList().Count;
            int billNumber = db.Bills.ToList().Count;

            ViewBag.ProductNumber = productNumber;
            ViewBag.CustomerNumber = customerNumber;
            ViewBag.BillNumber = billNumber;

            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string userName, string password)
        {
            if (ModelState.IsValid)
            {
                var user = db.Admins.Where(u => u.Username.Equals(userName) && u.Password.Equals(password)).ToList();
                if (user.Count() > 0)
                {
                    Session["UserName"] = user.FirstOrDefault().Username;
                    Session["Password"] = user.FirstOrDefault().Password;
                    Session["FullName"] = user.FirstOrDefault().FullName;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Đăng nhập không thành công!";
                }
            }
            return View();

        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }

    }
}