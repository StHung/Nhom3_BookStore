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
    public class AdminAccountsController : Controller
    {
        private BookStoreDBContext db = new BookStoreDBContext();

        // GET: Admin/AdminAccounts
        public ActionResult Index()
        {
            return View(db.Admins.ToList());
        }

        // GET: Admin/AdminAccounts/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AdminAccount adminAccount = db.Admins.Find(id);
            if (adminAccount == null)
            {
                return HttpNotFound();
            }
            return View(adminAccount);
        }

        // GET: Admin/AdminAccounts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Username,Password,FullName,Email,PhoneNumber")] AdminAccount adminAccount)
        {
            if (ModelState.IsValid)
            {
                db.Admins.Add(adminAccount);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(adminAccount);
        }

        // GET: Admin/AdminAccounts/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AdminAccount adminAccount = db.Admins.Find(id);
            if (adminAccount == null)
            {
                return HttpNotFound();
            }
            return View(adminAccount);
        }

        // POST: Admin/AdminAccounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Username,Password,FullName,Email,PhoneNumber")] AdminAccount adminAccount)
        {
            if (ModelState.IsValid)
            {
                db.Entry(adminAccount).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(adminAccount);
        }

        // GET: Admin/AdminAccounts/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AdminAccount adminAccount = db.Admins.Find(id);
            if (adminAccount == null)
            {
                return HttpNotFound();
            }
            return View(adminAccount);
        }

        // POST: Admin/AdminAccounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            AdminAccount adminAccount = db.Admins.Find(id);
            db.Admins.Remove(adminAccount);
            db.SaveChanges();
            return RedirectToAction("Index");
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
