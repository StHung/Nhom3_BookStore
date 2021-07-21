using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom3_BookStore.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Product()
        {
            return View();
        }

        public ActionResult ProductDetails()
        {
            return View();
        }

        public ActionResult Account()
        {
            return View();
        }

        public ActionResult UpdateAccountInfo()
        {
            return RedirectToAction("Index");
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Cart()
        {
            return View();
        }

        public ActionResult Checkout()
        {
            return View();
        }
        
        public ActionResult ConfirmPayment()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }


        [ChildActionOnly]
        public ActionResult _Sidebar()
        {
            return PartialView();
        }

        public PartialViewResult _Nav()
        {
            return PartialView();
        }
    }
}