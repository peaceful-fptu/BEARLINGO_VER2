using BEARLINGO.Models;
using BEARLINGO.Util;
using Microsoft.AspNetCore.Mvc;

namespace BEARLINGO.Controllers.Authentication
{
    public class LoginController : Controller
    {
        private readonly BearlingoContext _context;
        public LoginController(BearlingoContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View("~/Views/Authentication/Login.cshtml");

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(string email, string password)
        {
            var user1 = _context.NguoiDungs.SingleOrDefault(x => x.Gmail == email);
            if (user1 == null)
            {
                ViewBag.messageErrorEmail = "Email không tồn tại!";
                return RedirectToAction("Index", "Login");
            }
            else if (user1.MatKhau != password)
            {
                ViewBag.messageErrorPassword = "Mật khẩu không đúng!";
                return RedirectToAction("Index", "Login");
            }
            var user = _context.NguoiDungs.SingleOrDefault(x => x.Gmail == email && x.MatKhau == password);
            if (user != null)
            {
                HttpContext.Session.SetString("User", user.IdnguoiDung.ToString());
                HttpContext.Session.SetString("UserName", user.TenDangNhap);
                HttpContext.Session.SetInt32("Id", user.IdnguoiDung);
                HttpContext.Session.SetString("Role", "User");
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
    }
}
