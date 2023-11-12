using System;
using System.Collections.Generic;

namespace BEARLINGO.Models;

public partial class KetQuaR
{
    public int IdketQuaR { get; set; }

    public string? DapAnNguoiDungR { get; set; }

    public int Idrquestion { get; set; }

    public int IdbaiLam { get; set; }

    public string? CorrectR { get; set; }

    public virtual BaiLam IdbaiLamNavigation { get; set; } = null!;

    public virtual Reading IdrquestionNavigation { get; set; } = null!;
}
