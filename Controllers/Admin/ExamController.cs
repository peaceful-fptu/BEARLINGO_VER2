using BEARLINGO.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;
using System.Web;
using System.IO;
using Microsoft.AspNetCore.Authorization;
using static BEARLINGO.Program;
using Microsoft.EntityFrameworkCore;
using BEARLINGO.DTO;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using ClosedXML.Excel;

namespace BEARLINGO.Controllers.Admin
{
    public class ExamController : Controller
    {
        private readonly BearlingoContext _context;

        public ExamController()
        {
            _context = new BearlingoContext();
        }

        public IActionResult Exam(int idEts)
        {
            if (idEts == 0)
            {
                var listDeThi = _context.DeThis.ToList();
                var listETS = _context.Ets.ToList();
                ViewBag.ListDeThi = listDeThi;
                ViewBag.ListETS = listETS;
                return View();
            }
            else
            {
                var listDethi = _context.DeThis.Where(e => e.Idets == idEts).ToList();
                var listETS = _context.Ets.ToList();
                ViewBag.ListDeThi = listDethi;
                ViewBag.ListETS = listETS;
                return View();
            }
        }
        public IActionResult AddExam()
        {
            var listETS = _context.Ets.ToList();
            ViewBag.ListETS = listETS;
            return View("~/Views/AdminPage/AddExam.cshtml");
        }
        public IActionResult CreateExam(int id)
        {
            if (HttpContext.Session.GetString("Role") != "User")
            {
                return RedirectToAction("Index", "Login");
            }
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
        public class ExamData
        {
            public int id { get; set; }
            public List<string>? listAnswer { get; set; }
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
            int idUser = (int)HttpContext.Session.GetInt32("Id")!;
            var Info = new BaiLam
            {
                ThoiGian = DateTime.Now.TimeOfDay,
                NgayThi = DateTime.Now,
                IddeThi = id,
                IdnguoiDung = idUser
            };
            _context.BaiLams.Add(Info);
            _context.SaveChanges();
            List<string>? listAnswer = data.listAnswer;
            if (listAnswer?.Count < 102)
            {
                list = listAnswer.Count;
            }
            for (int i = 1; i < 101; i++)
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
                        bool isCorrect = false;
                        string? a = (listAnswer!.Count - 1 < i) ? null : listAnswer[i];
                        if (a == item.DapAnDung && a != null)
                        {
                            isCorrect = true;
                        }
                        var listeningResult = new KetQuaL
                        {
                            IdbaiLam = Info.IdbaiLam,
                            Idlquestion = item.Idlquestion,
                            DapAnNguoiDungL = a,
                            IsCorrectL = isCorrect
                        };
                        _context.KetQuaLs.Add(listeningResult);
                        if (i < listAnswer?.Count)
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
                        else
                        {
                            countListenIncorrect++;
                        }
                    }
                }

            }
            for (int i = 101; i < 201; i++)
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
                        bool isCorrect = false;
                        string? a = (listAnswer!.Count - 1 < i) ? null : listAnswer[i];
                        if (a == item.DapAnDung && a != null)
                        {
                            isCorrect = true;
                        }
                        var readingResult = new KetQuaR
                        {
                            IdbaiLam = Info.IdbaiLam,
                            Idrquestion = item.Idrquestion,
                            DapAnNguoiDungR = a,
                            IsCorrectR = isCorrect
                        };
                        _context.KetQuaRs.Add(readingResult);
                        if (i < listAnswer?.Count)
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
                        else
                        {
                            countReadIncorrect++;
                        }
                    }
                }
            }
            var infoCheck = _context.BaiLams.Find(Info.IdbaiLam)!;
            infoCheck.DiemL = countListenCorrect * 5 + 15;
            infoCheck.DiemR = countReadCorrect * 5 + 15;
            infoCheck.SoCauDungL = countListenCorrect;
            infoCheck.SoCauDungR = countReadCorrect;
            _context.SaveChanges();
            return Json(new { success = true, socauDungL = infoCheck.SoCauDungL, socauDungR = infoCheck.SoCauDungR, idbailam = infoCheck.IdbaiLam, diemL = infoCheck.DiemL, diemR = infoCheck.DiemR, message = "Đã hoàn thành bài thi" });
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
        public IActionResult DeleteExam(int id)
        {
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    // Xóa các records liên quan từ các bảng
                    _context.Audios.RemoveRange(_context.Audios.Where(a => a.IddeThi == id));
                    _context.BaiLams.RemoveRange(_context.BaiLams.Where(b => b.IddeThi == id));
                    _context.Listenings.RemoveRange(_context.Listenings.Where(l => l.IddeThi == id));
                    _context.Pictures.RemoveRange(_context.Pictures.Where(p => p.IddeThi == id));
                    _context.Readings.RemoveRange(_context.Readings.Where(r => r.IddeThi == id));

                    // Lưu thay đổi vào cơ sở dữ liệu
                    _context.SaveChanges();

                    // Xóa record từ bảng DeThi
                    _context.DeThis.Remove(_context.DeThis.Find(id)!);

                    // Lưu thay đổi vào cơ sở dữ liệu
                    _context.SaveChanges();

                    // Commit transaction
                    transaction.Commit();
                    return RedirectToAction("getExams", "Dashboard");
                }
                catch (Exception)
                {
                    // Nếu có lỗi, rollback transaction
                    transaction.Rollback();
                    throw;
                }
            }
        }

        public IActionResult EditExam()
        {
            return View("~/Views/AdminPage/EditExam.cshtml");
        }
        public IActionResult getTests(string num)
        {
            int totalPages = 0;
            int pageSize = 4;
            int idUser = (int)HttpContext.Session.GetInt32("Id")!;
            List<BaiLam> list = _context.BaiLams.Where(n => n.IdnguoiDung == idUser).ToList();
            totalPages = (list.Count() % pageSize) > 0 ? (list.Count() / pageSize) + 1 : (list.Count() / pageSize);
            if (!string.IsNullOrEmpty(num))
            {
                list = list.Skip(pageSize * (Convert.ToInt32(num) - 1)).Take(pageSize).ToList();
            }
            else
            {
                num = "1";
                list = list.Skip(pageSize * (Convert.ToInt32(num) - 1)).Take(pageSize).ToList();
            }
            ViewBag.tests = list;
            ViewBag.totalPage = totalPages;
            return View("~/Views/Exam/MyTest.cshtml");
        }
        public IActionResult MyTest()
        {
            int idUser = (int)HttpContext.Session.GetInt32("Id")!;
            List<BaiLam> list = _context.BaiLams
                                    .Include(n => n.IddeThiNavigation)
                                    .Where(n => n.IdnguoiDung == idUser)
                                    .ToList();
            ViewBag.myTest = list;
            return View();
        }
        [HttpGet]
        public IActionResult ExamDetail(int id)
        {
            int idUser = (int)HttpContext.Session.GetInt32("Id")!;
            List<DetailListeningDTO> detailListeningDTOs = new List<DetailListeningDTO>();
            List<DetailReadingDTO> detailReadingDTOs = new List<DetailReadingDTO>();
            var listenList = _context.KetQuaLs
                                .Include(n => n.IdlquestionNavigation).ThenInclude(n => n.IdaudioNavigation)
                                .Include(n => n.IdlquestionNavigation).ThenInclude(n => n.IdpictureNavigation)
                                .Where(n => n.IdbaiLam == id)
                                .ToList();
            var readList = _context.KetQuaRs
                                .Include(n => n.IdrquestionNavigation).ThenInclude(n => n.IdpictureNavigation)
                                .Where(n => n.IdbaiLam == id)
                                .ToList();
            var info = _context.BaiLams.FirstOrDefault(x => x.IdbaiLam == id);
            foreach (var item in listenList)
            {
                var a = new DetailListeningDTO
                {
                    IDListening = item.IdlquestionNavigation.Idlquestion,
                    NoiDung = item.IdlquestionNavigation.NoiDung,
                    DapAn1 = item.IdlquestionNavigation.DapAn1,
                    DapAn2 = item.IdlquestionNavigation.DapAn2,
                    DapAn3 = item.IdlquestionNavigation.DapAn3,
                    DapAn4 = item.IdlquestionNavigation.DapAn4,
                    DapAnDung = item.IdlquestionNavigation.DapAnDung,
                    GiaiThich = item.IdlquestionNavigation.GiaiThich,
                    STT = item.IdlquestionNavigation.Stt,
                    ListeningPart = "1",
                    Audio = item.IdlquestionNavigation.IdaudioNavigation.TenFile,
                    Picture = item.IdlquestionNavigation.IdpictureNavigation.TenFile,
                    DapAnNguoiDungL = item.DapAnNguoiDungL
                };
                detailListeningDTOs.Add(a);
            }
            foreach (var item in readList)
            {
                var a = new DetailReadingDTO
                {
                    IDReading = item.IdrquestionNavigation.Idrquestion,
                    NoiDung = item.IdrquestionNavigation.NoiDung,
                    DapAn1 = item.IdrquestionNavigation.DapAn1,
                    DapAn2 = item.IdrquestionNavigation.DapAn2,
                    DapAn3 = item.IdrquestionNavigation.DapAn3,
                    DapAn4 = item.IdrquestionNavigation.DapAn4,
                    DapAnDung = item.IdrquestionNavigation.DapAnDung,
                    GiaiThich = item.IdrquestionNavigation.GiaiThich,
                    STT = item.IdrquestionNavigation.Stt,
                    ReadingPart = "1",
                    IdPicture = item.IdrquestionNavigation.Idpicture,
                    Picture = item.IdrquestionNavigation.IdpictureNavigation.TenFile,
                    DapAnNguoiDungR = item.DapAnNguoiDungR
                };
                detailReadingDTOs.Add(a);
            }
            ViewBag.listening = detailListeningDTOs;
            ViewBag.reading = detailReadingDTOs;
            ViewBag.info = info;
            return View();
        }

        [HttpPost]
        public IActionResult AddNewExam(string nameExam, int etsExam, IFormFile exam, List<IFormFile> images, List<IFormFile> audio)
        {
            var newExam = new DeThi
            {
                TenDeThi = nameExam,
                Idets = etsExam,
                Idqtv = 1,
                ThoiGian = new TimeSpan(2, 0, 0),
            };
            _context.DeThis.Add(newExam);
            _context.SaveChanges();
            if (images.Count == 0 || audio.Count == 0)
            {
                return View("~/Views/AdminPage/EditExam.cshtml");
            }
            else
            {
                foreach (var image in images)
                {
                    if (image != null && image.Length > 0)
                    {
                        //import vào filesystem
                        // Lấy thông tin về tệp tin
                        string fileName = Path.GetFileName(image.FileName);
                        string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", fileName);

                        // Lưu tệp tin vào thư mục Uploads
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            image.CopyTo(stream);
                        }

                        // Lưu thông tin vào database
                        var picture = new Picture
                        {
                            TenFile = fileName,
                            IddeThi = newExam.IddeThi
                        };
                        _context.Pictures.Add(picture);
                        _context.SaveChanges();
                    }
                }
                foreach (var audioFile in audio)
                {
                    if (audioFile != null && audioFile.Length > 0)
                    {
                        // Lấy thông tin về tệp tin
                        string fileName = Path.GetFileName(audioFile.FileName);
                        string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/audio", fileName);

                        // Lưu tệp tin vào thư mục Uploads
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            audioFile.CopyTo(stream);
                        }

                        // Lưu thông tin vào database
                        var audio1 = new Audio
                        {
                            TenFile = fileName,
                            IddeThi = newExam.IddeThi
                        };
                        _context.Audios.Add(audio1);
                        _context.SaveChanges();
                    }
                }
                if (exam != null && exam.Length > 0)
                {
                    using (var stream = new MemoryStream())
                    {
                        exam.CopyTo(stream);
                        using (XLWorkbook workbook = new XLWorkbook(stream))
                        {
                            // Đọc sheet 1
                            IXLWorksheet worksheet1 = workbook.Worksheet(1);
                            bool isFirstRowSheet1 = true;
                            foreach (var row in worksheet1.RowsUsed())
                            {
                                // Bỏ qua dòng đầu tiên (tiêu đề)
                                if (isFirstRowSheet1)
                                {
                                    isFirstRowSheet1 = false;
                                    continue;
                                }
                                var idPicture1 = 7;
                                var typeL = row.Cell(9)!.Value.ToString();
                                var audioExcel = row.Cell(10)!.Value.ToString();
                                var pictureExcel = row.Cell(11)!.Value.ToString();
                                var typeListen = _context.PhanLoaiLs.FirstOrDefault(x => x.Loai == typeL)!.IdphanLoaiL;
                                var idAudio = _context.Audios.FirstOrDefault(x => x.TenFile == audioExcel)!.Idaudio;
                                var idPicture = _context.Pictures.Where(x => x.TenFile == pictureExcel);
                                if (idPicture.Count() > 0)
                                {
                                    idPicture1 = idPicture.FirstOrDefault()!.Idpicture;
                                }
                                var listen = new Listening
                                {
                                    NoiDung = row.Cell(1).Value!.ToString(),
                                    DapAn1 = row.Cell(2).Value!.ToString(),
                                    DapAn2 = row.Cell(3).Value!.ToString(),
                                    DapAn3 = row.Cell(4).Value!.ToString(),
                                    DapAn4 = row.Cell(5).Value!.ToString(),
                                    DapAnDung = row.Cell(6).Value!.ToString(),
                                    GiaiThich = row.Cell(7).Value!.ToString(),
                                    Stt = Convert.ToInt32(row.Cell(8).Value!.ToString()),
                                    IddeThi = newExam.IddeThi,
                                    IdphanLoaiL = typeListen,
                                    Idpicture = idPicture1,
                                    Idaudio = idAudio
                                };
                                _context.Listenings.Add(listen);
                                _context.SaveChanges();
                            }
                            // Đọc sheet 2
                            IXLWorksheet worksheet2 = workbook.Worksheet(2);
                            bool isFirstRowSheet2 = true;
                            foreach (var row in worksheet2.RowsUsed())
                            {
                                // Bỏ qua dòng đầu tiên (tiêu đề)
                                if (isFirstRowSheet2)
                                {
                                    isFirstRowSheet2 = false;
                                    continue;
                                }
                                var idPicture1 = 7;
                                var typeR = row.Cell(9)!.Value.ToString();
                                var pictureExcel = row.Cell(10)!.Value.ToString();
                                var typeReading = _context.PhanLoaiRs.FirstOrDefault(x => x.Loai == typeR)!.IdphanLoaiR;
                                var idPicture = _context.Pictures.Where(x => x.TenFile == pictureExcel);
                                if (idPicture.Count() > 0)
                                {
                                    idPicture1 = idPicture.FirstOrDefault()!.Idpicture;
                                }
                                var reading = new Reading
                                {
                                    NoiDung = row.Cell(1).Value!.ToString(),
                                    DapAn1 = row.Cell(2).Value!.ToString(),
                                    DapAn2 = row.Cell(3).Value!.ToString(),
                                    DapAn3 = row.Cell(4).Value!.ToString(),
                                    DapAn4 = row.Cell(5).Value!.ToString(),
                                    DapAnDung = row.Cell(6).Value!.ToString(),
                                    GiaiThich = row.Cell(7).Value!.ToString(),
                                    Stt = Convert.ToInt32(row.Cell(8).Value!.ToString()),
                                    IddeThi = newExam.IddeThi,
                                    IdphanLoaiR = typeReading,
                                    Idpicture = idPicture1,
                                };
                                _context.Readings.Add(reading);
                                _context.SaveChanges();
                            }
                        }
                    }
                }
            }
            return View("~/Views/AdminPage/Exam.cshtml");
        }
    }
}
