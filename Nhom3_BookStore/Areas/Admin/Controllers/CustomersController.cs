using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom3_BookStore.Models;
using PagedList;

namespace Nhom3_BookStore.Areas.Admin.Controllers
{
    public class CustomersController : Controller
    {
        private BookStoreDBContext db = new BookStoreDBContext();

        // GET: Admin/Customers
        public ActionResult Index(string sortOrder, int? page, string searchString, string currentFilter)
        {
            ViewBag.curretnSort = sortOrder;

            ViewBag.SortByID = String.IsNullOrEmpty(sortOrder) ? "ma_desc" : "";
            ViewBag.SortByName = sortOrder == "Name" ? "name_desc" : "Name";

            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.currentFilter = searchString;

            var customer = db.Customers.Select(h => h);


            if (!String.IsNullOrEmpty(searchString))
            {
                customer = customer.Where(h => h.CustomerName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name":
                    customer = customer.OrderBy(h => h.CustomerName);
                    break;
                case "name_desc":
                    customer = customer.OrderByDescending(b => b.CustomerName);
                    break;
                case "ma_desc":
                    customer = customer.OrderByDescending(b => b.CustomerID);
                    break;
                default:
                    customer = customer.OrderBy(b => b.CustomerID);
                    break;
            }

            int pageSize = 4;

            int pageNumber = (page ?? 1);

            return View(customer.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Customers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }


        // GET: Admin/Customers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Admin/Customers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,CustomerName,Gender,DateOfBirth,PhoneNumber,Email,Address,Password,Lock")] Customer customer)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(customer).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(customer);
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Đã xảy ra lỗi! " + ex.Message;
                return View(customer);
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
