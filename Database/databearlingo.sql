USE [BEARLINGO]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/29/2023 12:47:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audio]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audio](
	[IDAudio] [int] IDENTITY(1,1) NOT NULL,
	[TenFile] [nvarchar](max) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IDDeThi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiLam]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiLam](
	[IDBaiLam] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [time](7) NULL,
	[NgayThi] [date] NULL,
	[IDDeThi] [int] NOT NULL,
	[IDNguoiDung] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBaiLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[IDBlog] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDungBlog] [nvarchar](max) NULL,
	[Anh] [nvarchar](255) NULL,
	[IDQTV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDeNguPhap]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDeNguPhap](
	[IDChuDeNguPhap] [int] IDENTITY(1,1) NOT NULL,
	[TenNguPhap] [nvarchar](max) NULL,
	[STT] [int] NULL,
	[IDQTV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDChuDeNguPhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDeTuVung]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDeTuVung](
	[IDChuDeTuVung] [int] IDENTITY(1,1) NOT NULL,
	[ChuDe] [nvarchar](max) NULL,
	[STT] [int] NULL,
	[IDQTV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDChuDeTuVung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeThi]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeThi](
	[IDDeThi] [int] IDENTITY(1,1) NOT NULL,
	[TenDeThi] [nvarchar](max) NULL,
	[ThoiGian] [time](7) NULL,
	[NoiDungDeThi] [nvarchar](max) NULL,
	[IDQTV] [int] NOT NULL,
	[IDETS] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETS]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETS](
	[IDETS] [int] IDENTITY(1,1) NOT NULL,
	[TenETS] [nvarchar](255) NULL,
	[IDQTV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDETS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaL]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaL](
	[IDKetQuaL] [int] IDENTITY(1,1) NOT NULL,
	[DapAnNguoiDungL] [nvarchar](max) NULL,
	[SoCauDung] [int] NULL,
	[SoCauSai] [int] NULL,
	[Diem] [float] NULL,
	[NgayThi] [date] NULL,
	[ThoiGian] [time](7) NULL,
	[IDLQuestion] [int] NOT NULL,
	[IDBaiLam] [int] NOT NULL,
	[CorrectL] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKetQuaL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaR]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaR](
	[IDKetQuaR] [int] IDENTITY(1,1) NOT NULL,
	[DapAnNguoiDungR] [nvarchar](max) NULL,
	[SoCauDung] [int] NULL,
	[SoCauSai] [int] NULL,
	[Diem] [float] NULL,
	[NgayThi] [date] NULL,
	[ThoiGian] [time](7) NULL,
	[IDRQuestion] [int] NOT NULL,
	[IDBaiLam] [int] NOT NULL,
	[CorrectR] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKetQuaR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listening]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listening](
	[IDLQuestion] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DapAn1] [nvarchar](max) NULL,
	[DapAn2] [nvarchar](max) NULL,
	[DapAn3] [nvarchar](max) NULL,
	[DapAn4] [nvarchar](max) NULL,
	[DapAnDung] [nvarchar](max) NULL,
	[GiaiThich] [nvarchar](max) NULL,
	[STT] [int] NULL,
	[IDDeThi] [int] NOT NULL,
	[IDPhanLoaiL] [int] NOT NULL,
	[IDAudio] [int] NOT NULL,
	[IDPicture] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDLQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IDNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](255) NOT NULL,
	[MatKhau] [varchar](255) NOT NULL,
	[SDT] [int] NOT NULL,
	[Gmail] [varchar](255) NULL,
 CONSTRAINT [PK__NguoiDun__FCD7DB0965E4F7E8] PRIMARY KEY CLUSTERED 
(
	[IDNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguPhap]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguPhap](
	[IDNguPhap] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[CachDung] [nvarchar](max) NULL,
	[CauTruc] [nvarchar](max) NULL,
	[ViDu] [nvarchar](max) NULL,
	[BoSung] [nvarchar](max) NULL,
	[LuuY] [nvarchar](max) NULL,
	[IDChuDeNguPhap] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNguPhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoaiL]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiL](
	[IDPhanLoaiL] [int] IDENTITY(1,1) NOT NULL,
	[Loai] [nvarchar](max) NULL,
	[TenAudio] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPhanLoaiL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoaiR]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiR](
	[IDPhanLoaiR] [int] IDENTITY(1,1) NOT NULL,
	[Loai] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPhanLoaiR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[IDPicture] [int] IDENTITY(1,1) NOT NULL,
	[TenFile] [nvarchar](max) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IDDeThi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPicture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QTV]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QTV](
	[IDQTV] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](255) NOT NULL,
	[MatKhau] [varchar](255) NOT NULL,
	[Gmail] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDQTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reading]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reading](
	[IDRQuestion] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DapAn1] [nvarchar](max) NULL,
	[DapAn2] [nvarchar](max) NULL,
	[DapAn3] [nvarchar](max) NULL,
	[DapAn4] [nvarchar](max) NULL,
	[DapAnDung] [nvarchar](max) NULL,
	[GiaiThich] [nvarchar](max) NULL,
	[STT] [int] NULL,
	[IDDeThi] [int] NOT NULL,
	[IDPhanLoaiR] [int] NOT NULL,
	[IDPicture] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tips]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tips](
	[IDTips] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDungTips] [nvarchar](max) NULL,
	[Anh] [nvarchar](max) NULL,
	[IDQTV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTips] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuVung]    Script Date: 10/29/2023 12:47:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuVung](
	[IDTuVung] [int] IDENTITY(1,1) NOT NULL,
	[TuVung] [varchar](max) NULL,
	[PhatAm] [nvarchar](max) NULL,
	[LoaiTu] [char](255) NULL,
	[NghiaTuVung] [nvarchar](max) NULL,
	[ViDuTuVung] [nvarchar](max) NULL,
	[IDChuDeTuVung] [int] NOT NULL,
 CONSTRAINT [PK__TuVung__3D5AF0694056330F] PRIMARY KEY CLUSTERED 
(
	[IDTuVung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Audio] ON 

INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (1, N'ets_toeic_2019_test_1_1.mp3', N'Part1', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (2, N'ets_toeic_2019_test_1_2.mp3', N'Part1', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (3, N'ets_toeic_2019_test_1_3.mp3', N'Part1', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (4, N'ets_toeic_2019_test_1_4.mp3', N'Part1', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (5, N'ets_toeic_2019_test_1_5.mp3', N'Part1', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (6, N'ets_toeic_2019_test_1_6.mp3', N'Part1', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (8, N'ets_toeic_2019_test_1_7.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (9, N'ets_toeic_2019_test_1_8.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (10, N'ets_toeic_2019_test_1_9.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (11, N'ets_toeic_2019_test_1_10.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (12, N'ets_toeic_2019_test_1_11.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (13, N'ets_toeic_2019_test_1_12.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (14, N'ets_toeic_2019_test_1_13.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (15, N'ets_toeic_2019_test_1_14.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (17, N'ets_toeic_2019_test_1_15.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (18, N'ets_toeic_2019_test_1_16.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (19, N'ets_toeic_2019_test_1_17.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (20, N'ets_toeic_2019_test_1_18.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (21, N'ets_toeic_2019_test_1_19.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (22, N'ets_toeic_2019_test_1_20.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (23, N'ets_toeic_2019_test_1_21.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (24, N'ets_toeic_2019_test_1_22.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (25, N'ets_toeic_2019_test_1_23.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (26, N'ets_toeic_2019_test_1_24.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (27, N'ets_toeic_2019_test_1_25.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (28, N'ets_toeic_2019_test_1_26.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (29, N'ets_toeic_2019_test_1_27.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (30, N'ets_toeic_2019_test_1_28.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (31, N'ets_toeic_2019_test_1_29.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (32, N'ets_toeic_2019_test_1_30.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (33, N'ets_toeic_2019_test_1_31.mp3', N'Part2', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (34, N'ets_toeic_2019_test_1_32_34.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (35, N'ets_toeic_2019_test_1_35_37.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (36, N'ets_toeic_2019_test_1_38_40.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (37, N'ets_toeic_2019_test_1_41_43.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (38, N'ets_toeic_2019_test_1_44_46.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (39, N'ets_toeic_2019_test_1_47_49.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (40, N'ets_toeic_2019_test_1_50_52.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (41, N'ets_toeic_2019_test_1_53_55.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (42, N'ets_toeic_2019_test_1_56_58.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (43, N'ets_toeic_2019_test_1_59_61.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (45, N'ets_toeic_2019_test_1_62_64.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (46, N'ets_toeic_2019_test_1_65_67.mp3', N'Part3', 1)
INSERT [dbo].[Audio] ([IDAudio], [TenFile], [GhiChu], [IDDeThi]) VALUES (47, N'ets_toeic_2019_test_1_68_70.mp3', N'Part3', 1)
SET IDENTITY_INSERT [dbo].[Audio] OFF
GO
SET IDENTITY_INSERT [dbo].[BaiLam] ON 

INSERT [dbo].[BaiLam] ([IDBaiLam], [ThoiGian], [NgayThi], [IDDeThi], [IDNguoiDung]) VALUES (1, CAST(N'00:07:27.9870898' AS Time), CAST(N'2023-10-29' AS Date), 1, 1)
INSERT [dbo].[BaiLam] ([IDBaiLam], [ThoiGian], [NgayThi], [IDDeThi], [IDNguoiDung]) VALUES (2, CAST(N'00:17:46.5924652' AS Time), CAST(N'2023-10-29' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[BaiLam] OFF
GO
SET IDENTITY_INSERT [dbo].[DeThi] ON 

INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (1, N'ETS 2019 - Test 1', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2019 Test 1 thiết kế dưới dạng bài thi thử IELTS Online', 1, 4)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (4, N'ETS 2019 - Test 2', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2019 Test 2 thiết kế dưới dạng bài thi thử IELTS Online', 1, 5)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (5, N'ETS 2019 - Test 3', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2019 Test 3 thiết kế dưới dạng bài thi thử IELTS Online', 1, 6)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (6, N'ETS 2019 - Test 4', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2019 Test 4 thiết kế dưới dạng bài thi thử IELTS Online', 1, 7)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (11, N'ETS 2020 - Test 1', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2020 Test 1 thiết kế dưới dạng bài thi thử IELTS Online', 1, 9)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (12, N'ETS 2020 - Test 2', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2020 Test 2 thiết kế dưới dạng bài thi thử IELTS Online', 1, 10)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (13, N'ETS 2020 - Test 3', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2020 Test 3 thiết kế dưới dạng bài thi thử IELTS Online', 1, 11)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (14, N'ETS 2020 - Test 4', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2020 Test 4 thiết kế dưới dạng bài thi thử IELTS Online', 1, 12)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (15, N'ETS 2021 - Test 1', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2021 Test 1 thiết kế dưới dạng bài thi thử IELTS Online', 1, 13)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (16, N'ETS 2021 - Test 2', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2021 Test 2 thiết kế dưới dạng bài thi thử IELTS Online', 1, 14)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (17, N'ETS 2021 - Test 3', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2021 Test 3 thiết kế dưới dạng bài thi thử IELTS Online', 1, 15)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (18, N'ETS 2021 - Test 4', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2021 Test 4 thiết kế dưới dạng bài thi thử IELTS Online', 1, 16)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (19, N'ETS 2022 - Test 1', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2022 Test 1 thiết kế dưới dạng bài thi thử IELTS Online', 1, 17)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (20, N'ETS 2022 - Test 2', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2022 Test 2 thiết kế dưới dạng bài thi thử IELTS Online', 1, 18)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (21, N'ETS 2022 - Test 3', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2022 Test 3 thiết kế dưới dạng bài thi thử IELTS Online', 1, 19)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (22, N'ETS 2022 - Test 4', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2022 Test 4 thiết kế dưới dạng bài thi thử IELTS Online', 1, 20)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (23, N'ETS 2023 - Test 1', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2023 Test 1 thiết kế dưới dạng bài thi thử IELTS Online', 1, 21)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (24, N'ETS 2023 - Test 2', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2023 Test 2 thiết kế dưới dạng bài thi thử IELTS Online', 1, 22)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (25, N'ETS 2023 - Test 3', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2023 Test 3 thiết kế dưới dạng bài thi thử IELTS Online', 1, 23)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (26, N'ETS 2023 - Test 4', CAST(N'02:00:00' AS Time), N'ETS TOEIC 2023 Test 4 thiết kế dưới dạng bài thi thử IELTS Online', 1, 24)
SET IDENTITY_INSERT [dbo].[DeThi] OFF
GO
SET IDENTITY_INSERT [dbo].[ETS] ON 

INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (4, N'ETS 2019 - Test 1', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (5, N'ETS 2019 - Test 2', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (6, N'ETS 2019 - Test 3', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (7, N'ETS 2019 - Test 4', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (9, N'ETS 2020 - Test 1', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (10, N'ETS 2020 - Test 2', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (11, N'ETS 2020 - Test 3', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (12, N'ETS 2020 - Test 4', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (13, N'ETS 2021 - Test 1', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (14, N'ETS 2021 - Test 2', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (15, N'ETS 2021 - Test 3', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (16, N'ETS 2021 - Test 4', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (17, N'ETS 2022 - Test 1', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (18, N'ETS 2022 - Test 2', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (19, N'ETS 2022 - Test 3', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (20, N'ETS 2022 - Test 4', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (21, N'ETS 2023 - Test 1', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (22, N'ETS 2023 - Test 2', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (23, N'ETS 2023 - Test 3', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (24, N'ETS 2023 - Test 4', 1)
SET IDENTITY_INSERT [dbo].[ETS] OFF
GO
SET IDENTITY_INSERT [dbo].[KetQuaL] ON 

INSERT [dbo].[KetQuaL] ([IDKetQuaL], [DapAnNguoiDungL], [SoCauDung], [SoCauSai], [Diem], [NgayThi], [ThoiGian], [IDLQuestion], [IDBaiLam], [CorrectL]) VALUES (10, NULL, 0, 100, 15, CAST(N'2023-10-29' AS Date), NULL, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[KetQuaL] OFF
GO
SET IDENTITY_INSERT [dbo].[KetQuaR] ON 

INSERT [dbo].[KetQuaR] ([IDKetQuaR], [DapAnNguoiDungR], [SoCauDung], [SoCauSai], [Diem], [NgayThi], [ThoiGian], [IDRQuestion], [IDBaiLam], [CorrectR]) VALUES (7, NULL, 2, 46, 25, CAST(N'2023-10-29' AS Date), NULL, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[KetQuaR] OFF
GO
SET IDENTITY_INSERT [dbo].[Listening] ON 

INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (2, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 1, 1, 1, 1, 1)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (3, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 2, 1, 1, 2, 2)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (4, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 3, 1, 1, 3, 3)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (6, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 4, 1, 1, 4, 4)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (7, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 5, 1, 1, 5, 5)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (8, NULL, N'A', N'B', N'C', N'D', N'D', NULL, 6, 1, 1, 6, 6)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (12, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 7, 1, 2, 8, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (13, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 8, 1, 2, 9, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (14, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 9, 1, 2, 10, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (15, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 10, 1, 2, 11, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (16, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 11, 1, 2, 12, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (17, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 12, 1, 2, 13, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (18, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 13, 1, 2, 14, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (19, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 14, 1, 2, 15, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (22, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 15, 1, 2, 17, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (23, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 16, 1, 2, 18, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (24, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 17, 1, 2, 19, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (25, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 18, 1, 2, 20, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (26, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 19, 1, 2, 21, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (27, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 20, 1, 2, 22, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (28, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 21, 1, 2, 23, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (29, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 22, 1, 2, 24, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (30, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 23, 1, 2, 25, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (31, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 24, 1, 2, 26, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (32, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 25, 1, 2, 27, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (33, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 26, 1, 2, 28, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (34, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 27, 1, 2, 29, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (35, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 28, 1, 2, 30, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (36, NULL, N'A', N'B', N'C', N'D', N'B', NULL, 29, 1, 2, 31, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (37, NULL, N'A', N'B', N'C', N'D', N'A', NULL, 30, 1, 2, 32, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (38, NULL, N'A', N'B', N'C', N'D', N'C', NULL, 31, 1, 2, 33, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (39, N'Why is the woman calling?', N'To make an appointment', N'To rent a car', N'To ask about a fee ', N'To apply for a position', N'C', NULL, 32, 1, 3, 34, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (40, N'According to the man, what has recently 
changed? ', N'Office hours ', N'Job requirements ', N'A computer system ', N'A company policy ', N'D', NULL, 33, 1, 3, 34, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (42, N'What does the man agree to do? ', N'Waive a fee ', N'Reschedule a meeting ', N'Sign a contract ', N'Repair a vehicle', N'A', NULL, 34, 1, 3, 34, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (43, N'What is the topic of the conversation? ', N'Health ', N'Traffic ', N'Sports ', N'Finance ', N'C', NULL, 35, 1, 3, 35, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (46, N'What caused a problem? ', N'A staffing change ', N'A rainstorm ', N'A typographical error ', N'A road closure ', N'B', NULL, 36, 1, 3, 35, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (47, N'What will the listeners hear next? ', N'A commercial ', N'A song ', N'A weather report ', N'A reading from a book ', N'A', NULL, 37, 1, 3, 35, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (48, N'What does the woman notify the man about? ', N'She is unable to meet a deadline. ', N'She needs a replacement laptop.', N'She cannot attend a business trip. ', N'She is planning to give a speech. ', N'C', NULL, 38, 1, 3, 36, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (49, N'According to the woman, what recently happened in her department? ', N'A corporate policy was updated. ', N'A supply order was mishandled. ', N'Client contracts were renewed. ', N'New employees were hired. ', N'D', NULL, 39, 1, 3, 36, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (50, N'What does the man say he will do next? ', N'Speak with a colleague ', N'Conduct an interview ', N'Calculate a budget ', N'Draft a travel itinerary ', N'A', NULL, 40, 1, 3, 36, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (51, N'What does the man want to do? ', N'Purchase an area map ', N'See an event schedule ', N'Cancel a hotel reservation ', N'Book a bus tour', N'D', NULL, 41, 1, 3, 37, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (52, N'What is the man asked to choose? ', N'When to arrive ', N'What to visit ', N'How to pay ', N'What to eat ', N'D', NULL, 42, 1, 3, 37, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (53, N'What does the woman suggest doing? ', N'Wearing a jacket ', N'Using a credit card ', N'Bringing a camera', N'Looking for a coupon ', N'C', NULL, 43, 1, 3, 37, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (55, N'What does the man offer to do? ', N'Meet in the lobby ', N'Contact a receptionist ', N'Carry some files ', N'Delay a meeting ', N'C', NULL, 44, 1, 3, 38, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (56, N'According to the man, what happened last week? ', N'An office door would not lock. ', N'A sink was installed incorrectly. ', N'An elevator stopped working. ', N'A document was lost', N'C', NULL, 45, 1, 3, 38, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (57, N'Why does the woman say, "a piece of hardware 
had to be custom made"? ', N'To justify a price ', N'To explain a delay ', N'To illustrate a product''s age ', N'To express regret for a purchase', N'B', NULL, 46, 1, 3, 38, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (58, N'What product are the speakers discussing? ', N'Electronics ', N'Office furniture ', N'Calendars ', N'Clothing', N'D', NULL, 47, 1, 3, 39, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (59, N'What does Donna suggest?', N'Hiring additional staff ', N'Revising a budget ', N'Posting some photos online ', N'Reducing prices', N'B', NULL, 48, 1, 3, 39, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (60, N'What does the man propose? ', N'Postponing a decision ', N'Conducting a survey ', N'Developing new products ', N'Opening another location ', N'A', NULL, 49, 1, 3, 39, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (62, N'Who most likely is the man? ', N'A manager ', N'A consultant ', N'A client ', N'A trainee', N'D', NULL, 50, 1, 3, 40, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (63, N'What does the woman ask the man for? ', N'Some feedback ', N'Some assistance ', N'Some references ', N'Some dates', N'A', NULL, 51, 1, 3, 40, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (64, N'What will the man receive? ', N'Extra time off ', N'A promotion ', N'Bonus pay ', N'An award', N'B', NULL, 52, 1, 3, 40, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (65, N'What type of product is being discussed? ', N'A musical instrument ', N'A kitchen appliance ', N'A power tool', N'A tablet computer
', N'D', NULL, 53, 1, 3, 41, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (67, N'Which product feature is the man most proud of? ', N'The battery life ', N'The color selection ', N'The sound quality ', N'The size', N'A', NULL, 54, 1, 3, 41, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (69, N'Why does the man say, "my favorite singer is performing that night"? ', N'To request a schedule change ', N'To explain a late arrival ', N'To decline an invitation ', N'To recommend a musician', N'C', NULL, 55, 1, 3, 41, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (71, N'What type of event is being planned?', N'A trade show ', N'An awards ceremony ', N'A film festival ', N'A wedding', N'B', NULL, 56, 1, 3, 42, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (72, N'What does the man ask about? ', N'Accommodations ', N'Entertainment ', N'Meal options ', N'Outdoor seating', N'A', NULL, 57, 1, 3, 42, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (73, N'What does the hotel offer for free? ', N'Meals', N'Internet access ', N'Transportation ', N'Parking', N'C', NULL, 58, 1, 3, 42, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (74, N'What problem do~s the man mention? ', N'His car is out of fuel. ', N'His phone battery is empty. ', N'He is late for an appointment. ', N'He forgot his wallet. ', N'B', NULL, 59, 1, 3, 43, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (75, N'Where are the speakers? ', N'At a train station ', N'At an electronics repair shop ', N'At a furniture store ', N'At a coffee shop ', N'D', NULL, 60, 1, 3, 43, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (76, N'What does the woman suggest the man do? ', N'Check a Web site ', N'Call a taxi ', N'Return at a later time ', N'Go to the library', N'D', NULL, 61, 1, 3, 43, 7)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (78, N'What is the man having trouble with?', N'Conducting a test ', N'reparing a bill', N'Contacting a patient', N'Shipping an order ', N'B', NULL, 62, 1, 3, 45, 8)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (79, N'Look at the graphic. Which code should the man use? ', N'018 ', N'019 ', N'020 ', N'021 ', N'A', NULL, 63, 1, 3, 45, 8)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (80, N'What does the woman say will happen soon? ', N'Some patients will be transferred to another doctor. ', N'Some employees will join a medical practice. ', N'A list will be available electronically. ', N'A doctor will begin a medical procedure. ', N'C', NULL, 64, 1, 3, 45, 8)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (81, N'What does the woman say they will need to do? ', N'Rent storage space ', N'Increase production ', N'Organize a fashion show ', N'Update some equipment ', N'B', NULL, 65, 1, 3, 46, 9)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (82, N'What does the man suggest?', N'Conferring with a client ', N'Contacting another department ', N'Photographing some designs ', N'Changing suppliers', N'B', NULL, 66, 1, 3, 46, 9)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (84, N'Look at the graphic. Which section of the label will 
the man need to revise? ', N'The logo', N'The material ', N'The care instructions ', N'The country of origin ', N'C', NULL, 67, 1, 3, 46, 9)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (85, N'What are the speakers mainly discussing? ', N'A job interview ', N'A company celebration ', N'An office relocation ', N'A landscaping project ', N'A', NULL, 68, 1, 3, 47, 10)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (86, N'Look at the graphic. Which building is Silverby Industries located in? ', N'Building 1 ', N'Building 2', N'Building 3', N'Building 4', N'B', NULL, 69, 1, 3, 47, 10)
INSERT [dbo].[Listening] ([IDLQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiL], [IDAudio], [IDPicture]) VALUES (87, N'What does the woman tell the man about parking? ', N'He should park in a visitor''s space. ', N'He will have to pay at a meter. ', N'A parking pass is required.', N'The parking area fills up quickly. ', NULL, NULL, 70, 1, 3, 47, 10)
SET IDENTITY_INSERT [dbo].[Listening] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IDNguoiDung], [TenDangNhap], [MatKhau], [SDT], [Gmail]) VALUES (1, N'thanhbinh', N'10022002', 912345678, N'thanhbinhdxdx@gmail.com')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanLoaiL] ON 

INSERT [dbo].[PhanLoaiL] ([IDPhanLoaiL], [Loai], [TenAudio]) VALUES (1, N'Part1', NULL)
INSERT [dbo].[PhanLoaiL] ([IDPhanLoaiL], [Loai], [TenAudio]) VALUES (2, N'Part2', NULL)
INSERT [dbo].[PhanLoaiL] ([IDPhanLoaiL], [Loai], [TenAudio]) VALUES (3, N'Part3', NULL)
INSERT [dbo].[PhanLoaiL] ([IDPhanLoaiL], [Loai], [TenAudio]) VALUES (4, N'Part4', NULL)
SET IDENTITY_INSERT [dbo].[PhanLoaiL] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanLoaiR] ON 

INSERT [dbo].[PhanLoaiR] ([IDPhanLoaiR], [Loai]) VALUES (1, N'Part7')
SET IDENTITY_INSERT [dbo].[PhanLoaiR] OFF
GO
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (1, N'pic1.png', N'Part1', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (2, N'pic2.png', N'Part1', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (3, N'pic3.png', N'Part1', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (4, N'pic4.png', N'Part1', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (5, N'pic5.png', N'Part1', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (6, N'pic6.png', N'Part1', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (7, NULL, NULL, 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (8, N'pic62-64.png', N'Part3', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (9, N'pic65-67.png', N'Part3', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (10, N'pic68-70.png', N'Part3', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (11, N'pic147-148.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (12, N'pic149-150.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (13, N'pic151-152.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (14, N'pic153-154.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (15, N'pic155-157.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (16, N'pic158-160.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (17, N'pic161-163.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (18, N'pic164-167.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (19, N'pic168-171.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (20, N'pic172-175.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (21, N'pic176-180.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (22, N'pic181-185.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (24, N'pic186-190.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (25, N'pic191-195.png', N'Part7', 1)
INSERT [dbo].[Picture] ([IDPicture], [TenFile], [GhiChu], [IDDeThi]) VALUES (26, N'pic196-200.png', N'Part7', 1)
SET IDENTITY_INSERT [dbo].[Picture] OFF
GO
SET IDENTITY_INSERT [dbo].[QTV] ON 

INSERT [dbo].[QTV] ([IDQTV], [TenDangNhap], [MatKhau], [Gmail]) VALUES (1, N'admin', N'admin', N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[QTV] OFF
GO
SET IDENTITY_INSERT [dbo].[Reading] ON 

INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (1, N'Where does Ms. Brown most likely work?', N'At an accounting firm ', N'At an architectural firm', N'At a Web design company', N'At a market research company', N'B', NULL, 147, 1, 1, 11)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (2, N'What is Ziva asked to do? ', N'Reply to a text message', N'Create a portfolio', N'Set up a meeting', N'Send a work sample', N'D', NULL, 148, 1, 1, 11)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (4, N'What is the purpose of the e-mail?', N'To request a sales report', N'To announce a new policy', N'To discuss a fashion trend ', N'To describe an upcoming sale', N'B', NULL, 149, 1, 1, 12)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (5, N'According to the e-mail, what will managers do?', N'Decide how to display new merchandise', N'Train staff to use the cash register', N'Help customers with special requests', N'Decide what items get price discounts', N'C', NULL, 150, 1, 1, 12)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (6, N'What is mentioned about Carmont Media''s employees?', N'They get experience in various departments.', N'They enjoy working for the organization. ', N'They come from a variety of backgrounds. ', N'They are recruited through a staffing agency.
', N'C', NULL, 151, 1, 1, 13)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (7, N'What is a purpose of Carmont Media''s Star teams?', N'Seeking new employees', N'Raising funds for projects ', N'Promoting work-life balance', N'Finding creative solutions ', N'D', NULL, 152, 1, 1, 13)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (8, N'What does Mr. Muro want Ms. Santos to do? ', N'Process some orders', N'Make a hiring decision ', N'Reschedule a meeting', N'Talk to a job candidate', N'D', NULL, 153, 1, 1, 14)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (9, N'At 9:36A.M., what does Mr. Muro mean when he writes, "I know"?', N'He is also surprised by the company''s growth.', N'He thinks salaries should be higher. ', N'He has met Ms. Crenshaw before.', N'He is certain his bus will arrive in 30 minutes.', N'A', NULL, 154, 1, 1, 14)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (11, N'What is the purpose of the article? ', N'To recognize an employee''s accomplishments ', N'To introduce a new staff member', N'To clarify what information is considered confidential ', N'To describe the challenges of corporate security', N'A', NULL, 155, 1, 1, 15)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (12, N'How did Mr. Chandler improve corporate security?', N'He trained his company''s security officers. ', N'He helped design a system for securely storing documents. ', N'He assisted in developing new safety guidelines. ', N'He recruited employees who specialize in corporate security. ', N'B', NULL, 156, 1, 1, 15)
INSERT [dbo].[Reading] ([IDRQuestion], [NoiDung], [DapAn1], [DapAn2], [DapAn3], [DapAn4], [DapAnDung], [GiaiThich], [STT], [IDDeThi], [IDPhanLoaiR], [IDPicture]) VALUES (13, N'In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong?
"The training included 60 hours of instruction and a comprehensive written exam." ', N'[1]', N'[2] ', N'[3] ', N'[4]', N'B', NULL, 157, 1, 1, 15)
SET IDENTITY_INSERT [dbo].[Reading] OFF
GO
ALTER TABLE [dbo].[Audio]  WITH CHECK ADD FOREIGN KEY([IDDeThi])
REFERENCES [dbo].[DeThi] ([IDDeThi])
GO
ALTER TABLE [dbo].[BaiLam]  WITH CHECK ADD FOREIGN KEY([IDDeThi])
REFERENCES [dbo].[DeThi] ([IDDeThi])
GO
ALTER TABLE [dbo].[BaiLam]  WITH CHECK ADD  CONSTRAINT [FK__BaiLam__IDNguoiD__48CFD27E] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[BaiLam] CHECK CONSTRAINT [FK__BaiLam__IDNguoiD__48CFD27E]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([IDQTV])
REFERENCES [dbo].[QTV] ([IDQTV])
GO
ALTER TABLE [dbo].[ChuDeNguPhap]  WITH CHECK ADD FOREIGN KEY([IDQTV])
REFERENCES [dbo].[QTV] ([IDQTV])
GO
ALTER TABLE [dbo].[ChuDeTuVung]  WITH CHECK ADD FOREIGN KEY([IDQTV])
REFERENCES [dbo].[QTV] ([IDQTV])
GO
ALTER TABLE [dbo].[DeThi]  WITH CHECK ADD FOREIGN KEY([IDETS])
REFERENCES [dbo].[ETS] ([IDETS])
GO
ALTER TABLE [dbo].[DeThi]  WITH CHECK ADD FOREIGN KEY([IDQTV])
REFERENCES [dbo].[QTV] ([IDQTV])
GO
ALTER TABLE [dbo].[ETS]  WITH CHECK ADD FOREIGN KEY([IDQTV])
REFERENCES [dbo].[QTV] ([IDQTV])
GO
ALTER TABLE [dbo].[KetQuaL]  WITH CHECK ADD FOREIGN KEY([IDBaiLam])
REFERENCES [dbo].[BaiLam] ([IDBaiLam])
GO
ALTER TABLE [dbo].[KetQuaL]  WITH CHECK ADD FOREIGN KEY([IDLQuestion])
REFERENCES [dbo].[Listening] ([IDLQuestion])
GO
ALTER TABLE [dbo].[KetQuaR]  WITH CHECK ADD FOREIGN KEY([IDBaiLam])
REFERENCES [dbo].[BaiLam] ([IDBaiLam])
GO
ALTER TABLE [dbo].[KetQuaR]  WITH CHECK ADD FOREIGN KEY([IDRQuestion])
REFERENCES [dbo].[Reading] ([IDRQuestion])
GO
ALTER TABLE [dbo].[Listening]  WITH CHECK ADD FOREIGN KEY([IDAudio])
REFERENCES [dbo].[Audio] ([IDAudio])
GO
ALTER TABLE [dbo].[Listening]  WITH CHECK ADD FOREIGN KEY([IDDeThi])
REFERENCES [dbo].[DeThi] ([IDDeThi])
GO
ALTER TABLE [dbo].[Listening]  WITH CHECK ADD FOREIGN KEY([IDPhanLoaiL])
REFERENCES [dbo].[PhanLoaiL] ([IDPhanLoaiL])
GO
ALTER TABLE [dbo].[Listening]  WITH CHECK ADD FOREIGN KEY([IDPicture])
REFERENCES [dbo].[Picture] ([IDPicture])
GO
ALTER TABLE [dbo].[NguPhap]  WITH CHECK ADD FOREIGN KEY([IDChuDeNguPhap])
REFERENCES [dbo].[ChuDeNguPhap] ([IDChuDeNguPhap])
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD FOREIGN KEY([IDDeThi])
REFERENCES [dbo].[DeThi] ([IDDeThi])
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD FOREIGN KEY([IDDeThi])
REFERENCES [dbo].[DeThi] ([IDDeThi])
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD FOREIGN KEY([IDPhanLoaiR])
REFERENCES [dbo].[PhanLoaiR] ([IDPhanLoaiR])
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD FOREIGN KEY([IDPicture])
REFERENCES [dbo].[Picture] ([IDPicture])
GO
ALTER TABLE [dbo].[Tips]  WITH CHECK ADD FOREIGN KEY([IDQTV])
REFERENCES [dbo].[QTV] ([IDQTV])
GO
ALTER TABLE [dbo].[TuVung]  WITH CHECK ADD  CONSTRAINT [FK__TuVung__IDChuDeT__5CD6CB2B] FOREIGN KEY([IDChuDeTuVung])
REFERENCES [dbo].[ChuDeTuVung] ([IDChuDeTuVung])
GO
ALTER TABLE [dbo].[TuVung] CHECK CONSTRAINT [FK__TuVung__IDChuDeT__5CD6CB2B]
GO
