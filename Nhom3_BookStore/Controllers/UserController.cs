using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;

namespace Nhom3_BookStore.Controllers
{
    public class UserController : Controller
    {
        BookStoreDBContext db = new BookStoreDBContext();
        // GET: User
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
                    if (user.FirstOrDefault().Lock == true)
                    {
                        ViewBag.Error = "Tài khoản của bạn đã bị khóa!";
                    }
                    else
                    {
                        string customerid = user.FirstOrDefault().CustomerID.ToString().Trim();

                        Session["CustomerID"] = customerid;
                        Session["CustomerName"] = user.FirstOrDefault().CustomerName;
                        Session["Email"] = user.FirstOrDefault().Email;
                        Session["Password"] = user.FirstOrDefault().Password;

                        var Carts = db.ShoppingCarts.Where(c => c.CustomerID.Equals(customerid)).ToList();

                        ShoppingCart curCart = null;

                        foreach (var item in Carts)
                        {
                            if (db.Bills.Where(b => b.CartID.Equals(item.CartID)).ToList().Count == 0)
                            {
                                curCart = item;
                            }
                        }

                        if(curCart != null)
                        {
                            Session["cartid"] = curCart.CartID;
                        }

                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.Error = "Tài khoản hoặc mật khẩu không chính xác!";
                }
            }
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
                Session.Remove("CustomerName");
                Session["CustomerName"] = customer.CustomerName;
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(customer);
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "CustomerID,CustomerName,Gender,DateOfBirth,PhoneNumber,Email,Address,Password,Lock")] Customer customer)
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
    }
}