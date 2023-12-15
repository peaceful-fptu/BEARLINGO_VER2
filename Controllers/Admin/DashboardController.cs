using BEARLINGO.Models;
using DocumentFormat.OpenXml.InkML;
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
            var userCount = _context.NguoiDungs.Count();
            var examCount = _context.DeThis.Count();
            var testCount = _context.BaiLams.Count();
            var blogCount = _context.Blogs.Count();
            var tipCount = _context.Tips.Count();
            var data = _context.BaiLams
                        .GroupBy(x => x.NgayThi)
                        .Select(x => new
                        {
                            ngaythi = ((DateTime)x.Key!).ToString("dd/MM/yyyy"),
                            soluong = x.Count()
                        }).ToList();
            var result = _context.BaiLams
                .GroupBy(b => b.IddeThiNavigation.TenDeThi)
                .Select(g => new
                {
                    DeThi = g.Key,
                    SoLuong = g.Count()
                })
                .OrderByDescending(x => x.SoLuong)
                .FirstOrDefault();
            var dataTest1 = _context.BaiLams
                            .GroupBy(x => x.IddeThiNavigation.TenDeThi)
                            .Select(g => new
                            {
                                dethi = g.Key,
                                soluong = g.Count()
                            }).ToList();
            var userMax = _context.BaiLams
                .Join(_context.NguoiDungs,
                    bl => bl.IdnguoiDung,
                    nd => nd.IdnguoiDung,
                  (bl, nd) => new UserScoreViewModel
                  {
                      FullName = nd.Gmail,
                      TotalScore = bl.DiemL + bl.DiemR
                  })
                .OrderByDescending(x => x.TotalScore)
                .FirstOrDefault();
            ViewBag.mostExam = result;
            ViewBag.userMax = userMax;
            ViewBag.dataTest = data;
            ViewBag.dataTest1 = dataTest1;
            ViewBag.userCount = userCount;
            ViewBag.examCount = examCount;
            ViewBag.testCount = testCount;
            ViewBag.blogCount = blogCount;
            ViewBag.tipCount = tipCount;
            return View("~/Views/AdminPage/Dashboard.cshtml");
        }
        public class UserScoreViewModel
        {
            public string? FullName { get; set; }

            public int? TotalScore { get; set; }
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
