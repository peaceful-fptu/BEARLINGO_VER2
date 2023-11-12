using BEARLINGO.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace BEARLINGO.Controllers.Authentication
{
    public class FacebookLoginController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration configuration;
        private readonly BearlingoContext _context;

        public FacebookLoginController(ILogger<HomeController> logger, IConfiguration configuration, BearlingoContext context)
        {
            _logger = logger;
            this.configuration = configuration;
            _context = context;
        }

        public ActionResult Index()
        {
            var authenticationProperties = new AuthenticationProperties
            {
                RedirectUri = Url.Action("FacebookRedirect", "FacebookLogin"),
            };
            return Challenge(authenticationProperties, "Facebook");
        }
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Headers["Referer"].ToString());
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookRedirect");
                return uriBuilder.Uri;
            }
        }
        public async Task<ActionResult> FacebookRedirectAsync(string code)
        {
            var result = await HttpContext.AuthenticateAsync("Facebook");

            if (result.Succeeded)
            {
                var emailLogin = result?.Principal?.FindFirst(ClaimTypes.Email)?.Value;
                var name = result?.Principal?.FindFirst(ClaimTypes.Name)?.Value;
                if (emailLogin == null)
                {
                    ViewBag.report = "Bạn cần cấp quyền truy cập email để đăng nhập";
                    return View("~/Views/Authentication/Register.cshtml");
                }
                else
                {
                    var nguoiDung = _context.NguoiDungs.Where(n => n.Gmail == emailLogin).FirstOrDefault();
                    if (nguoiDung == null)
                    {
                        ViewBag.report = "Bạn cần đăng kí tài khoản trước khi sử dụng dịch vụ";
                        ViewBag.email = emailLogin;
                        ViewBag.name = name;
                        return View("~/Views/Authentication/Register.cshtml");
                    }
                    else
                    {
                        HttpContext.Session.SetString("User", nguoiDung.IdnguoiDung.ToString());
                        HttpContext.Session.SetString("UserName", nguoiDung.TenDangNhap);
                        // Set session
                        // HttpContext.Session.Get("user", user.TenDangNhap);
                        // Redirect to home page
                        return RedirectToAction("Index", "Home");
                    }
                }

            }
            return RedirectToAction("Index");
        }
    }
}
