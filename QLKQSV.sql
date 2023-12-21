CREATE DATABASE QLKQSV
GO 
USE QLKQSV
GO


CREATE TABLE GIANGVIEN
(
	MAGV VARCHAR(10),
	HOTEN NVARCHAR(50) NOT NULL,
	SDT VARCHAR(10) NOT NULL,

	PRIMARY KEY(MAGV)
)

CREATE TABLE KHOA
(
	MAKHOA VARCHAR(10),
	TENKHOA NVARCHAR(50) NOT NULL,
	NAMTL INT NOT NULL,
	PHONG VARCHAR(30) NOT NULL,
	SDT VARCHAR(10) NOT NULL,
	MATRUONGKHOA VARCHAR(10),

	PRIMARY KEY (MAKHOA)
)

CREATE TABLE LAMVIEC
(
	MAGV VARCHAR(10),
	MAKHOA VARCHAR(10),

	PRIMARY KEY(MAGV, MAKHOA)
)

CREATE TABLE CHUYENNGANH
(
	MACN VARCHAR(10),
	TENCN NVARCHAR(50) NOT NULL,
	MAKHOA VARCHAR(10),
	MAQL VARCHAR(10),

	PRIMARY KEY(MACN)
)

CREATE TABLE MONTHI
(
	MAMT VARCHAR(10),
	TENMT NVARCHAR(50) NOT NULL,

	PRIMARY KEY(MAMT)
)

CREATE TABLE MON_CHUYENNGANH
(
	MAMT VARCHAR(10),
	MACN VARCHAR(10),

	PRIMARY KEY(MAMT, MACN)
)

CREATE TABLE LOP
(
	MALOP VARCHAR(10),
	SISO INT NOT NULL,
	MACN VARCHAR(10),

	PRIMARY KEY(MALOP)
)


CREATE TABLE SINHVIEN
(
	MSSV VARCHAR(10),
	HOTEN NVARCHAR(50) NOT NULL,
	SONHA NVARCHAR(50),
	DUONG NVARCHAR(50),
	QUAN NVARCHAR(50),
	TP NVARCHAR(50),
	NGAYSINH DATE NOT NULL,
	GIOITINH NVARCHAR(3) NOT NULL,
	MALOP VARCHAR(10),

	PRIMARY KEY(MSSV),
)


CREATE TABLE SINHVIEN_SDT
(
	SDT VARCHAR(10) NOT NULL,
	MSSV VARCHAR(10)
) 

CREATE TABLE THI
(
	MSSV VARCHAR(10),
	MAMT VARCHAR(10),
	DIEM FLOAT NOT NULL,
	GHICHU NVARCHAR(255),

	PRIMARY KEY(MSSV, MAMT)
)

ALTER TABLE KHOA
ADD CONSTRAINT FK_KHOA_GIANGVIEN
FOREIGN KEY (MATRUONGKHOA)
REFERENCES GIANGVIEN (MAGV)

ALTER TABLE LAMVIEC
ADD CONSTRAINT FK_LAMVIEC_GIANGVIEN
FOREIGN KEY (MAGV)
REFERENCES GIANGVIEN (MAGV)

ALTER TABLE LAMVIEC
ADD CONSTRAINT FK_LAMVIEC_KHOA
FOREIGN KEY (MAKHOA)
REFERENCES KHOA (MAKHOA)

ALTER TABLE CHUYENNGANH
ADD CONSTRAINT FK_CHUYENNGANH_KHOA
FOREIGN KEY (MAKHOA)
REFERENCES KHOA (MAKHOA)

ALTER TABLE CHUYENNGANH
ADD CONSTRAINT FK_CHUYENNGANH_GIANGVIEN
FOREIGN KEY (MAQL)
REFERENCES GIANGVIEN (MAGV)

ALTER TABLE MON_CHUYENNGANH
ADD CONSTRAINT FK_MCN_MONTHI
FOREIGN KEY (MAMT)
REFERENCES MONTHI (MAMT)

ALTER TABLE MON_CHUYENNGANH
ADD CONSTRAINT FK_MCN_CHUYENNGANH
FOREIGN KEY (MACN)
REFERENCES CHUYENNGANH (MACN)

ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_CHUYENNGANH
FOREIGN KEY (MACN)
REFERENCES CHUYENNGANH (MACN)

ALTER TABLE SINHVIEN
ADD CONSTRAINT FK_SINHVIEN_LOP
FOREIGN KEY (MALOP)
REFERENCES LOP (MALOP)

ALTER TABLE SINHVIEN_SDT
ADD CONSTRAINT FK_SINHVIEN_SDT
FOREIGN KEY (MSSV)
REFERENCES SINHVIEN (MSSV)

ALTER TABLE THI
ADD CONSTRAINT FK_THI_SINHVIEN
FOREIGN KEY (MSSV)
REFERENCES SINHVIEN (MSSV)

ALTER TABLE THI
ADD CONSTRAINT FK_THI_MONTHI
FOREIGN KEY (MAMT)
REFERENCES MONTHI (MAMT)

/*NHẬP LIỆU CHO BẢNG GIẢNG VIÊN*/
INSERT INTO GIANGVIEN (MAGV, HOTEN, SDT)
VALUES
    ('GV1001', N'Nguyễn Văn Thu', '0987654321'),
    ('GV1002', N'Trần Thị Bo', '0123456789'),
    ('GV1003', N'Lê Minh Cường', '0909123456'),
    ('GV1004', N'Phạm Quang Danh', '0987651234'),
    ('GV1005', N'Hoàng Thị Lan', '0918234567'),
    ('GV1006', N'Đỗ Văn Mạc', '0954321890'),
    ('GV1007', N'Nguyễn Thị Trang', '0876543210'),
    ('GV1008', N'Bùi Văn Huy', '0967890123'),
    ('GV1009', N'Trần Văn Kiên', '0912345678'),
    ('GV1010', N'Lê Thị Hoa', '0987654321'),
    ('GV1011', N'Lý Lan Huê', '0324156875'),
    ('GV1012', N'Trần Ngọc Minh', '0874512698'),
    ('GV1013', N'Lý Quốc Tuấn', '0854231654'),
    ('GV1014', N'Nguyễn Ngọc Trung', '0986325415')


/*NHẬP DỮ LIỆU CHO BẢNG KHOA*/
INSERT INTO KHOA(MAKHOA, TENKHOA, NAMTL, PHONG, SDT, MATRUONGKHOA)
VALUES 
	('CNTT', N'Khoa Công Nghệ Thông Tin', 1990, N'Phòng A1', '0987654321', 'GV1001'),
    ('KT', N'Khoa Kinh Tế', 2015, N'Phòng B2', '0123456789', 'GV1002'),
    ('NN', N'Khoa Ngoại Ngữ', 1978, N'Phòng C3', '0909123456', 'GV1003')

/*NHẬP DỮ LIỆU CHO BẢNG LAMVIEC*/
INSERT INTO LAMVIEC(MAGV, MAKHOA)
VALUES
	('GV1001', 'CNTT'),
    ('GV1002', 'NN'),
    ('GV1003', 'KT'),
    ('GV1004', 'CNTT'),
    ('GV1005', 'KT'),
    ('GV1006', 'CNTT'),
    ('GV1007', 'KT'),
    ('GV1008', 'CNTT'),
    ('GV1009', 'CNTT'),
    ('GV1012', 'NN'),
    ('GV1013', 'CNTT'),
    ('GV1014', 'CNTT');

/*NHẬP DỮ LIỆU CHO BẢNG CHUYENNGANH*/
INSERT INTO CHUYENNGANH (MACN, TENCN, MAKHOA, MAQL)
VALUES 
	('KPDL',N'Khai Phá Dữ Liệu','CNTT','GV1008'),
	('KTPM',N'Kỹ Thuật Phần Mềm','CNTT','GV1006'),
	
	('ATTT', N'An Toàn Thông Tin', 'CNTT', 'GV1014'),
    ('HTTT', N'Hệ Thống Thông Tin', 'CNTT', 'GV1013'),
    ('TKNT', N'Thiết Kế Nội Thất', 'CNTT', 'GV1009'),
    ('NNN', N'Ngôn Ngữ Nhật', 'NN', 'GV1002'),
    ('NNA', N'Ngôn Ngữ Anh', 'NN', 'GV1012'),
    ('QTKD', N'Quản Trị Kinh Doanh', 'KT', 'GV1007')

/*NHẬP DỮ LIỆU CHO BẢNG MONTHI*/
INSERT INTO MONTHI(MAMT, TENMT)
VALUES 
	('TCC', N'Toán Cao Cấp'),
    ('TRR', N'Toán Rời Rạc'),
    ('AV', N'Anh Văn'),
	('TN',N'Tiếng Nhật'),
    ('KTCT', N'Kinh Tế Chính Trị'),
    ('KHXH', N'Khoa Học Xã Hội'),
    ('CDS', N'Công Dân Số'),
    ('NNH', N'Ngôn Ngữ Học'),
    ('XHH', N'Xã Hội Học'),
    ('KTH', N'Kinh Tế Học'),
    ('NTDH', N'Nghệ Thuật Đồ Hoạ'),
    ('QLNS', N'Quản Lý Nhân Sự'),
    ('QTDA', N'Quản Trị Dự Án'),
	('CSDL', N'Cơ sở dữ liệu');

/*MÔN CHUYÊN NGÀNH*/
INSERT INTO MON_CHUYENNGANH(MAMT, MACN)
VALUES 
	('TCC', 'ATTT'),
	('CSDL', 'ATTT'),
	('QTDA', 'ATTT'),
	('CDS', 'ATTT'),

	('TCC', 'KPDL'),
	('QTDA', 'KPDL'),
    ('CSDL', 'KPDL'),
    ('CDS', 'KPDL'),

	('TRR', 'KTPM'),
	('QTDA', 'KTPM'),
    ('CSDL', 'KTPM'),
    ('CDS', 'KTPM'),

	('TRR', 'HTTT'),
	('QTDA', 'HTTT'),
    ('CSDL', 'HTTT'),
    ('CDS', 'HTTT'),

    ('KTCT', 'QTKD'),
    ('KHXH', 'QTKD'),
    ('XHH', 'QTKD'),
    ('KTH', 'QTKD'),
    ('QLNS', 'QTKD'),
	('QTDA','QTKD'),
	('CDS','QTKD'),

	('NNH', 'NNA'),
	('AV','NNA'),
	('CDS','NNA'),

	('NTDH','TKNT'),
    ('QTDA','TKNT'),
	('TCC','TKNT'),
	('TRR','TKNT')
	
/*LOP*/
INSERT INTO LOP(MALOP, SISO, MACN)
VALUES 
	
	('KPDL', 50, 'KPDL'),
    ('KTPM', 40, 'KTPM'),

	('KTPM01', 30, 'HTTT'),
    ('KTPM02', 35, 'HTTT'),

    ('ATTT01', 55, 'ATTT'),
	('ATTT02', 55, 'ATTT'),

	('QTKD01', 40, 'QTKD'),
	('QTKD02', 50, 'QTKD'),

	('NNA01', 55, 'NNA'),
	('NNA02', 65, 'NNA'),

	('TKNT01',40,'TKNT'),
	('TKNT02',50,'TKNT')



/*SINHVIEN*/
INSERT INTO SINHVIEN(MSSV, HOTEN, SONHA, DUONG, QUAN, TP, NGAYSINH, GIOITINH, MALOP)
VALUES
	(N'15005', N'Phạm Ngọc Hân', N'742wx', N'bbb', N'Quận 10', N'TP. Hồ Chí Minh','2003-09-22', N'Nữ', 'KTPM'),
	(N'15010', N'Trần Thị B',N'956',N'kkk',N'Quận Bình Tân',N'TP. Hồ Chí Minh','2001-04-10', N'Nam','KTPM'),
	(N'15015', N'Võ Thị F',N'754',N'ppp',N'Quận Gò Vấp','TP. Hồ Chí Minh','2001-11-28',N'Nữ','KTPM'),
	(N'15020', N'Lý Thị K',N'294',N'jjj',N'Quận Bình Thạnh','TP. Hồ Chí Minh','2000-10-09',N'Nữ','KTPM'),
	(N'15025', N'Trịnh Văn N',N'478',N'rrr',	N'Quận Tân Phú',N'TP. Hồ Chí Minh','2003-12-11',N'Nam','KTPM'),

	(N'15050', N'Nguyễn V', N'890', N'Đường NOP', N'Quận ST', N'TP. Hồ Chí Minh', '2000-05-30', N'Nam', N'KPDL'),
    (N'15045', N'Võ Q', N'654 Đường STU', N'Phường MNO', N'Quận PQR', N'TP. Hồ Chí Minh', '2000-06-28', N'Nữ', N'KPDL'),
	(N'15040', N'Vũ L', N'111',N'Đường XYZ', N'Quận 5', N'TP. Hồ Chí Minh', '2000-12-10',N'Nữ', N'KPDL'),
    (N'15035', N'Võ F', N'123',N'Đường VWX',N'Quận Bình Tân', N'TP. Hồ Chí Minh','2001-11-30', N'Nữ', N'KPDL'),
	(N'15030', N'Nguyễn  A', N'12' ,N'Đường ABC', N'Quận 12', N'TP. Hồ Chí Minh', '2000-01-01', N'Nam', N'KPDL'),

	
	(N'15001', N'Nguyễn Văn Xạo',N'12weq', N'aaa', N'Quận 1', N'TP. Hồ Chí Minh','1999-05-15', N'Nam', 'KTPM01'),
    (N'15002', N'Trần Thị Bình', N'25s', N'bbb', N'Quận 2', N'TP. Hồ Chí Minh','2000-03-20', N'Nữ', 'KTPM01'),	
	(N'15003', N'Trần Ngọc Bích', N'874cv', N'bbb', N'Quận 9', N'TP. Hồ Chí Minh','2000-09-20', N'Nữ', 'KTPM01'),
	(N'15004',N'Hoàng Thiếu Lâm', N'52', N'kkk',N'Quận 7',N'TP. Hồ Chí Minh','2000-05-15',N'Nam','KTPM01'),

    
    (N'15006', N'Nguyễn Quỳnh Dung', N'33edf', N'aaa', N'Quận 4', N'TP. Quy Nhơn', '1999-12-05', N'Nữ','KTPM02'),
    (N'15007', N'Nguyễn Thị Kim', N'32niy', N'www', N'Quận 4', N'TP. Hồ Chí Minh', '1999-06-25', N'Nữ','KTPM02'),
    (N'15008', N'Bùi Văn Hoàng', N'39bng', N'hhh', N'Quận 3', N'TP. Hà Nội', '1998-08-12', N'Nam', 'KTPM02'),
	(N'15009', N'Nguyễn Văn A',N'553',N'uuu',N'Quận 6',N'TP. Hồ Chí Minh','2000-12-05',N'Nam','KTPM02'),


    (N'15011', N'Lê Ngọc Lâm', N'14cve', N'vvvv', N'Quận 5', N'TP. Hải Phòng', '2000-01-08', N'Nam', 'ATTT01'),
	(N'15012', N'Lê Văn C',N'291',N'lll',N'Quận Tân Bình','TP. Hồ Chí Minh','2002-08-22',N'Nam','ATTT01'),
	(N'15013', N'Phạm Thị D',N'413',N'qqq',N'Quận Châu Đức','TP. Vũng Tàu','2003-01-15',N'Nữ','ATTT01'),
	(N'15014', N'Hoàng Văn E',N'872',N'bbb',N'Quận 12','TP. Hồ Chí Minh','2000-07-03',N'Nam','ATTT01'),


	(N'15016', N'Lê Minh Cường',N'18mnu', N'Quận Bình Tân', N'Quận 3', N'TP. Hà Nội','1998-07-10', N'Nam','ATTT02'),
	(N'15017', N'Đặng Văn G',N'857',N'ooo',N'Quận 5','TP. Hồ Chí Minh','2002-05-19',N'Nữ','ATTT02'),
	(N'15018', N'Bùi Thị H',N'918',N'iii',N'Quận Tân Bình','TP. Hồ Chí Minh','2003-09-07',N'Nam','ATTT02'),
	(N'15019', N'Ngô Văn I',N'874',N'kkk',N'Quận 3','TP. Hồ Chí Minh','2004-02-14',N'Nữ','ATTT02'),


    (N'15021', N'Hoàng Văn Đức', N'45uir', N'fff', N'Quận 5', N'TP. Hà Nội','2000-02-18', N'Nam','NNA01'),
    (N'15022', N'Đỗ Thị Lan', N'27bvn', N'sss', N'Quận 1', N'TP. Hồ Chí Minh','1998-09-30', N'Nữ','NNA01'),
	(N'15023', N'Đỗ Văn L',N'231',N'uuu',N'Quận Bình Tân',N'TP. Hồ Chí Minh','2001-06-26',N'Nam','NNA01'),
	(N'15024', N'Huỳnh Thị M',N'485',N'yyy',N'Quận Tân Bình',N'TP. Hồ Chí Minh','2002-03-08',N'Nam','NNA01'),


    (N'15026', N'Nguyễn Đức Hải', N'20wqv', N'ggg', N'Quận 2', N'TP. Hồ Chí Minh','1999-11-22', N'Nam', 'NNA02'),
	(N'15027', N'Đinh Thị P','146',N'mmm',N'Quận Gò Vấp',N'TP. Hồ Chí Minh','2000-09-02',N'Nữ',	'NNA02'),
	(N'15028', N'Lương Văn Q','199',N'ccc',N'Quận Phú Nhuận',N'TP. Hồ Chí Minh','2001-04-18',N'Nam','NNA02'),
	(N'15029', N'Mai Thị R','293',N'xxx',N'Quận Bình Chánh',N'TP. Hồ Chí Minh','2004-07-30',N'Nữ','NNA02'),


    (N'15031', N'Trần B', N'34', N'Đường DEF', N'Quận 10', N'TP. Hồ Chí Minh', '2001-05-10', N'Nữ', N'TKNT01'),
    (N'15032', N'Lê C', N'56',N' Đường GHI', N'Quận 1', N'TP. Hồ Chí Minh', '2002-09-15', N'Nam', N'TKNT01'),
    (N'15033', N'Phạm D', N'78',N'Đường JKL', N'Quận 18', N'TP. Hồ Chí Minh', '2003-03-20', N'Nữ', N'TKNT01'),
    (N'15034', N'Huỳnh E', N'90',N'Đường STU', N'Quận Gò Vấp', N'TP. Hồ Chí Minh', '2004-07-05', N'Nam', N'TKNT01'),


    (N'15036', N'Dương G', N'45',N'Đường ZAB',N'Quận Tân Phú', N'TP. Hồ Chí Minh','2000-02-18', N'Nam', N'TKNT02'),
    (N'15037', N'Lý H', N'67', N'Đường CDE',N'Quận Bình Chánh', N'TP. Hồ Chí Minh','2000-08-25', N'Nữ', N'TKNT02'),
    (N'15038', N'Mai I', N'89 ',N'Đường KLM',N'Quận Gò Vấp', N'TP. Hồ Chí Minh', '2002-04-12', N'Nam', N'TKNT02'),
    (N'15039', N'Ngô K', N'101 ',N'Đường NOP',N'Quận 12', N'TP. Hồ Chí Minh', '2001-06-28',N'Nữ', N'TKNT02'),


	(N'15041', N'Phan Thị M', N'123 Đường ABC', N'Phường XYZ', N'Quận ABC', N'TP. Hồ Chí Minh', '2000-04-15', N'Nữ', N'QTKD01'),
    (N'15042', N'Hoàng Thị N', N'456 Đường DEF', N'Phường UVW', N'Quận DEF', N'TP. Hồ Chí Minh', '2000-09-22', N'Nam', N'QTKD01'),
    (N'15043', N'Nguyễn O', N'789 Đường GHI', N'Phường UVW', N'Quận DEF', N'TP. Hồ Chí Minh', '2002-02-18', N'Nữ', N'QTKD01'),
    (N'15044', N'Trần Thị P', N'987 Đường JKL', N'Phường MNO', N'Quận PQR', N'TP. Hồ Chí Minh', '2001-12-05', N'Nam', N'QTKD01'),


    (N'15046', N'Phạm Thị R', N'321', N'Đường VWX', N'Quận WXY', N'TP. Hồ Chí Minh', '2004-11-10', N'Nữ', N'QTKD02'),
    (N'15047', N'Đỗ Thị S', N'876', N'Đường ZAB', N'Quận WXY', N'TP. Hồ Chí Minh', '2002-08-25', N'Nam', N'QTKD02'),
    (N'15048', N'Lê T', N'234', N'Đường CDE', N'Quận HIJ', N'TP. Hồ Chí Minh', '2000-03-20', N'Nữ', N'QTKD02'),
    (N'15049', N'Mai Thị U', N'567', N'Đường KLM', N'Quận HIJ', N'TP. Hồ Chí Minh', '2001-07-12', N'Nữ', N'QTKD02')



/*SINHVIEN_SDT*/
INSERT INTO SINHVIEN_SDT(SDT, MSSV)
VALUES 
('0123456789',	N'15001'),
('0123456798',	N'15002'),
('0123456879',	N'15003'),
('0123456897',	N'15004'),
('0123456978',	N'15005'),
('0123456987',	N'15006'),
('0123457689',	N'15007'),
('0123457698',	N'15008'),
('0123457869',	N'15009'),
('0123457896',	N'15010'),
('0123457968',	N'15011'),
('0123457986',	N'15012'),
('0123458679',	N'15013'),
('0123458697',	N'15014'),
('0123458769',	N'15015'),
('0123458796',	N'15016'),
('0123458967',	N'15017'),
('0123458976',	N'15018'),
('0123459678',	N'15019'),
('0123459687',	N'15020'),
('0123459768',	N'15021'),
('0123459786',	N'15022'),
('0123459867',	N'15023'),
('0123459876',	N'15024'),
('0123465789',	N'15025'),
('0123465798',	N'15026'),
('0123465879',	N'15027'),
('0123465897',	N'15028'),
('0123465978',	N'15029'),
('0123465987',	N'15030'),
('0123467589',	N'15031'),
('0123467598',	N'15032'),
('0123467859',	N'15033'),
('0123467895',	N'15034'),
('0123467958',	N'15035'),
('0123467985',	N'15036'),
('0123468579',	N'15037'),
('0123468597',	N'15038'),
('0123468759',	N'15039'),
('0123468795',	N'15040'),
('0123468957',	N'15041'),
('0123468975',	N'15042'),
('0123469578',	N'15043'),
('0123469587',	N'15044'),
('0123469758',	N'15045'),
('0123469785',	N'15046'),
('0123469857',	N'15047'),
('0123469875',	N'15048'),
('0123475689',	N'15049'),
('0123475698',	N'15050'),
('0123475869',	N'15006'),
('0123475896',	N'15017'),
('0123475968',	N'15012'),
('0123475986',	N'15003'),
('0123476589',	N'15009'),
('0123476598',	N'15002'),
('0123476859',	N'15036'),
('0123476895',	N'15002'),
('0123476958',	N'15022'),
('0123476985',	N'15034'),
('0123478569',	N'15017'),
('0123478596',	N'15020'),
('0123478659',	N'15027'),
('0123478695',	N'15001'),
('0123478956',	N'15042'),
('0123478965',	N'15024'),
('0123479568',	N'15034'),
('0123479586',	N'15041'),
('0123479658',	N'15019'),
('0123479685',	N'15019'),
('0123479856',	N'15032'),
('0123479865',	N'15025'),
('0123564789',	N'15011'),
('0123564798',	N'15018'),
('0123564879',	N'15011')



INSERT INTO THI(MSSV, MAMT, DIEM, GHICHU)
VALUES 

(N'15005',N'TCC',5,N''),
(N'15005',N'CSDL',4,N''),
(N'15005',N'QTDA',7,N''),
(N'15005',N'CDS',3,N''),

(N'15010',N'TCC',8,N''),
(N'15010',N'CSDL',3,N''),
(N'15010',N'QTDA',2,N''),
(N'15010',N'CDS',9,N''),

(N'15015',N'TCC',0,N'Vắng thi'),
(N'15015',N'CSDL',3,N''),
(N'15015',N'QTDA',1,N''),
(N'15015',N'CDS',8,N''),


(N'15020',N'TCC',5,N''),
(N'15020',N'CSDL',3,N''),
(N'15020',N'QTDA',2,N'Vắng thi'),
(N'15020',N'CDS',9,N''),


(N'15025',N'TCC',9,N''),
(N'15025',N'CSDL',9,N''),
(N'15025',N'QTDA',9,N''),
(N'15025',N'CDS',9,N''),

(N'15050',N'TCC',2,N''),
(N'15050',N'CSDL',1,N''),
(N'15050',N'QTDA',4,N''),
(N'15050',N'CDS',5,N''),

(N'15045',N'TCC',6,N''),
(N'15045',N'CSDL',5,N''),
(N'15045',N'QTDA',0,N'Vắng thi'),
(N'15045',N'CDS',4,N''),


(N'15040',N'TCC',9,N''),
(N'15040',N'CSDL',9,N''),
(N'15040',N'QTDA',9,N''),
(N'15040',N'CDS',9,N''),

(N'15035',N'TCC',9,N''),
(N'15035',N'CSDL',9,N''),
(N'15035',N'QTDA',9,N''),
(N'15035',N'CDS',8,N''),


(N'15030',N'TCC',2,N''),
(N'15030',N'CSDL',3,N''),
(N'15030',N'QTDA',6,N''),
(N'15030',N'CDS',0,N'Vắng thi'),



	(N'15001',N'TRR',3 , N'' ),
	(N'15001',N'QTDA',7.4 ,N'' ),
    (N'15001',N'CSDL',6 ,N''),
    (N'15001',N'CDS', 9.2,N''),

	(N'15003',N'TRR',3 , N'' ),
	(N'15003',N'QTDA',0 ,N'Vắng thi' ),

	(N'15007','TRR',5 ,N''),
	(N'15007','QTDA',6 ,N''),


	(N'15012',N'TCC', 8, N''),
	(N'15012',N'TRR', 6.5,N''),
	(N'15012',N'QTDA',4 ,N''),

	(N'15017',N'TCC',6.8 ,N''),
	(N'15017',N'TRR', 9 ,N''),
	(N'15017',N'QTDA', 5 ,N''),
	(N'15017',N'CDS', 0,N'Vắng thi'),


	(N'15019',N'TCC', 0 ,'Vắng thi'),
	(N'15019',N'QTDA', 3.9,'ATTT'),
	(N'15019',N'CDS', 9,'ATTT'),


	(N'15023',N'NNH',8 ,N''),
	(N'15023',N'AV', 6,N''),
	(N'15023',N'CDS', 5.8,N''),



	(N'15027',N'NNH', 9,N''),
	(N'15027',N'AV', 9,N''),
	(N'15027',N'CDS', 9.5,N''),


	(N'15029',N'NNH',4 ,N''),
	(N'15029',N'AV', 6,N''),
	(N'15029',N'CDS', 7.8,N'');




--Cho biết điểm thi các môn của sinh viên có mã số sinh viên là “15001”.
SELECT MSSV ,TENMT AS 'Họ tên', DIEM AS 'Điểm'
FROM THI AS T
JOIN MONTHI AS MT ON MT.MAMT = T.MAMT 
WHERE MSSV='15001'

--Cho biết mã giảng viên, tên của các giảng viên là trưởng khoa hoặc quản lý chuyên ngành.
--Quản lý 
SELECT MAGV,
	   GIANGVIEN.HOTEN AS 'Họ tên',
	   TENCN AS 'Tên chuyên ngành'
FROM GIANGVIEN, CHUYENNGANH 
WHERE CHUYENNGANH.MAQL = GIANGVIEN.MAGV
ORDER BY MAGV
--Trưởng Khoa
SELECT MAGV, GIANGVIEN.HOTEN AS 'Họ tên', TENKHOA AS 'Tên khoa'
FROM GIANGVIEN, KHOA
WHERE KHOA.MATRUONGKHOA = MAGV

--Cho biết mã khoa, tên khoa và tên các giảng viên làm trưởng khoa đó.
SELECT K.MAKHOA, K.TENKHOA AS 'Tên khoa' , GV.HOTEN AS 'Trưởng khoa'
FROM GIANGVIEN  AS GV, KHOA AS K
WHERE K.MATRUONGKHOA = GV.MAGV

--Cho biết mã giảng viên, họ tên và tên khoa của giảng viên đó đang làm việc.
SELECT GIANGVIEN.MAGV,
       GIANGVIEN.HOTEN AS 'Họ tên',
       KHOA.TENKHOA AS 'Tên khoa'
FROM GIANGVIEN, LAMVIEC, KHOA
WHERE GIANGVIEN.MAGV = LAMVIEC.MAGV AND
KHOA.MAKHOA = LAMVIEC.MAKHOA
ORDER BY MAGV

--In ra danh sách các giảng viên không thuộc khoa CNTT
SELECT GV.MAGV, GV.HOTEN AS 'Họ tên',
       TENKHOA AS 'Tên khoa'
FROM LAMVIEC AS L
JOIN KHOA AS K ON L.MAKHOA = K.MAKHOA
JOIN GIANGVIEN AS GV ON L.MAGV = GV.MAGV
WHERE L.MAKHOA NOT LIKE 'CNTT'

--Tìm các sinh viên có họ là “Nguyễn”.
SELECT MSSV, HOTEN AS 'Họ tên'
FROM SINHVIEN
WHERE HOTEN LIKE N'Nguyễn%';

--Tìm các sinh viên có họ là “Nguyễn” và đang học tại khoa CNTT.
SELECT S.MSSV, S.HOTEN AS 'Họ tên',
K.MAKHOA FROM SINHVIEN AS S
JOIN LOP AS L ON S.MALOP = L.MALOP
JOIN CHUYENNGANH AS C ON L.MACN = C.MACN
JOIN KHOA AS K ON K.MAKHOA = C.MAKHOA
WHERE K.MAKHOA = 'CNTT'
AND S.HOTEN LIKE N'Nguyễn%';

--Cho biết sinh viên nào đang sử dụng nhiều hơn một số điện thoại
SELECT V.MSSV, V.HOTEN AS 'Họ tên',
COUNT(S.SDT) AS 'Số số điện thoại'
FROM SINHVIEN_SDT AS S
JOIN SINHVIEN AS V ON S.MSSV = V.MSSV
GROUP BY V.MSSV, V.HOTEN
HAVING COUNT(S.SDT) > 1;


--Cho biết danh sách các sinh viên trong lớp có mã là “KTPM01”.
SELECT MSSV,
       HOTEN AS 'Họ tên',
       MALOP
FROM  SINHVIEN
WHERE MALOP = 'KTPM01'

--Cho biết các sinh viên thuộc chuyên ngành có mã là KTPM.
SELECT MSSV,
       HOTEN AS 'Họ tên',
       CHUYENNGANH.MACN
FROM CHUYENNGANH, SINHVIEN, LOP 
WHERE CHUYENNGANH.MACN ='KTPM'
AND LOP.MACN = CHUYENNGANH.MACN
AND SINHVIEN.MALOP = LOP.MALOP

--Cho biết thông tin các sinh viên nam có địa chỉ tại HCM.
SELECT MSSV, HOTEN  AS 'Họ tên',
       TP AS 'Thành phố',
       GIOITINH AS 'Giới tính'
FROM SINHVIEN
WHERE  TP = N'TP. Hồ Chí Minh'
AND GIOITINH ='Nam'

--Cho biết thông tin các lớp có số lượng sinh viên trên 45.
SELECT MALOP,
       SISO AS 'Sỉ số',
       MACN
FROM LOP
WHERE SISO > 45 

--Cho biết mã lớp, sĩ số lớp. Kết quả trả về sắp xếp sĩ số lớp giảm dần.
SELECT MALOP,
       SISO AS 'Sỉ số'
FROM LOP
ORDER BY SISO DESC;

--Cho biết lớp nào có số lượng sinh viên ít nhất.
SELECT TOP 1 MALOP,
       SISO AS 'Sỉ số'
FROM LOP
ORDER BY SISO ASC;

--Cho biết khoa nào có số lượng sinh viên nhiều nhất.
SELECT TOP 1 K.MAKHOA, K.TENKHOA AS 'Tên khoa',
COUNT(SV.MSSV) AS 'Số lượng sinh viên'FROM KHOA AS K
JOIN CHUYENNGANH AS C ON K.MAKHOA = C.MAKHOA
JOIN LOP AS L ON  L.MACN = C.MACN
JOIN SINHVIEN AS SV ON L.MALOP = SV.MALOP
GROUP BY K.MAKHOA, K.TENKHOA
ORDER BY COUNT(SV.MSSV) DESC;


--Cho biết các sinh viên có điểm tất cả các môn thi đều lớn hơn hoặc bằng 8.
SELECT DISTINCT SV.MSSV,
       SV.HOTEN,
       DIEM
FROM SINHVIEN AS SV
JOIN THI AS T ON SV.MSSV = T.MSSV
WHERE SV.MSSV NOT IN (
		SELECT T.MSSV
		FROM THI AS T
		WHERE T.DIEM < 8);

--Cho biết điểm trung bình môn thi của các sinh viên. 
SELECT MAMT ,AVG(DIEM) AS 'Điểm trung bình' FROM THI AS T
GROUP BY MAMT 


--Ứng với mỗi môn thi, tìm sinh viên có điểm cao nhất và thấp nhất
SELECT MAMT, MSSV, 
       MAX(DIEM) AS Diem_Cao_Nhat, 
       MIN(DIEM) AS Diem_Thap_Nhat
FROM THI
GROUP BY MAMT,MSSV;


--Những môn thi nào mà sinh viên đều bị điểm thi dưới 5..............
SELECT DISTINCT MAMT FROM THI
WHERE NOT EXISTS(SELECT DIEM  FROM THI
WHERE DIEM >= 5)

--Cho biết sinh viên nào có tổng điểm các môn thi là cao nhất
SELECT TOP 1 SV.MSSV, SV.HOTEN,
       SUM(T.DIEM) AS 'Tổng điểm'
FROM SINHVIEN SV
JOIN THI T ON SV.MSSV = T.MSSV
GROUP BY SV.MSSV, SV.HOTEN
ORDER BY SUM(T.DIEM) DESC

--Cho biết có bao nhiêu sinh viên vắng thi.
SELECT COUNT(*) AS 'Số lượng vắng'
FROM THI
WHERE GHICHU =N'Vắng thi'

--Cho biết có bao nhiêu sinh viên có ít nhất 1 bài thi bị điểm 0.
SELECT COUNT(DISTINCT T.MSSV) AS 'Số lượng sinh viên'
FROM THI AS T
WHERE T.DIEM = 0;


--Cho biết những môn thi nào có sinh viên bị 0 điểm.
SELECT DISTINCT MAMT, DIEM
FROM THI
WHERE DIEM = 0

--Cho biết có bao nhiêu sinh viên hoàn tất đầy đủ tất cả các bài thi
SELECT COUNT(DISTINCT T.MSSV) AS 'Số lượng sinh viên hoàn thành'
FROM THI AS T
JOIN SINHVIEN AS SV ON T.MSSV = SV.MSSV
WHERE NOT EXISTS (
    SELECT 1
    FROM THI AS T
    WHERE T.MSSV = SV.MSSV AND T.DIEM = 0
);

--Cho biết thông tin các trưởng khoa nhận chức từ đầu năm 2015 đến hết năm 2018.............................


--Cho biết thông tin các sinh viên có điểm thi tất cả các môn đều lớn hơn hoặc bằng 9.
SELECT DISTINCT SV.MSSV, SV.HOTEN AS 'Họ tên'
FROM SINHVIEN AS SV
WHERE SV.MSSV NOT IN (
    SELECT T.MSSV
    FROM THI AS T
    WHERE T.DIEM < 9
);

--Xuất ra danh sách sinh viên có điểm trung bình > điểm trung bình của tất cả sinh viên thuộc khoa CNTT
SELECT SV.MSSV, SV.HOTEN, AVG(T.DIEM) AS 'Điểm trung bình',
	(SELECT AVG(DIEM)
	FROM SINHVIEN AS SV
	JOIN THI AS T ON T.MSSV = SV.MSSV
	JOIN LOP AS L ON L.MALOP = SV.MALOP
	JOIN CHUYENNGANH AS C ON C.MACN = L.MACN
	JOIN KHOA AS K ON K.MAKHOA = C.MAKHOA
	WHERE C.MAKHOA = 'CNTT' ) AS 'Điểm trung bình khoa CNTT'
FROM SINHVIEN AS SV
JOIN THI AS T ON T.MSSV = SV.MSSV
JOIN LOP AS L ON L.MALOP = SV.MALOP
JOIN CHUYENNGANH AS C ON C.MACN = L.MACN
JOIN KHOA AS K ON K.MAKHOA = C.MAKHOA
WHERE C.MAKHOA = 'CNTT' 
GROUP BY SV.MSSV, SV.HOTEN
HAVING AVG(T.DIEM) > (
	SELECT AVG(T.DIEM)
	FROM SINHVIEN AS SV
	JOIN THI AS T ON T.MSSV = SV.MSSV
	JOIN LOP AS L ON L.MALOP = SV.MALOP
	JOIN CHUYENNGANH AS C ON C.MACN = L.MACN
	JOIN KHOA AS K ON K.MAKHOA = C.MAKHOA
	WHERE C.MAKHOA = 'CNTT' 
)


--Xuất ra thông tin của khoa có nhiều hơn 3 chuyên ngành.
SELECT K.MAKHOA, K.TENKHOA AS 'Tên khoa', COUNT(CN.MACN) AS 'Số chuyên ngành'
FROM KHOA K
JOIN CHUYENNGANH CN ON K.MAKHOA = CN.MAKHOA
GROUP BY K.MAKHOA, K.TENKHOA
HAVING COUNT(CN.MACN) > 3;


--Cho biết danh sách các chuyên ngành và tên của giảng viên quản lý chuyên ngành đó.
SELECT CN.MACN, CN.TENCN AS 'Tên chuyên ngành', GV.HOTEN AS 'Người quản lý'
FROM CHUYENNGANH CN
JOIN GIANGVIEN GV ON CN.MAQL = GV.MAGV;

--Cho biết thông tin các chuyên ngành và tên của người quản lý chuyên ngành, đối với những chuyên ngành chưa biết giảng viên nào làm quản lý thì tại các cột cho biết mã và tên của người quản lý chuyên ngành mang giá trị rỗng (null).
SELECT CN.MACN, CN.TENCN AS 'Tên chuyên ngành', COALESCE(GV.HOTEN, '') AS 'Người quản lý'
FROM CHUYENNGANH CN
LEFT JOIN GIANGVIEN GV ON CN.MAQL = GV.MAGV;


--Cho biết mã số sinh viên, họ tên, điểm của các sinh viên thi môn “Cơ sở dữ liệu”.
SELECT SV.MSSV, SV.HOTEN AS 'Họ tên', T.DIEM AS 'Điểm'
FROM SINHVIEN SV
JOIN THI T ON SV.MSSV = T.MSSV
JOIN MONTHI MT ON T.MAMT = MT.MAMT
WHERE MT.MAMT = 'CSDL';

--Cho biết những sinh viên có điểm trung bình lớn hơn hoặc bằng 5 và điểm thi môn “Cơ sở dữ liệu” lớn hơn 8............
SELECT SV.MSSV, SV.HOTEN, AVG(T.DIEM) AS 'Điểm Trung Bình',
	(SELECT DIEM FROM SINHVIEN SV1
	JOIN THI T ON SV.MSSV = T.MSSV
	JOIN MONTHI MT ON T.MAMT = MT.MAMT
	WHERE MT.MAMT = 'CSDL' AND DIEM > 8 AND SV1.MSSV = SV.MSSV) AS 'Điểm CSDL'
FROM SINHVIEN SV
JOIN THI T ON SV.MSSV = T.MSSV
JOIN MONTHI MT ON T.MAMT = MT.MAMT
WHERE MT.MAMT = 'CSDL' AND T.DIEM > 8
GROUP BY SV.MSSV, SV.HOTEN
HAVING AVG(T.DIEM) >= 5 


--Lập bảng điểm môn “Cơ sở dữ liệu” của tất cả sinh viên khoa CNTT.
SELECT S.MSSV, S.HOTEN AS 'Họ tên', M.TENMT AS 'Tên môn', T.DIEM AS 'Điểm', C.MAKHOA
FROM SINHVIEN AS S
JOIN THI AS T ON S.MSSV = T.MSSV
JOIN MONTHI AS M ON T.MAMT = M.MAMT
JOIN LOP AS L ON S.MALOP = L.MALOP
JOIN CHUYENNGANH AS C ON L.MACN = C.MACN
WHERE C.MAKHOA = 'CNTT' AND M.MAMT = 'CSDL'

--Cho biết điểm thấp nhất, điểm cao nhất và điểm trung bình của bài thi môn “Cơ sở dữ liệu”.
SELECT MIN(T.DIEM) AS 'Điểm thấp nhất', MAX(T.DIEM) AS 'Điểm cao nhất', AVG(T.DIEM) AS 'Điểm trung bình'  FROM THI AS T 
JOIN MONTHI AS M ON T.MAMT = M.MAMT
WHERE M.MAMT = 'CSDL'


--Cho biết những sinh viên nào ở khoa CNTT bị điểm 0 do vắng thi (Mã sinh viên, họ tên).
SELECT K.MAKHOA, K.TENKHOA AS 'Tên khoa', S.MSSV, T.DIEM AS 'Điểm', T.GHICHU AS 'Ghi chú'
FROM SINHVIEN AS S
JOIN LOP AS L ON S.MALOP = L.MALOP
JOIN CHUYENNGANH AS C ON L.MACN = C.MACN 
JOIN KHOA AS K ON C.MAKHOA = K.MAKHOA
JOIN THI AS T ON S.MSSV = T.MSSV
WHERE K.MAKHOA = 'CNTT' AND T.DIEM = 0 AND T.GHICHU = N'Vắng thi'

--Cho biết những lớp có sinh viên vắng thi. Thông tin cần:Mã lớp, số lượng sinh viên vắng.
SELECT S.MALOP, COUNT(T.MSSV) AS 'Số lượng vắng' FROM SINHVIEN AS S
JOIN LOP AS L ON S.MALOP = L.MALOP
JOIN THI AS T ON T.MSSV = S.MSSV
WHERE T.GHICHU = N'Vắng thi'
GROUP BY S.MALOP



--Cho biết số lượng sinh viên của mỗi chuyên ngành.
SELECT L.MACN, C.TENCN, SUM(SISO) AS 'Tổng sinh viên'
FROM LOP AS L
JOIN CHUYENNGANH AS C ON L.MACN = C.MACN
GROUP BY L.MACN, C.TENCN


--Cho biết chuyên ngành nào có nhiều sinh viên theo học nhất.
SELECT TOP 1 L.MACN, C.TENCN 'Tên chuyên ngành', SUM(SISO) AS 'Số lượng sinh viên' FROM LOP AS L
JOIN CHUYENNGANH AS C ON L.MACN = C.MACN
GROUP BY L.MACN, C.TENCN 



--Cho biết các sinh viên thuộc chuyên ngành có mã là KPDL và có điểm tất cả môn thi lớn hơn hoặc bằng 8.......
SELECT S.MSSV, HOTEN, MCN.MACN, T.MAMT, T.DIEM FROM SINHVIEN AS S
JOIN THI AS T ON S.MSSV = T.MSSV
JOIN MON_CHUYENNGANH AS MCN ON T.MAMT = MCN.MAMT
WHERE MCN.MACN = 'KPDL' AND S.MSSV NOT IN (
		SELECT T.MSSV FROM THI AS T2
		WHERE T2.DIEM < 8
);



--Mỗi khoa có bao nhiêu giảng viên (Mã khoa, tên bộ môn, số giảng viên ).
SELECT K.MAKHOA, K.TENKHOA AS 'Tên khoa', COUNT(L.MAGV) AS 'Số giảng viên'   FROM KHOA AS K
JOIN LAMVIEC AS L ON K.MAKHOA = L.MAKHOA
GROUP BY K.MAKHOA, K.TENKHOA


--Cập nhật tăng 0.5 điểm bài thi môn “Cơ sở dữ liệu” cho sinh viên có mã là “15001”.
SELECT MSSV ,TENMT AS 'Họ tên' ,DIEM AS 'Điểm'
FROM THI AS T
JOIN MONTHI AS MT ON MT.MAMT = T.MAMT 
WHERE MSSV='15001' AND MT.MAMT = 'CSDL';

UPDATE THI
SET DIEM = DIEM + 0.5
WHERE MSSV = '15001' AND MAMT = 'CSDL'; 

SELECT MSSV ,TENMT AS 'Họ tên' ,DIEM AS 'Điểm'
FROM THI AS T
JOIN MONTHI AS MT ON MT.MAMT = T.MAMT 
WHERE MSSV='15001' AND MT.MAMT = 'CSDL';
