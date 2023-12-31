USE [BEARLINGO]
GO
SET IDENTITY_INSERT [dbo].[QTV] ON 

INSERT [dbo].[QTV] ([IDQTV], [TenDangNhap], [MatKhau], [Gmail]) VALUES (1, N'admin', N'admin', N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[QTV] OFF
GO
SET IDENTITY_INSERT [dbo].[ETS] ON 

INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (1, N'ETS2018', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (2, N'ETS2019', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (3, N'ETS2020', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (5, N'ETS2021', 1)
INSERT [dbo].[ETS] ([IDETS], [TenETS], [IDQTV]) VALUES (6, N'ETS2022', 1)
SET IDENTITY_INSERT [dbo].[ETS] OFF
GO
SET IDENTITY_INSERT [dbo].[DeThi] ON 

INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (1, N'ETS TOEIC 2018', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 1)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (2, N'ETS TOEIC 2018 2', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 1)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (3, N'ETS TOEIC 2018 3', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 1)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (4, N'ETS TOEIC 2019 1', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 2)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (5, N'ETS TOEIC 2019 2', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 2)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (6, N'ETS TOEIC 2019 3', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 2)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (7, N'ETS TOEIC 2020 1', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 3)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (8, N'ETS TOEIC 2020 2', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 3)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (9, N'ETS TOEIC 2020 3', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 3)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (10, N'ETS TOEIC 2021 1', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 5)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (11, N'ETS TOEIC 2021 2', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 5)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (12, N'ETS TOEIC 2021 3', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 5)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (13, N'ETS TOEIC 2022 1', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 6)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (14, N'ETS TOEIC 2022 2', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 6)
INSERT [dbo].[DeThi] ([IDDeThi], [TenDeThi], [ThoiGian], [NoiDungDeThi], [IDQTV], [IDETS]) VALUES (15, N'ETS TOEIC 2022 3', CAST(N'03:20:00' AS Time), N'7 Phan', 1, 6)
SET IDENTITY_INSERT [dbo].[DeThi] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IDNguoiDung], [TenDangNhap], [MatKhau], [SDT], [Gmail]) VALUES (1, N'admin', N'admin', 1234567890, N'vuminhhieu171103@gmail.com
')
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [TenDangNhap], [MatKhau], [SDT], [Gmail]) VALUES (2, N'Nguyễn Kiên', N'Kienbeo237', 919507158, N'kiennhhe163054@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[ChuDeNguPhap] ON 

INSERT [dbo].[ChuDeNguPhap] ([IDChuDeNguPhap], [TenNguPhap], [STT], [IDQTV]) VALUES (2, N'Chu De 1', 1, 1)
INSERT [dbo].[ChuDeNguPhap] ([IDChuDeNguPhap], [TenNguPhap], [STT], [IDQTV]) VALUES (3, N'Chu De 2', 2, 1)
INSERT [dbo].[ChuDeNguPhap] ([IDChuDeNguPhap], [TenNguPhap], [STT], [IDQTV]) VALUES (4, N'Chu De 3', 3, 1)
INSERT [dbo].[ChuDeNguPhap] ([IDChuDeNguPhap], [TenNguPhap], [STT], [IDQTV]) VALUES (5, N'Chu De 4', 3, 1)
INSERT [dbo].[ChuDeNguPhap] ([IDChuDeNguPhap], [TenNguPhap], [STT], [IDQTV]) VALUES (6, N'Chu De 5', 3, 1)
SET IDENTITY_INSERT [dbo].[ChuDeNguPhap] OFF
GO
SET IDENTITY_INSERT [dbo].[NguPhap] ON 

INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (2, N'Tieu De 1', N'Cach Dung 1', N'Cau Truc 1', N'Vi Du 1', N'Bo Sung 1', N'Luu Y 1', 2)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (3, N'Tieu De 2', N'Cach Dung 2', N'Cau Truc 2', N'Vi Du 2', N'Bo Sung 2', N'Luu Y 2', 3)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (4, N'Tieu De 3', N'Cach Dung 3', N'Cau Truc 3', N'Vi Du 3', N'Bo Sung 3', N'Luu Y 3', 4)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (5, N'Tieu De 4', N'Cach Dung 4', N'Cau Truc 4', N'Vi Du 4', N'Bo Sung 4', N'Luu Y 4', 5)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (6, N'Tieu De 5', N'Cach Dung 5', N'Cau Truc 5', N'Vi Du 5', N'Bo Sung 5', N'Luu Y 5', 6)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (7, N'Tieu De 1', N'Cach Dung 1', N'Cau Truc 1', N'Vi Du 1', N'Bo Sung 1', N'Luu Y 1', 2)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (8, N'Tieu De 1', N'Cach Dung 1', N'Cau Truc 1', N'Vi Du 1', N'Bo Sung 1', N'Luu Y 1', 2)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (9, N'Tieu De 1', N'Cach Dung 1', N'Cau Truc 1', N'Vi Du 1', N'Bo Sung 1', N'Luu Y 1', 2)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (10, N'Tieu De 1', N'Cach Dung 1', N'Cau Truc 1', N'Vi Du 1', N'Bo Sung 1', N'Luu Y 1', 2)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (11, N'Tieu De 2', N'Cach Dung 2', N'Cau Truc 2', N'Vi Du 2', N'Bo Sung 2', N'Luu Y 2', 3)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (12, N'Tieu De 2', N'Cach Dung 2', N'Cau Truc 2', N'Vi Du 2', N'Bo Sung 2', N'Luu Y 2', 3)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (13, N'Tieu De 2', N'Cach Dung 2', N'Cau Truc 2', N'Vi Du 2', N'Bo Sung 2', N'Luu Y 2', 3)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (14, N'Tieu De 2', N'Cach Dung 2', N'Cau Truc 2', N'Vi Du 2', N'Bo Sung 2', N'Luu Y 2', 3)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (15, N'Tieu De 3', N'Cach Dung 3', N'Cau Truc 3', N'Vi Du 3', N'Bo Sung 3', N'Luu Y 3', 4)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (16, N'Tieu De 3', N'Cach Dung 3', N'Cau Truc 3', N'Vi Du 3', N'Bo Sung 3', N'Luu Y 3', 4)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (17, N'Tieu De 3', N'Cach Dung 3', N'Cau Truc 3', N'Vi Du 3', N'Bo Sung 3', N'Luu Y 3', 4)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (18, N'Tieu De 3', N'Cach Dung 3', N'Cau Truc 3', N'Vi Du 3', N'Bo Sung 3', N'Luu Y 3', 4)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (19, N'Tieu De 4', N'Cach Dung 4', N'Cau Truc 4', N'Vi Du 4', N'Bo Sung 4', N'Luu Y 4', 5)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (20, N'Tieu De 4', N'Cach Dung 4', N'Cau Truc 4', N'Vi Du 4', N'Bo Sung 4', N'Luu Y 4', 5)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (21, N'Tieu De 4', N'Cach Dung 4', N'Cau Truc 4', N'Vi Du 4', N'Bo Sung 4', N'Luu Y 4', 5)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (22, N'Tieu De 4', N'Cach Dung 4', N'Cau Truc 4', N'Vi Du 4', N'Bo Sung 4', N'Luu Y 4', 5)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (23, N'Tieu De 5', N'Cach Dung 5', N'Cau Truc 5', N'Vi Du 5', N'Bo Sung 5', N'Luu Y 5', 6)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (24, N'Tieu De 5', N'Cach Dung 5', N'Cau Truc 5', N'Vi Du 5', N'Bo Sung 5', N'Luu Y 5', 6)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (25, N'Tieu De 5', N'Cach Dung 5', N'Cau Truc 5', N'Vi Du 5', N'Bo Sung 5', N'Luu Y 5', 6)
INSERT [dbo].[NguPhap] ([IDNguPhap], [TieuDe], [CachDung], [CauTruc], [ViDu], [BoSung], [LuuY], [IDChuDeNguPhap]) VALUES (26, N'Tieu De 5', N'Cach Dung 5', N'Cau Truc 5', N'Vi Du 5', N'Bo Sung 5', N'Luu Y 5', 6)
SET IDENTITY_INSERT [dbo].[NguPhap] OFF
GO
SET IDENTITY_INSERT [dbo].[ChuDeTuVung] ON 

INSERT [dbo].[ChuDeTuVung] ([IDChuDeTuVung], [ChuDe], [STT], [IDQTV]) VALUES (1, N'Chu De 1', 1, 1)
INSERT [dbo].[ChuDeTuVung] ([IDChuDeTuVung], [ChuDe], [STT], [IDQTV]) VALUES (2, N'Chu De 2', 1, 1)
INSERT [dbo].[ChuDeTuVung] ([IDChuDeTuVung], [ChuDe], [STT], [IDQTV]) VALUES (3, N'Chu De 3', 1, 1)
INSERT [dbo].[ChuDeTuVung] ([IDChuDeTuVung], [ChuDe], [STT], [IDQTV]) VALUES (4, N'Chu De 4', 1, 1)
INSERT [dbo].[ChuDeTuVung] ([IDChuDeTuVung], [ChuDe], [STT], [IDQTV]) VALUES (5, N'Chu De 5', 1, 1)
SET IDENTITY_INSERT [dbo].[ChuDeTuVung] OFF
GO
SET IDENTITY_INSERT [dbo].[TuVung] ON 

INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (1, N'Tu 1', N'Phat Am 1', N'Loai 1                                                                                                                                                                                                                                                         ', N'Nghia 1', N'Vi Du 1', 1)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (2, N'Tu 2', N'Phat Am 2', N'Loai 2                                                                                                                                                                                                                                                         ', N'Nghia 2', N'Vi Du 2', 2)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (3, N'Tu 3', N'Phat Am 3', N'Loai 3                                                                                                                                                                                                                                                         ', N'Nghia 3', N'Vi Du 3', 3)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (4, N'Tu 4', N'Phat Am 4', N'Loai 4                                                                                                                                                                                                                                                         ', N'Nghia 4', N'Vi Du 4', 4)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (5, N'Tu 5', N'Phat Am 5', N'Loai 5                                                                                                                                                                                                                                                         ', N'Nghia 5', N'Vi Du 5', 5)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (6, N'Tu 1', N'Phat Am 1', N'Loai 1                                                                                                                                                                                                                                                         ', N'Nghia 1', N'Vi Du 1', 1)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (7, N'Tu 1', N'Phat Am 1', N'Loai 1                                                                                                                                                                                                                                                         ', N'Nghia 1', N'Vi Du 1', 1)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (8, N'Tu 1', N'Phat Am 1', N'Loai 1                                                                                                                                                                                                                                                         ', N'Nghia 1', N'Vi Du 1', 1)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (9, N'Tu 1', N'Phat Am 1', N'Loai 1                                                                                                                                                                                                                                                         ', N'Nghia 1', N'Vi Du 1', 1)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (10, N'Tu 2', N'Phat Am 2', N'Loai 2                                                                                                                                                                                                                                                         ', N'Nghia 2', N'Vi Du 2', 2)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (11, N'Tu 2', N'Phat Am 2', N'Loai 2                                                                                                                                                                                                                                                         ', N'Nghia 2', N'Vi Du 2', 2)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (12, N'Tu 2', N'Phat Am 2', N'Loai 2                                                                                                                                                                                                                                                         ', N'Nghia 2', N'Vi Du 2', 2)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (13, N'Tu 2', N'Phat Am 2', N'Loai 2                                                                                                                                                                                                                                                         ', N'Nghia 2', N'Vi Du 2', 2)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (14, N'Tu 3', N'Phat Am 3', N'Loai 3                                                                                                                                                                                                                                                         ', N'Nghia 3', N'Vi Du 3', 3)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (15, N'Tu 3', N'Phat Am 3', N'Loai 3                                                                                                                                                                                                                                                         ', N'Nghia 3', N'Vi Du 3', 3)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (16, N'Tu 3', N'Phat Am 3', N'Loai 3                                                                                                                                                                                                                                                         ', N'Nghia 3', N'Vi Du 3', 3)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (17, N'Tu 3', N'Phat Am 3', N'Loai 3                                                                                                                                                                                                                                                         ', N'Nghia 3', N'Vi Du 3', 3)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (18, N'Tu 4', N'Phat Am 4', N'Loai 4                                                                                                                                                                                                                                                         ', N'Nghia 4', N'Vi Du 4', 4)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (19, N'Tu 4', N'Phat Am 4', N'Loai 4                                                                                                                                                                                                                                                         ', N'Nghia 4', N'Vi Du 4', 4)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (20, N'Tu 4', N'Phat Am 4', N'Loai 4                                                                                                                                                                                                                                                         ', N'Nghia 4', N'Vi Du 4', 4)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (21, N'Tu 4', N'Phat Am 4', N'Loai 4                                                                                                                                                                                                                                                         ', N'Nghia 4', N'Vi Du 4', 4)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (22, N'Tu 5', N'Phat Am 5', N'Loai 5                                                                                                                                                                                                                                                         ', N'Nghia 5', N'Vi Du 5', 5)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (23, N'Tu 5', N'Phat Am 5', N'Loai 5                                                                                                                                                                                                                                                         ', N'Nghia 5', N'Vi Du 5', 5)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (24, N'Tu 5', N'Phat Am 5', N'Loai 5                                                                                                                                                                                                                                                         ', N'Nghia 5', N'Vi Du 5', 5)
INSERT [dbo].[TuVung] ([IDTuVung], [TuVung], [PhatAm], [LoaiTu], [NghiaTuVung], [ViDuTuVung], [IDChuDeTuVung]) VALUES (25, N'Tu 5', N'Phat Am 5', N'Loai 5                                                                                                                                                                                                                                                         ', N'Nghia 5', N'Vi Du 5', 5)
SET IDENTITY_INSERT [dbo].[TuVung] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([IDBlog], [TieuDe], [NoiDungBlog], [Anh], [IDQTV]) VALUES (1, N'Học Tiếng Anh Hiệu Quả', N'aaaaaaaaaaaaaaaa', N'businesswoman-using-tablet-analysis.jpg', 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
