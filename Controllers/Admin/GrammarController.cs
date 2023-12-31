﻿using BEARLINGO.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Drawing.Printing;
using static BEARLINGO.Program;

namespace BEARLINGO.Controllers.Admin
{
    public class GrammarController : Controller
    {
        private readonly BearlingoContext _context;

        public GrammarController()
        {
            _context = new BearlingoContext();
        }

        public IActionResult Grammar(string num)
        {
            int totalPages = 0;
            int pageSize = 4;

            List<NguPhap> allGrammars = _context.NguPhaps.ToList();
            totalPages = (allGrammars.Count() % pageSize) > 0 ? (allGrammars.Count() / pageSize) + 1 : (allGrammars.Count() / pageSize);
            int currentPage = string.IsNullOrEmpty(num) ? 1 : Convert.ToInt32(num);
            List<NguPhap> grammarsForCurrentPage = allGrammars.Skip(pageSize * (currentPage - 1)).Take(pageSize).ToList();
            ViewBag.grammars = grammarsForCurrentPage;
            ViewBag.currentPage = currentPage;
            ViewBag.totalPages = totalPages;
            return View("~/Views/Grammar/Grammar.cshtml");
        }

        [HttpGet]
        public IActionResult GrammarDetail(int id)
        {
            NguPhap? nguPhap = _context.NguPhaps.Include(n => n.IdchuDeNguPhapNavigation).FirstOrDefault(x => x.IdchuDeNguPhap == id);
            ViewBag.nguphap = nguPhap;
            return View();
        }

        public List<ChuDeNguPhap> Topic()
        {
            var result = from chude in _context.ChuDeNguPhaps
                         join qtv in _context.Qtvs
                            on chude.Idqtv equals qtv.Idqtv
                         select new ChuDeNguPhap
                         {
                             IdchuDeNguPhap = chude.IdchuDeNguPhap,
                             TenNguPhap = chude.TenNguPhap,
                             Stt = chude.Stt,
                             Idqtv = qtv.Idqtv,
                         };

            if (result != null)
            {
                return result.ToList();
            }

            return new List<ChuDeNguPhap>();
        }

        public List<NguPhap> GetNguPhap(int id)
        {
            var result = from nguphap in _context.NguPhaps
                         join chude in _context.ChuDeNguPhaps
                            on nguphap.IdchuDeNguPhap equals chude.IdchuDeNguPhap
                         where nguphap.IdchuDeNguPhap == id
                         select new NguPhap
                         {
                             IdnguPhap = nguphap.IdnguPhap,
                             TieuDe = nguphap.TieuDe,
                             CachDung = nguphap.CachDung,
                             CauTruc = nguphap.CauTruc,
                             ViDu = nguphap.ViDu,
                             BoSung = nguphap.BoSung,
                             LuuY = nguphap.LuuY,
                             IdchuDeNguPhap = chude.IdchuDeNguPhap,
                         };

            if (result != null)
            {
                return result.ToList();
            }

            return new List<NguPhap>();
        }

        [HttpPost]
        public IActionResult AddChuDe(string tenNguPhap, int stt)
        {
            try
            {
                ChuDeNguPhap chuDeNguPhap = new ChuDeNguPhap
                {
                    TenNguPhap = tenNguPhap,
                    Idqtv = 1,
                };

                _context.ChuDeNguPhaps.Add(chuDeNguPhap);
                _context.SaveChanges();
                return RedirectToAction("Grammar", "Grammar");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return AddNguPhap();
        }

        public IActionResult AddNguPhap()
        {
            List<ChuDeNguPhap> chuDeNguPhaps = _context.ChuDeNguPhaps.ToList();
            ViewBag.listNP = chuDeNguPhaps;
            return View("AddGrammar");
        }

        [HttpPost]
        public IActionResult AddNguPhap(string tieuDe, string cachDung, string cauTruc, string viDu, string boSung, string luuY, int idChuDe)
        {
            try
            {
                NguPhap nguPhap = new NguPhap
                {
                    TieuDe = tieuDe,
                    CachDung = cachDung,
                    CauTruc = cauTruc,
                    ViDu = viDu,
                    BoSung = boSung,
                    LuuY = luuY,
                    IdchuDeNguPhap = idChuDe,
                };

                _context.NguPhaps.Add(nguPhap);
                _context.SaveChanges();

                return RedirectToAction("getNguPhaps", "Dashboard");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }
        public IActionResult EditChuDe(int idChuDeNguPhap, string chuDe)
        {
            var chuDeNP = _context.ChuDeNguPhaps.FirstOrDefault(x => x.IdchuDeNguPhap == idChuDeNguPhap);
            if (chuDeNP == null)
            {
                return RedirectToAction("Grammar", "Grammar");
            }
            else
            {
                chuDeNP.TenNguPhap = chuDe;
                _context.SaveChanges();
            }
            return RedirectToAction("AddNguPhap", "Vocabulary");
        }

        [Authorize(Policy = Roles.Admin)]
        [HttpGet]
        public IActionResult DeleteChuDe(int idChuDe)
        {
            var chuDe = _context.ChuDeNguPhaps.FirstOrDefault(item => item.IdchuDeNguPhap == idChuDe);
            var nguPhap = _context.NguPhaps.Where(item => item.IdchuDeNguPhap == idChuDe).ToList();
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    if (nguPhap != null)
                    {
                        _context.NguPhaps.RemoveRange(nguPhap);
                        _context.SaveChanges();
                    }
                    if (chuDe != null)
                    {
                        _context.ChuDeNguPhaps.Remove(chuDe);
                        _context.SaveChanges();
                    }

                    transaction.Commit();

                    return RedirectToAction("Grammar", "Grammar");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }

                return View();
            }
        }


        [HttpGet]
        public IActionResult DeleteNguPhap(int idNguPhap)
        {
            var nguPhap = _context.NguPhaps.FirstOrDefault(item => item.IdnguPhap == idNguPhap);
            try
            {
                if (nguPhap != null)
                {
                    _context.Remove(nguPhap);
                    _context.SaveChanges();
                }

                return RedirectToAction("GrammarDetail", "Grammar", new { idNguPhap = idNguPhap });
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }

        [Authorize(Policy = Roles.Admin)]
        [HttpPost]
        public IActionResult UpdateChuDe(int idChuDe, string tenNguPhap, int stt, int idQtv)
        {
            var chuDe = _context.ChuDeNguPhaps.FirstOrDefault(item => item.IdchuDeNguPhap == idChuDe);
            try
            {
                if (chuDe != null)
                {
                    chuDe.TenNguPhap = tenNguPhap;
                    chuDe.Stt = stt;
                    chuDe.Idqtv = idQtv;
                }

                return RedirectToAction("Grammar", "Grammar");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }


        [HttpPost]
        public IActionResult UpdateNguPhap(int idNguPhap, string tieuDe, string cachDung, string cauTruc, string viDu, string boSung, string luuY, int idChuDe)
        {
            var nguPhap = _context.NguPhaps.FirstOrDefault(item => item.IdnguPhap == idNguPhap);
            try
            {
                if (nguPhap != null)
                {
                    nguPhap.TieuDe = tieuDe;
                    nguPhap.CachDung = cachDung;
                    nguPhap.CauTruc = cauTruc;
                    nguPhap.ViDu = viDu;
                    nguPhap.BoSung = boSung;
                    nguPhap.LuuY = luuY;
                    nguPhap.IdchuDeNguPhap = idChuDe;
                }
                _context.SaveChanges();
                return RedirectToAction("getNguPhaps", "Dashboard");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }
    }
}
