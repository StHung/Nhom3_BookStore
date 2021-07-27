using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;

namespace Nhom3_BookStore.Areas.Admin.Controllers
{
    public class BillsController : Controller
    {
        private BookStoreDBContext db = new BookStoreDBContext();

        // GET: Admin/Bills
        public ActionResult Index()
        {
            var bills = db.Bills.Include(b => b.ShoppingCart);
            return View(bills.ToList());
        }

        // GET: Admin/Bills/Details/5
        public ActionResult Details(string id)
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



        // GET: Admin/Bills/Edit/5
        public ActionResult Edit(string id)
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
            ViewBag.CartID = new SelectList(db.ShoppingCarts, "CartID", "CustomerID", bill.CartID);
            return View(bill);
        }

        // POST: Admin/Bills/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BillNo,CartID,PurchaseDate,DeliveryMethod,PaymentMethod,DeliveryAddress,DeliveryState")] Bill bill)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(bill).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.CartID = new SelectList(db.ShoppingCarts, "CartID", "CustomerID", bill.CartID);
                ViewBag.Error = "Lỗi Nhập giữ liệu " + ex.Message;
                return View(bill);
            }


        }

        // GET: Admin/Bills/Delete/5
        public ActionResult Delete(string id)
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

        // POST: Admin/Bills/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Bill bill = db.Bills.Find(id);
            try
            {
                db.Bills.Remove(bill);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Không thể xóa!" + ex.Message;
                return View("Delete", bill);
            }

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
