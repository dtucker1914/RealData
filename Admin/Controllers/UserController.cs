using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using DataViewer.Models.Extenison;

namespace Admin.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /User/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /User/Create

        public ActionResult Create()
        {

            var _context = new DataViewerEntities();
            var _newUser = new UserViewModel();
            var _listStatus = from statuse in _context.Status select statuse;
            
            
                //var _selectList = _listStatus.ToList().AsEnumerable();
                _newUser.AllStatus = _listStatus.ToList().AsEnumerable();
            


            return View(_newUser);
        } 

        //
        // POST: /User/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /User/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /User/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /User/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

       
    }
    public class UserViewModel
    {
        public User User { get; set; }
        public IEnumerable<Status> AllStatus { get; set; }

    }
}
