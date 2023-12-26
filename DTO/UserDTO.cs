namespace BEARLINGO.DTO
{
    public class UserDTO
    {
        public int IdnguoiDung { get; set; }

        public string TenDangNhap { get; set; } = null!;

        public string MatKhau { get; set; } = null!;

        public int Sdt { get; set; }

        public string? Gmail { get; set; }
        public int ExamCount { get; set; }
    }
}
