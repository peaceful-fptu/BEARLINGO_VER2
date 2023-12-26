using BEARLINGO.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace BEARLINGO.Controllers.Authentication
{
    public class GoogleLoginController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration _configuration;
        private readonly BearlingoContext _context;

        public GoogleLoginController(ILogger<HomeController> logger, IConfiguration configuration, BearlingoContext context)
        {
            _logger = logger;
            _configuration = configuration;
            _context = context;
        }

        public IActionResult OnPost()
        {
            var properties = new AuthenticationProperties
            {
                RedirectUri = Url.Action("GoogleCallback", "GoogleLogin"),
            };
            return Challenge(properties, "Google");
        }
        public async Task<IActionResult> GoogleCallback()
        {
            var result = await HttpContext.AuthenticateAsync("Google");

            if (result.Succeeded)
            {
                var emailLogin = result?.Principal?.FindFirst(ClaimTypes.Email)?.Value;
                var name = result?.Principal?.FindFirst(ClaimTypes.Name)?.Value;
                var user = _context.NguoiDungs.FirstOrDefault(x => x.Gmail == emailLogin);
                if (user == null)
                {
                    ViewBag.report = "Bạn cần đăng kí tài khoản trước khi sử dụng dịch vụ";
                    ViewBag.email = emailLogin;
                    ViewBag.name = name;
                    return View("~/Views/Authentication/Register.cshtml");
                }
                else
                {
                    HttpContext.Session.SetString("User", user.IdnguoiDung.ToString());
                    HttpContext.Session.SetString("UserName", user.TenDangNhap);
                    HttpContext.Session.SetInt32("Id", user.IdnguoiDung);
                    HttpContext.Session.SetString("Role", "User");
                    return RedirectToAction("Index", "Home");
                }
            }
            else if (result?.Properties?.Items.ContainsKey("error") == true)
            {
                var error = result.Properties.Items["error"];
                var errorDescription = result.Properties.Items["error_description"];
            }
            return RedirectToAction("Index", "Home");
        }
    }
}