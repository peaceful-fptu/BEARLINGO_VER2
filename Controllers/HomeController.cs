using BEARLINGO.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace BEARLINGO.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly BearlingoContext context;

        public HomeController(ILogger<HomeController> logger, BearlingoContext context)
        {
            _logger = logger;
            this.context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult userProfile()
        {
            int id = int.Parse(HttpContext.Session.GetString("User"));
            NguoiDung nguoiDung = context.NguoiDungs.FirstOrDefault(n => n.IdnguoiDung == id);
            ViewBag.user = nguoiDung;
            return View("~/Views/Authentication/UserProfile.cshtml");
        }
    }
}