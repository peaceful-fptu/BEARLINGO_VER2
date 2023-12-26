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

        public IActionResult GetBlogs(string num)
        {
            int pageSize = 4;
            List<Blog> allBlogs = _context.Blogs.ToList();
            int totalPages = (allBlogs.Count() % pageSize) > 0 ? (allBlogs.Count() / pageSize) + 1 : (allBlogs.Count() / pageSize);
            int currentPage = string.IsNullOrEmpty(num) ? 1 : Convert.ToInt32(num);
            List<Blog> blogsForCurrentPage = allBlogs.Skip(pageSize * (currentPage - 1)).Take(pageSize).ToList();
            ViewBag.blogs = blogsForCurrentPage;
            ViewBag.currentPage = currentPage;
            ViewBag.totalPages = totalPages;
            return View("~/Views/Blog/Blogs.cshtml");
        }

        public IActionResult BlogDetail(int id)
        {
            var blog = _context.Blogs.FirstOrDefault(n => n.Idblog == id);
            ViewBag.Blog = blog;
            return View("~/Views/Blog/BlogDetail.cshtml");
        }
        public IActionResult BlogManage()
        {
            var blogs = _context.Blogs.ToList();
            ViewBag.blogs = blogs;
            return View();
        }

        public IActionResult AddBlog()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddBlog(string title, string mota, IFormFile ImageUpload)
        {
            var blog = new Blog()
            {
                Anh = helper.UploadPhoto(ImageUpload.OpenReadStream()),
                NoiDungBlog = mota,
                TieuDe = title,
                Idqtv = 1
            };
            _context.Blogs.Add(blog);
            _context.SaveChanges();
            return RedirectToAction("GetBlogs", "Dashboard");
        }
        public IActionResult DeleteBlog(int id)
        {
            Blog? blog = _context.Blogs.FirstOrDefault(bl => bl.Idblog == id);
            if (blog != null)
            {
                _context.Blogs.Remove(blog);
                _context.SaveChanges();
            }
            return RedirectToAction("GetBlogs", "Dashboard");
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
            return RedirectToAction("GetBlogs", "Dashboard");
        }
    }
}
