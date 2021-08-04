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
            if (Session["CustomerID"] == null)
            {
                return RedirectToAction("Login", "User");
            }
            string customerid = Session["CustomerID"].ToString();
            var curCart = db.ShoppingCarts.Where(c => c.CustomerID.Equals(customerid)).ToList()
                                            .LastOrDefault();

            if (curCart == null || db.Bills.Where(b => b.CartID.Equals(curCart.CartID)).ToList().Count > 0)
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
                        shoppingCart.CustomerID = Session["CustomerID"].ToString();
                        Session["cartid"] = id;
                        db.ShoppingCarts.Add(shoppingCart);
                        db.SaveChanges();
                        isValid = true;
                    }
                }

            }
            else if(curCart.CartID != null)
            {
                Session["cartid"] = curCart.CartID;
            }

            string cartid = Session["cartid"].ToString();
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
                cartDetail.CartID = Session["cartid"].ToString();
                cartDetail.BookID = bookid;
                cartDetail.Amount = 1;

                db.CartDetails.Add(cartDetail);
                db.SaveChanges();
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
            List<CartDetail> cartDetails = new List<CartDetail>();
            if (Session["CustomerID"] == null)
            {
                return RedirectToAction("Login", "User");
            }
            string customerid = Session["CustomerID"].ToString();
            var curCart = db.ShoppingCarts.Where(c => c.CustomerID.Equals(customerid)).ToList()
                                            .LastOrDefault();

            if (curCart == null || db.Bills.Where(b => b.CartID.Equals(curCart.CartID)).ToList().Count > 0)
            {
                ViewBag.Message = "Giỏ hàng trống!";
            }
            else
            {
                cartDetails = db.CartDetails.Where(c => c.CartID.Equals(curCart.CartID)).ToList();
                if (cartDetails.Count == 0 || cartDetails == null)
                {
                    ViewBag.Message = "Giỏ hàng trống!";
                }
            }
            return View(cartDetails);
        }
        public ActionResult Checkout()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Checkout([Bind(Include = "BillNo,CartID,PurchaseDate,DeliveryMethod,PaymentMethod,DeliveryAddress,DeliveryState")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                bool isValid = false;
                while (isValid == false)
                {
                    Random rand = new Random();
                    string billid = "HD" + rand.Next(0, 9999).ToString("0000");
                    if (db.Bills.Where(c => c.BillNo.Equals(billid)).ToList().Count == 0)
                    {
                        bill.BillNo = billid;
                        isValid = true;
                    }
                }

                string customerid = "";

                if(Session["CustomerID"] != null)
                {
                    customerid = Session["CustomerID"].ToString();
                    string address = db.Customers.Where(u => u.CustomerID.Equals(customerid)).FirstOrDefault().Address;
                    bill.DeliveryAddress = address;
                }

                bill.CartID = db.ShoppingCarts.Where( s => s.CustomerID.Equals(customerid))
                                              .ToList().LastOrDefault().CartID;


                bill.PurchaseDate = DateTime.Now;
                bill.DeliveryState = "Đang giao";

                db.Bills.Add(bill);
                db.SaveChanges();
                return RedirectToAction("AccomplishedView");
            }

            return View(bill);
        }

        public ActionResult AccomplishedView()
        {
            return View();
        }

        public ActionResult ViewMyOrders()
        {
            List<Bill> myBills = new List<Bill>();
            if(Session["CustomerID"] != null)
            {
                string customerid = Session["CustomerID"].ToString();
                myBills = db.Bills.Where( b => b.ShoppingCart.CustomerID.Equals(customerid)
                                                && b.DeliveryState.Equals("Đang giao")).ToList();
            }

            if(myBills.Count == 0)
            {
                ViewBag.Message = "Không có đơn hàng đang giao nào!";
            }

            return View(myBills);
        }

        public ActionResult ViewOrderDetails(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }
    }
}