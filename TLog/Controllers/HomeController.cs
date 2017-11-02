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

            List<ServiceLineFunction> serviceLines = db.ServiceLineFunctions.Where(u=>u.Active==true).ToList();
            serviceLines.ForEach(x =>
            {
                ServiceLines.Add(new SelectListItem { Text = x.Name, Value = x.ID.ToString() });
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
                List<Activity> Activity = db.Activities.Where(x => x.ServiceLineFunctionID == serviceLinId && x.Active==true).ToList();
                Activity.ForEach(x =>
                {
                    serviceLineNames.Add(new SelectListItem { Text = x.Name, Value = x.ID.ToString() });
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