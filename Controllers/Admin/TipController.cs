using BEARLINGO.Models;
using BEARLINGO.Util;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static BEARLINGO.Program;

namespace BEARLINGO.Controllers.Admin
{
    public class TipController : Controller
    {
        private readonly BearlingoContext _context;
        private readonly Helper helper = new Helper();

        public TipController(BearlingoContext context)
        {
            _context = context;
        }
        public IActionResult getTips(string num)
        {
            int totalPages = 0;
            int pageSize = 4;

            List<Tip> allTips = _context.Tips.ToList();
            totalPages = (allTips.Count() % pageSize) > 0 ? (allTips.Count() / pageSize) + 1 : (allTips.Count() / pageSize);
            int currentPage = string.IsNullOrEmpty(num) ? 1 : Convert.ToInt32(num);
            List<Tip> tipsForCurrentPage = allTips.Skip(pageSize * (currentPage - 1)).Take(pageSize).ToList();
            ViewBag.tips = tipsForCurrentPage;
            ViewBag.currentPage = currentPage;
            ViewBag.totalPages = totalPages;
            return View("~/Views/Tip/Tip.cshtml");
        }

        public IActionResult tipManage()
        {
            var tips = _context.Tips.ToList();
            ViewBag.tips = tips;
            return View();
        }
        public IActionResult addTip()
        {
            return View();
        }
        [HttpPost]
        public IActionResult addTip(string title, string mota, IFormFile ImageUpload)
        {
            Tip tip = new Tip()
            {
                Anh = helper.UploadPhoto(ImageUpload.OpenReadStream()),
                NoiDungTips = mota,
                TieuDe = title,
                Idqtv = 1
            };
            _context.Tips.Add(tip);
            _context.SaveChanges();
            return RedirectToAction("getTips", "Dashboard");
        }
        public IActionResult TipDetail(int id)
        {
            using (BearlingoContext _context = new BearlingoContext())
            {
                Tip? tip = _context.Tips.FirstOrDefault(n => n.Idtips == id);
                ViewBag.Tip = tip;
                return View("~/Views/Tip/TipDetail.cshtml");
            }
        }
        [HttpPost]
        public IActionResult editTip(string id, string title, IFormFile ImageUpload, string content)
        {
            Tip? newTip = _context.Tips.FirstOrDefault(n => n.Idtips == int.Parse(id));
            newTip!.NoiDungTips = content;
            newTip!.TieuDe = title;
            if (ImageUpload != null)
            {
                newTip.Anh = helper.UploadPhoto(ImageUpload.OpenReadStream());
            }
            _context.Tips.Update(newTip);
            _context.SaveChanges();
            return RedirectToAction("getTips", "Dashboard");
        }
        public IActionResult deleteTip(int id)
        {
            Tip? tip = _context.Tips.FirstOrDefault(t => t.Idtips == id);
            if (tip != null)
            {
                _context.Tips.Remove(tip);
                _context.SaveChanges();
            }
            return RedirectToAction("getTips", "Dashboard");
        }
    }
}
