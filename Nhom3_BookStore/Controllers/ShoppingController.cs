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
    public class ShoppingController : Controller
    {
        BookStoreDBContext db = new BookStoreDBContext();
        // GET: Shopping
        public ActionResult AddToCart(string bookid)
        {
            string cartid = db.ShoppingCarts.ToList().LastOrDefault().CartID;

            if (cartid == null || db.Bills.Where(b => b.CartID.Equals(cartid)).ToList().Count > 0)
            {
                return RedirectToAction("Login", "User");
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
            return RedirectToAction("Index", "Home");
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
            if (cartDetails.Count == 0)
            {
                ViewBag.Message = "Giỏ hàng trống";
            }

            return View(cartDetails);
        }

    }
}