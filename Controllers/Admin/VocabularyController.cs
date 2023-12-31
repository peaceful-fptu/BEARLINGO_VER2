﻿using BEARLINGO.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Text;
using static BEARLINGO.Program;

namespace BEARLINGO.Controllers.Admin
{
    public class VocabularyController : Controller
    {
        private readonly BearlingoContext _context;

        public VocabularyController()
        {
            _context = new BearlingoContext();
        }

        [HttpGet]
        public IActionResult Vocabulary(string num)
        {
            int totalPages = 0;
            int pageSize = 4;

            List<ChuDeTuVung> allVocabularys = _context.ChuDeTuVungs.ToList();
            totalPages = (allVocabularys.Count() % pageSize) > 0 ? (allVocabularys.Count() / pageSize) + 1 : (allVocabularys.Count() / pageSize);
            int currentPage = string.IsNullOrEmpty(num) ? 1 : Convert.ToInt32(num);
            List<ChuDeTuVung> vocabsForCurrentPage = allVocabularys.Skip(pageSize * (currentPage - 1)).Take(pageSize).ToList();
            ViewBag.vocabs = vocabsForCurrentPage;
            ViewBag.currentPage = currentPage;
            ViewBag.totalPages = totalPages;
            return View("~/Views/Vocabulary/Vocabulary.cshtml");
        }

        [HttpGet]
        public IActionResult VocabularyDetail(int id)
        {
            var listTuVung = VocabularyList(id);
            ViewData["listTuVung"] = listTuVung;
            return View();
        }

        public List<ChuDeTuVung> Topic()
        {
            var result = from chude in _context.ChuDeTuVungs
                         join qtv in _context.Qtvs
                            on chude.Idqtv equals qtv.Idqtv
                         select new ChuDeTuVung
                         {
                             IdchuDeTuVung = chude.IdchuDeTuVung,
                             ChuDe = chude.ChuDe,
                             Stt = chude.Stt,
                             Idqtv = qtv.Idqtv,
                         };

            if (result != null)
            {
                return result.ToList();
            }

            return new List<ChuDeTuVung>();
        }

        public List<TuVung> VocabularyList(int idChuDe)
        {
            var result = from tuvung in _context.TuVungs
                         join chude in _context.ChuDeTuVungs
                            on tuvung.IdchuDeTuVung equals chude.IdchuDeTuVung
                         where tuvung.IdchuDeTuVung == idChuDe
                         select new TuVung
                         {
                             IdtuVung = tuvung.IdtuVung,
                             TuVung1 = tuvung.TuVung1,
                             PhatAm = tuvung.PhatAm,
                             LoaiTu = tuvung.LoaiTu,
                             NghiaTuVung = tuvung.NghiaTuVung,
                             ViDuTuVung = tuvung.ViDuTuVung,
                             IdchuDeTuVung = tuvung.IdchuDeTuVung,
                         };

            if (result != null)
            {
                return result.ToList();
            }

            return new List<TuVung>();
        }

        /*[Authorize(Policy = Roles.Admin)]*/
        [HttpPost]
        public IActionResult AddChuDe(string chuDe)
        {
            try
            {
                ChuDeTuVung chuDeTuVung = new ChuDeTuVung
                {
                    ChuDe = chuDe,
                    Idqtv = 1
                };

                _context.ChuDeTuVungs.Add(chuDeTuVung);
                _context.SaveChanges();

                return RedirectToAction("Vocabulary", "Vocabulary");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }
        public IActionResult EditChuDe(int idChuDeTuVung, string chuDe)
        {
            var chuDeTV = _context.ChuDeTuVungs.FirstOrDefault(x => x.IdchuDeTuVung == idChuDeTuVung);
            if (chuDeTV == null)
            {
                return RedirectToAction("Vocabulary", "Vocabulary");
            }
            else
            {
                chuDeTV.ChuDe = chuDe;
                _context.SaveChanges();
            }
            return RedirectToAction("AddTuVung", "Vocabulary");
        }
        public IActionResult AddTuVung()
        {
            List<ChuDeTuVung> chuDeTuVungs = _context.ChuDeTuVungs.ToList();
            ViewBag.listCD = chuDeTuVungs;
            List<ChuDeNguPhap> chuDeNguPhaps = _context.ChuDeNguPhaps.ToList();
            ViewBag.listNP = chuDeNguPhaps;
            return View("~/Views/Vocabulary/AddVocabulary.cshtml");
        }
        [HttpPost]
        public IActionResult AddVocab(string tuVung1, string phatAm, string loaiTu, string nghiaTuVung, string viDuTuVung, int idChuDeTuVung)
        {
            try
            {
                nghiaTuVung = nghiaTuVung.Replace("'", "''");
                viDuTuVung = viDuTuVung.Replace("'", "''");
                String sql = "INSERT INTO [dbo].[TuVung]([TuVung],[PhatAm],[LoaiTu],[NghiaTuVung],[ViDuTuVung],[IDChuDeTuVung]) VALUES ('" + tuVung1 + "', N'" + phatAm + "', N'" + loaiTu + "', N'" + nghiaTuVung + "', N'" + viDuTuVung + "', " + idChuDeTuVung + ")";
                _context.Database.ExecuteSqlRaw(sql);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return RedirectToAction("VocabularyLists", "Dashboard");
        }

        [HttpGet]
        public IActionResult DeleteChuDeTuVung(int idChuDeTuVung)
        {
            var chuDeTuVung = _context.ChuDeTuVungs.FirstOrDefault(item => item.IdchuDeTuVung == idChuDeTuVung);
            var tuVung = _context.TuVungs.Where(item => item.IdchuDeTuVung == idChuDeTuVung);

            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    if (tuVung != null)
                    {
                        foreach (var item in tuVung)
                        {
                            _context.TuVungs.Remove(item);
                            _context.SaveChanges();
                        }
                    }

                    if (chuDeTuVung != null)
                    {
                        _context.ChuDeTuVungs.Remove(chuDeTuVung);
                        _context.SaveChanges();
                    }

                    transaction.Commit();

                    return RedirectToAction("Vocabulary", "Vocabulary");
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }

                return View();
            }
        }
        [HttpGet]
        public IActionResult DeleteTuVung(int idTuVung)
        {
            var tuVung = _context.TuVungs.FirstOrDefault(item => item.IdtuVung == idTuVung);
            try
            {
                if (tuVung != null)
                {
                    _context.Remove(tuVung);
                    _context.SaveChanges();
                }

                return RedirectToAction("VocabularyLists", "Dashboard");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }

        [HttpPost]
        public IActionResult UpdateChuDeTuVung(int idChuDeTuVung, string chuDe, int stt, int idQtv)
        {
            var chuDeTuVung = _context.ChuDeTuVungs.FirstOrDefault(item => item.IdchuDeTuVung == idChuDeTuVung);
            try
            {
                if (chuDeTuVung != null)
                {
                    chuDeTuVung.ChuDe = chuDe;
                    chuDeTuVung.Stt = stt;
                    chuDeTuVung.Idqtv = idQtv;
                }

                return RedirectToAction("Vocabulary", "Vocabulary");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }

        /*        [Authorize(Policy = Roles.Admin)]*/
        [HttpPost]
        public IActionResult UpdateTuVung(int idTuVung, string tuVung1, string phatAm, string loaiTu, string nghiaTuVung, string viDuTuVung, int idChuDeTuVung)
        {
            var tuVung = _context.TuVungs.FirstOrDefault(item => item.IdtuVung == idTuVung);
            try
            {
                if (tuVung != null)
                {
                    tuVung.TuVung1 = tuVung1;
                    tuVung.PhatAm = phatAm;
                    tuVung.LoaiTu = loaiTu;
                    tuVung.NghiaTuVung = nghiaTuVung;
                    tuVung.ViDuTuVung = viDuTuVung;
                    tuVung.IdchuDeTuVung = idChuDeTuVung;
                }
                _context.SaveChanges();

                return RedirectToAction("VocabularyLists", "Dashboard");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return View();
        }
    }
}
