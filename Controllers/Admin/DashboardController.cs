using BEARLINGO.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static BEARLINGO.Program;

namespace BEARLINGO.Controllers.Admin
{
    public class DashboardController : Controller
    {
        private readonly BearlingoContext _context;

        public DashboardController(BearlingoContext context)
        {
            _context = context;
        }

        /*[Authorize(Policy = Roles.Admin)]*/
        public IActionResult Index()
        {
            ViewBag.navlink = "dashboard";
            return View("~/Views/AdminPage/Dashboard.cshtml");
        }

        public IActionResult getExams()
        {
            List<DeThi> list = _context.DeThis.Include(x => x.IdetsNavigation).Include(x => x.IdqtvNavigation).ToList();
            ViewBag.exams = list;
            ViewBag.navlink = "exam";
            return View("~/Views/AdminPage/Exam.cshtml");
        }
        public IActionResult getBlogs()
        {
            List<Blog> list = _context.Blogs.ToList();
            ViewBag.blogs = list;
            ViewBag.navlink = "blog";
            return View("~/Views/AdminPage/Blog.cshtml");
        }
        public IActionResult getTips()
        {
            List<Tip> list = _context.Tips.ToList();
            ViewBag.tips = list;
            ViewBag.navlink = "tip";
            return View("~/Views/AdminPage/Tip.cshtml");
        }

        public IActionResult getNguPhaps()
        {
            List<NguPhap> list = _context.NguPhaps.Include(n => n.IdchuDeNguPhapNavigation).ToList();
            ViewBag.listNP = list;
            List<ChuDeNguPhap> chuDeNguPhaps = _context.ChuDeNguPhaps.ToList();
            ViewBag.listCDNP = chuDeNguPhaps;
            ViewBag.navlink = "grammar";
            return View("~/Views/AdminPage/Grammar.cshtml");
        }

        public IActionResult getTuVungs()
        {
            List<TuVung> list = _context.TuVungs.Include(n => n.IdchuDeTuVungNavigation).ToList();
            ViewBag.listNP = list;
            List<ChuDeTuVung> chuDeTuVungs = _context.ChuDeTuVungs.ToList();
            ViewBag.listCDTV = chuDeTuVungs;
            ViewBag.navlink = "vocabulary";
            return View("~/Views/AdminPage/Vocabulary.cshtml");
        }
    }
}
