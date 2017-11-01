using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TLog.Models;

namespace TLog.Controllers
{
    public class HomeController : Controller
    {
        TLogEntities db;
        public HomeController()
        {
            db = new TLogEntities();
        }
        public ActionResult Index()
        {
            
            List<SelectListItem> ServiceLines = new List<SelectListItem>();
            HomeViewModel model = new HomeViewModel();

            List<ServiceLine> serviceLines = db.ServiceLines.Where(u=>u.IsActive==true).ToList();
            serviceLines.ForEach(x =>
            {
                ServiceLines.Add(new SelectListItem { Text = x.ServiceLineName, Value = x.Id.ToString() });
            });
            model.ServiceLines = ServiceLines;
            return View(model);
        }
        [HttpPost]
        public ActionResult GetActivity(string serviceLineId)
        {
            int serviceLinId;
            List<SelectListItem> serviceLineNames = new List<SelectListItem>();
            if (!string.IsNullOrEmpty(serviceLineId))
            {
                serviceLinId = Convert.ToInt32(serviceLineId);
                List<Activity> districts = db.Activities.Where(x => x.ServiceLineId == serviceLinId && x.IsActive==true).ToList();
                districts.ForEach(x =>
                {
                    serviceLineNames.Add(new SelectListItem { Text = x.ActivityName, Value = x.Id.ToString() });
                });
            }
            return Json(serviceLineNames, JsonRequestBehavior.AllowGet);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}