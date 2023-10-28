using BEARLINGO.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;
using Microsoft.AspNetCore.Authorization;
using static BEARLINGO.Program;
using Microsoft.EntityFrameworkCore;
using BEARLINGO.DTO;

namespace BEARLINGO.Controllers.Admin
{
    public class ExamController : Controller
    {
        private readonly BearlingoContext _context;

        public ExamController()
        {
            _context = new BearlingoContext();
        }

        public IActionResult Exam()
        {
            var listDeThi = _context.DeThis.ToList();
            ViewBag.ListDeThi = listDeThi;
            return View();
        }

        public IActionResult CreateExam(int id)
        {
            var deThiPart1 = GetPartListening("Part1", id);
            ViewBag.deThiPart1 = deThiPart1;
            var deThiPart2 = GetPartListening("Part2", id);
            ViewBag.deThiPart2 = deThiPart2;
            var deThiPart3 = GetPartListening("Part3", id);
            ViewBag.deThiPart3 = deThiPart3;
            var deThiPart4 = GetPartListening("Part4", id);
            ViewBag.deThiPart4 = deThiPart4;
            var deThiPart5 = GetPartReading("Part5", id);
            ViewBag.deThiPart5 = deThiPart5;
            var deThiPart6 = GetPartReading("Part6", id);
            ViewBag.deThiPart6 = deThiPart6;
            var deThiPart7 = GetPartReading("Part7", id);
            ViewBag.deThiPart7 = deThiPart7;
            return View("~/Views/Exam/ExamTest.cshtml");
        }

        public List<QuestionListeningDTO> GetPartListening(string part, int id)
        {
            List<QuestionListeningDTO> questionListeningDTOs = new List<QuestionListeningDTO>();
            var listeningPart = _context.Listenings
                         .Include(x => x.IdaudioNavigation)
                         .Include(x => x.IddeThiNavigation)
                         .Include(x => x.IdphanLoaiLNavigation)
                         .Include(x => x.IdpictureNavigation)
                         .Include(x => x.IdpictureNavigation)
                         .Where(x => x.IddeThi == id && x.IdphanLoaiLNavigation.Loai == part)
                         .ToList();
            foreach (var item in listeningPart)
            {
                var a = new QuestionListeningDTO
                {
                    IDListening = item.Idlquestion,
                    NoiDung = item.NoiDung,
                    DapAn1 = item.DapAn1,
                    DapAn2 = item.DapAn2,
                    DapAn3 = item.DapAn3,
                    DapAn4 = item.DapAn4,
                    DapAnDung = item.DapAnDung,
                    GiaiThich = item.GiaiThich,
                    STT = item.Stt,
                    ListeningPart = item.IdphanLoaiLNavigation.Loai,
                    Audio = item.IdaudioNavigation.TenFile,
                    Picture = item.IdpictureNavigation.TenFile
                };
                questionListeningDTOs.Add(a);

            }
            return questionListeningDTOs;
        }
        public List<QuestionReadingDTO> GetPartReading(string part, int id)
        {
            List<QuestionReadingDTO> questionReadingDTOs = new List<QuestionReadingDTO>();
            var readingPart = _context.Readings
                         .Include(x => x.IddeThiNavigation)
                         .Include(x => x.IdphanLoaiRNavigation)
                         .Include(x => x.IdpictureNavigation)
                         .Where(x => x.IddeThi == id && x.IdphanLoaiRNavigation.Loai == part)
                         .ToList();
            foreach (var item in readingPart)
            {
                var a = new QuestionReadingDTO
                {
                    IDReading = item.Idrquestion,
                    NoiDung = item.NoiDung,
                    DapAn1 = item.DapAn1,
                    DapAn2 = item.DapAn2,
                    DapAn3 = item.DapAn3,
                    DapAn4 = item.DapAn4,
                    DapAnDung = item.DapAnDung,
                    GiaiThich = item.GiaiThich,
                    STT = item.Stt,
                    ReadingPart = item.IdphanLoaiRNavigation.Loai,
                    IdPicture = item.Idpicture,
                    Picture = item.IdpictureNavigation.TenFile
                };
                questionReadingDTOs.Add(a);

            }
            return questionReadingDTOs;
        }
        [HttpPost]
        public IActionResult CheckAnswer([FromBody] ExamData data)
        {
            int countListenCorrect = 0;
            int countListenIncorrect = 0;
            int countReadCorrect = 0;
            int countReadIncorrect = 0;
            int id = data.id;
            int list = 101;
            List<string>? listAnswer = data.listAnswer;
            if (listAnswer?.Count < 102)
            {
                list = listAnswer.Count;
            }
            for (int i = 1; i < list; i++)
            {
                var listeningMark = _context.Listenings.Where(x => x.IddeThi == id && x.Stt == i).ToList();
                if (listeningMark.Count == 0)
                {
                    countListenIncorrect++;
                    continue;
                }
                else
                {
                    foreach (var item in listeningMark)
                    {
                        if (listAnswer?[i] == item.DapAnDung && listAnswer?[i] != null)
                        {
                            countListenCorrect++;
                        }
                        else
                        {
                            countListenIncorrect++;
                        }
                    }
                }

            }
            int idUser = (int)HttpContext.Session.GetInt32("Id");
            var Info = new BaiLam
            {
                // set thoigian = datetime.now
                ThoiGian = DateTime.Now.TimeOfDay,
                NgayThi = DateTime.Now,
                IddeThi = id,
                IdnguoiDung = idUser
            };
            _context.BaiLams.Add(Info);
            _context.SaveChanges();
        var Listen = new KetQuaL
        {
            SoCauDung = countListenCorrect,
            SoCauSai = countListenIncorrect,
            Diem = countListenCorrect >= 95 ? 495 : countListenCorrect * 5 + 15,
            NgayThi = DateTime.Now,
            Idlquestion = 2,
            IdbaiLam = Info.IdbaiLam,
        };
            _context.KetQuaLs.Add(Listen);
            _context.SaveChanges();
            for (int i = 101; i < listAnswer?.Count; i++)
            {
                var readingMark = _context.Readings.Where(x => x.IddeThi == id && x.Stt == i).ToList();
                if (readingMark.Count == 0)
                {
                    countReadIncorrect++;
                    continue;
                }
                else
                {
                    foreach (var item in readingMark)
                    {
                        if (listAnswer?[i] == item.DapAnDung && listAnswer?[i] != null)
                        {
                            countReadCorrect++;
                        }
                        else
                        {
                            countReadIncorrect++;
                        }
                    }
                }

            }
            var Reading = new KetQuaR
            {
                SoCauDung = countReadCorrect,
                SoCauSai = countReadIncorrect,
                Diem = countReadCorrect >= 95 ? 495 : countReadCorrect * 5 + 15,
                NgayThi = DateTime.Now,
                IdbaiLam = Info.IdbaiLam,
                Idrquestion = 2
            };
            _context.KetQuaRs.Add(Reading);
            _context.SaveChanges();

            return View("~/Views/AdminPage/Exam.cshtml");
        }
        public class ExamData
        {
            public int id { get; set; }
            public List<string>? listAnswer { get; set; }
        }

        public IActionResult ExamManage()
        {
            ViewBag.navlink = "exam";
            List<DeThi> list = _context.DeThis
                                    .Include(n => n.Listenings)
                                    .Include(n => n.Audios)
                                    .Include(n => n.BaiLams)
                                    .Include(n => n.Readings)
                                    .Include(n => n.Pictures)
                                    .Include(n => n.IdetsNavigation)
                                    .ToList();
            ViewBag.exams = list;
            return View("~/Views/AdminPage/Exam.cshtml");
        }

        public IActionResult EditExam()
        {
            return View("~/Views/AdminPage/EditExam.cshtml");
        }
    }
}
