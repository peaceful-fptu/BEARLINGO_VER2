using BEARLINGO.Models;
using BEARLINGO.Util;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static BEARLINGO.Program;

namespace BEARLINGO.Controllers.Admin
{
    public class BlogController : Controller
    {
        private readonly BearlingoContext _context;
        private readonly Helper helper = new Helper();

        public BlogController(BearlingoContext context)
        {
            _context = context;
        }

        public IActionResult getBlogs(string num)
        {
            int totalPages = 0;
            int pageSize = 4;
            List<Blog> list = _context.Blogs.ToList();
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
            ViewBag.blogs = list;
            ViewBag.totalPage = totalPages;
            return View("~/Views/Blog/Blogs.cshtml");
        }

        public IActionResult BlogDetail(int id)
        {
            Blog? blog = _context.Blogs.FirstOrDefault(n => n.Idblog == id);
            ViewBag.Blog = blog;
            return View("~/Views/Blog/BlogDetail.cshtml");
        }
        public IActionResult BlogManage()
        {
                var blogs = _context.Blogs.ToList();
                ViewBag.blogs = blogs;
            return View();
        }

        public IActionResult addBlog()
        {
            return View();
        }

        [HttpPost]
        public IActionResult addBlog(string title, string mota, IFormFile ImageUpload)
        {
                Blog blog = new Blog()
                {
                    Anh = helper.UploadPhoto(ImageUpload.OpenReadStream()),
                    NoiDungBlog = mota,
                    TieuDe = title,
                    Idqtv = 1
                };
                _context.Blogs.Add(blog);
                _context.SaveChanges();
                return RedirectToAction("getBlogs", "Dashboard");
        }
        public IActionResult deleteBlog(int id)
        {
                Blog? blog = _context.Blogs.FirstOrDefault(bl => bl.Idblog == id);
                if (blog != null)
                {
                    _context.Blogs.Remove(blog);
                    _context.SaveChanges();
                }
            return RedirectToAction("getBlogs", "Dashboard");
        }

        [HttpPost]
        public IActionResult editBlog(string id, string title, IFormFile ImageUpload, string content)
        {
            Blog? newBlog = _context.Blogs.FirstOrDefault(n => n.Idblog == int.Parse(id));
            newBlog!.NoiDungBlog = content;
            newBlog.TieuDe = title;
            if (ImageUpload != null)
            {
                newBlog.Anh = helper.UploadPhoto(ImageUpload.OpenReadStream());
            }
                _context.Blogs.Update(newBlog);
                _context.SaveChanges();
            return RedirectToAction("getBlogs", "Dashboard");
        }
    }
}
