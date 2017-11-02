using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TLog.Models;

namespace TLog.Controllers
{
    public class MastersController : Controller
    {
        TLogEntities db;
        public MastersController()
        {
            db = new TLogEntities();
        }
        //
        // GET: /Masters/
        public ActionResult Index()
        {
            List<ServiceLineFunction> serviceLines = db.ServiceLineFunctions.Where(u => u.Active == true).ToList();
            return View(serviceLines);
        }
        public ActionResult ServiceLine(int Id)
        {
            if(Id<=0)
                return PartialView("_ServiceLinePartial", new ServiceLineFunction());
            var serviceLines = db.ServiceLineFunctions.FirstOrDefault(u => u.Active == true && u.ID==Id);
            return PartialView("_ServiceLinePartial", serviceLines);
        }
        [HttpPost]
        public ActionResult Create(ServiceLineFunction model)
        {
            return PartialView("_ServiceLinePartial", model);
        }
	}
}