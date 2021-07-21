using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nhom3_BookStore.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult BillManager()
        {
            return View();
        }

        public ActionResult BookManager()
        {
            return View();
        }

        public ActionResult CategoryManager()
        {
            return View();
        }

        public ActionResult PublisherManager()
        {
            return View();
        }

        public ActionResult UserManager()
        {
            return View();
        }

        public ActionResult UserProfile()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
    }
}