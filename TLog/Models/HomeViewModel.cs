using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace TLog.Models
{
    public class HomeViewModel
    {
        [Display(Name ="Service Line Function")]
        public IList<SelectListItem> ServiceLines { get; set; }
        [Display(Name = "Activity")]
        public IList<SelectListItem> ActivityNames { get; set; }
    }
}