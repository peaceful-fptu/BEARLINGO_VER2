using BEARLINGO.Models;
using Microsoft.AspNetCore.Mvc;

namespace BEARLINGO.Controllers.Authentication
{
    public class RegisterController : Controller
    {
        private readonly BearlingoContext _context;
        public RegisterController(BearlingoContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View("~/Views/Authentication/Register.cshtml");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                var user = _context.NguoiDungs.SingleOrDefault(x => x.Gmail == nguoiDung.Gmail);
                if (user != null)
                {
                    ViewBag.messageErrorEmail = "Email đã tồn tại!";
                    return View("Index");
                }
                var user2 = _context.NguoiDungs.SingleOrDefault(x => x.TenDangNhap == nguoiDung.TenDangNhap);
                if (user2 != null)
                {
                    ViewBag.messageErrorUsername = "Tên đăng nhập đã tồn tại!";
                    return View("Index");
                }
                _context.NguoiDungs.Add(nguoiDung);
                _context.SaveChanges();
                return RedirectToAction("Index", "Login");
            }
            else
            {
                return RedirectToAction("Index", "Register");
            }
        }
    }
}