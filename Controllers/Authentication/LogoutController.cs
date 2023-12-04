using Microsoft.AspNetCore.Mvc;

namespace BEARLINGO.Controllers.Authentication
{
    public class LogoutController : Controller
    {
        public IActionResult Index()
        {
            HttpContext.Session.Remove("User");
            HttpContext.Session.Remove("UserName");
            HttpContext.Session.Remove("Id");
            return RedirectToAction("Index","Home");
        }
    }
}
