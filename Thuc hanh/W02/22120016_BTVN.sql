CREATE DATABASE QLDeTai;

USE QLDeTai;

CREATE TABLE GIAOVIEN (
    MAGV CHAR(3) NOT NULL,
    HOTEN NVARCHAR(50) NOT NULL,
    LUONG FLOAT NOT NULL,
    PHAI NCHAR(3) NOT NULL CHECK (PHAI IN ('Nam',N'Nữ')),
    NGSINH DATE NOT NULL,
    DIACHI NVARCHAR(100) NOT NULL,
    GVQLCM CHAR(3),
    MABM NCHAR(5),

    PRIMARY KEY (MAGV)
);

CREATE TABLE GV_DT (
    MAGV CHAR(3) NOT NULL,
    DIENTHOAI CHAR(10) NOT NULL,

    PRIMARY KEY (MAGV, DIENTHOAI)
);

CREATE TABLE BOMON (
    MABM NCHAR(5) NOT NULL,
    TENBM NVARCHAR(50) NOT NULL UNIQUE,
    PHONG CHAR(3) NOT NULL UNIQUE,
    DIENTHOAI CHAR(10) NOT NULL UNIQUE,
    TRUONGBM CHAR(3),
    MAKHOA CHAR(5) NOT NULL,
    NGAYNHANCHUC DATE,

    PRIMARY KEY (MABM)
);

CREATE TABLE KHOA (
    MAKHOA CHAR(5) NOT NULL,
    TENKHOA NVARCHAR(50) NOT NULL UNIQUE,
    NAMTL INT NOT NULL,
    PHONG CHAR(3) NOT NULL UNIQUE,
    DIENTHOAI CHAR(10) NOT NULL UNIQUE,
    TRUONGKHOA CHAR(3) NOT NULL,
    NGAYNHANCHUC DATE NOT NULL,

    PRIMARY KEY (MAKHOA)
);

CREATE TABLE DETAI (
    MADT CHAR(3) NOT NULL,
    TENDT NVARCHAR(100) NOT NULL,
    CAPQL NVARCHAR(25) NOT NULL,
    KINHPHI FLOAT NOT NULL,
    NGAYBD DATE NOT NULL,
    NGAYKT DATE NOT NULL,
    MACD NCHAR(4) NOT NULL,
    GVCNDT CHAR(3),

    PRIMARY KEY (MADT)
);

CREATE TABLE CHUDE (
    MACD NCHAR(4) NOT NULL,
    TENCD NVARCHAR(50),

    PRIMARY KEY (MACD)
);

CREATE TABLE CONGVIEC (
    MADT CHAR(3) NOT NULL,
    STT INT NOT NULL,
    TENCV NVARCHAR(50) NOT NULL,
    NGAYBD DATE NOT NULL,
    NGAYKT DATE NOT NULL,

    PRIMARY KEY (MADT, STT)
);

CREATE TABLE THAMGIADT (
    MAGV CHAR(3) NOT NULL,
    MADT CHAR(3) NOT NULL,
    STT INT NOT NULL,
    PHUCAP FLOAT NOT NULL,
    KETQUA NCHAR(5) CHECK(KETQUA IN (N'Đạt')),

    PRIMARY KEY (MAGV, MADT, STT)
);

CREATE TABLE NGUOI_THAN (
    MAGV CHAR(3) NOT NULL,
    TEN NVARCHAR(10) NOT NULL,
    NGSINH DATE NOT NULL,
    PHAI NCHAR(3),

    PRIMARY KEY (MAGV, TEN)
);

ALTER TABLE THAMGIADT
ADD CONSTRAINT FK_CONGVIECTHAMGIA
FOREIGN KEY (MADT, STT) REFERENCES CONGVIEC(MADT, STT);

ALTER TABLE THAMGIADT
ADD CONSTRAINT FK_GIAOVIENTHAMGIA
FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);

ALTER TABLE CONGVIEC
ADD CONSTRAINT FK_DETAICONGVIEC
FOREIGN KEY (MADT) REFERENCES DETAI(MADT);

ALTER TABLE DETAI
ADD CONSTRAINT FK_CHUDEDETAI
FOREIGN KEY (MACD) REFERENCES CHUDE(MACD);

ALTER TABLE KHOA
ADD CONSTRAINT FK_TRUONGKHOA
FOREIGN KEY (TRUONGKHOA) REFERENCES GIAOVIEN(MAGV);

ALTER TABLE BOMON
ADD CONSTRAINT FK_MAKHOA
FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA);

ALTER TABLE BOMON
ADD CONSTRAINT FK_TRUONGBM
FOREIGN KEY (TRUONGBM) REFERENCES GIAOVIEN(MAGV);

ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_GVQLCM
FOREIGN KEY (GVQLCM) REFERENCES GIAOVIEN(MAGV);

ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_BOMON
FOREIGN KEY (MABM) REFERENCES BOMON(MABM);

ALTER TABLE NGUOI_THAN
ADD CONSTRAINT FK_NGUOITHANGIAOVIEN
FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);

ALTER TABLE GV_DT
ADD CONSTRAINT FK_GIAOVIENDT
FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);

INSERT INTO GIAOVIEN VALUES ('001', N'Nguyễn Hoài An', 2000.0, 'Nam', '02/15/1973', N'25/3 Lạc Long Quân, Q.10, TP HCM', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('002', N'Trần Trà Hương', 2500.0, N'Nữ', '06/20/1960', N'125 Trần Hưng Đạo, Q.1, TP HCM', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('003', N'Nguyễn Ngọc Ánh', 2200.0, N'Nữ', '05/11/1975', N'12/21 Võ Văn Ngân Thủ Đức, TP HCM', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('004', N'Trương Nam Sơn', 2300.0, 'Nam', '06/20/1959', N'215 Lý Thường Kiệt, TP Biên Hòa', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('005', N'Lý Hoàng Hà', 2500.0, 'Nam', '10/23/1954', N'22/5 Nguyễn Xí, Q. Bình Thạnh, TP HCM', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('006', N'Trần Bạch Tuyết', 1500.0, N'Nữ', '05/20/1980', N'127 Hùng Vương, TP Mỹ Tho', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('007', N'Nguyễn An Trung', 2100.0, 'Nam', '06/05/1976', N'234, 3/2, TP Biên Hòa', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('008', N'Trần Trung Hiếu', 1800.0, 'Nam', '08/06/19777', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('009', N'Trần Hoàng Nam', 2000.0, 'Nam', '11/22/1975', N'234 Trấn Não, An Phú, TP HCM', NULL, NULL);
INSERT INTO GIAOVIEN VALUES ('010', N'Phạm Nam Thanh', 1500.0, 'Nam', '12/12/1980', N'221 Hùng Vương, Q.5, TP HCM', NULL, NULL);

INSERT INTO CHUDE VALUES ('NCPT', N'Nghiên cứu phát triển');
INSERT INTO CHUDE VALUES ('QLGD', N'Quản lý giáo dục');
INSERT INTO CHUDE VALUES ('UDCN', N'Ứng dụng công nghệ');

INSERT INTO DETAI VALUES ('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20.0, '10/20/2007', '10/20/2008', 'QLGD', '002');
INSERT INTO DETAI VALUES ('002', N'HTTT quản lý giáo vụ cho một Khoa', N'Trường', 20.0, '10/12/2000', '10/12/2001', 'QLGD', '002');
INSERT INTO DETAI VALUES ('003', N'Nghiên cứu chế tạo sợi Nanô Platin', N'ĐHQG', 300.0, '05/15/2008', '05/15/2010', 'NCPT', '005');
INSERT INTO DETAI VALUES ('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100.0, '01/01/2007', '12/31/2009', 'NCPT', '004');
INSERT INTO DETAI VALUES ('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '10/10/2003', '12/10/2004', 'UDCN', '007');
INSERT INTO DETAI VALUES ('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '10/20/2006', '10/20/2009', 'NCPT', '004');
INSERT INTO DETAI VALUES ('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20.0, '05/10/2009', '05/10/2010', 'QLGD', '001');

INSERT INTO CONGVIEC VALUES ('001', 1, N'Khởi tạo và lập kế hoạch', '10/20/2007', '12/20/2008');
INSERT INTO CONGVIEC VALUES ('001', 2, N'Xác định yêu cầu', '12/21/2008', '03/21/2008');
INSERT INTO CONGVIEC VALUES ('001', 3, N'Phân tích hệ thống', '03/22/2008', '06/22/2008');
INSERT INTO CONGVIEC VALUES ('001', 4, N'Thiết kế hệ thống', '05/23/2008', '06/23/2008');
INSERT INTO CONGVIEC VALUES ('001', 5, N'Cài đặt thử nghiệm', '06/24/2008', '10/20/2008');
INSERT INTO CONGVIEC VALUES ('002', 1, N'Khởi tạo và lập kế hoạch', '05/10/2009', '07/10/2009');
INSERT INTO CONGVIEC VALUES ('002', 2, N'Xác định yêu cầu', '07/11/2009', '10/11/2009');
INSERT INTO CONGVIEC VALUES ('002', 3, N'Phân tích hệ thống', '10/12/2009', '12/20/2009');
INSERT INTO CONGVIEC VALUES ('002', 4, N'Thiết kế hệ thống', '12/21/2009', '03/22/2010');
INSERT INTO CONGVIEC VALUES ('002', 5, N'Cài đặt thử nghiệm', '03/23/2010', '05/10/2010');
INSERT INTO CONGVIEC VALUES ('006', 1, N'Lấy mẫu', '10/20/2006', '02/20/2007');
INSERT INTO CONGVIEC VALUES ('006', 2, N'Nuôi cấy', '02/21/2007', '08/21/2008');

INSERT INTO THAMGIADT VALUES ('001', '002', 1, 0.0, NULL);
INSERT INTO THAMGIADT VALUES ('001', '002', 2, 2.0, NULL);
INSERT INTO THAMGIADT VALUES ('002', '001', 4, 2.0, N'Đạt');
INSERT INTO THAMGIADT VALUES ('003', '001', 1, 1.0, N'Đạt');
INSERT INTO THAMGIADT VALUES ('003', '001', 2, 0.0, N'Đạt');
INSERT INTO THAMGIADT VALUES ('003', '001', 4, 1.0, N'Đạt');
INSERT INTO THAMGIADT VALUES ('003', '002', 2, 0.0, NULL);
INSERT INTO THAMGIADT VALUES ('004', '006', 1, 0.0, N'Đạt');
INSERT INTO THAMGIADT VALUES ('004', '007', 2, 1.0, N'Đạt');
INSERT INTO THAMGIADT VALUES ('006', '006', 2, 1.5, N'Đạt');
INSERT INTO THAMGIADT VALUES ('009', '003', 2, 0.5, NULL);
INSERT INTO THAMGIADT VALUES ('009', '002', 4, 1.5, NULL);

INSERT INTO NGUOI_THAN VALUES ('001', N'Hùng', '01/14/1990', 'Nam');
INSERT INTO NGUOI_THAN VALUES ('001', N'Thủy', '12/08/1994', N'Nữ');
INSERT INTO NGUOI_THAN VALUES ('003', N'Hà', '09/03/1998', N'Nữ');
INSERT INTO NGUOI_THAN VALUES ('003', N'Thu', '09/03/1998', N'Nữ');
INSERT INTO NGUOI_THAN VALUES ('007', N'Mai', '03/26/2003', N'Nữ');
INSERT INTO NGUOI_THAN VALUES ('007', N'Vy', '02/14/2000', N'Nữ');
INSERT INTO NGUOI_THAN VALUES ('008', 'Nam', '05/06/1991', 'Nam');
INSERT INTO NGUOI_THAN VALUES ('009', 'An', '08/19/1996', 'Nam');
INSERT INTO NGUOI_THAN VALUES ('010', N'Nguyệt', '01/14/2006', N'Nữ');

INSERT INTO GV_DT VALUES ('001', '0838912112');
INSERT INTO GV_DT VALUES ('001', '0903123123');
INSERT INTO GV_DT VALUES ('002', '0913454545');
INSERT INTO GV_DT VALUES ('003', '0838121212');
INSERT INTO GV_DT VALUES ('003', '0903656565');
INSERT INTO GV_DT VALUES ('003', '0937125125');
INSERT INTO GV_DT VALUES ('006', '0937888888');
INSERT INTO GV_DT VALUES ('008', '0653717171');
INSERT INTO GV_DT VALUES ('008', '0913232323');

INSERT INTO KHOA VALUES ('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '02/20/2005');
INSERT INTO KHOA VALUES ('HH', N'Hóa học', 1980, 'B41', '0838456456', '007', '10/15/2001');
INSERT INTO KHOA VALUES ('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '10/11/2000');
INSERT INTO KHOA VALUES ('VL', N'Vật lý', 1976, 'B21', '0838223223', '005', '09/18/2003');

INSERT INTO BOMON VALUES ('CNTT', N'Công nghệ tri thức', 'B15', '0838126126', NULL, 'CNTT', NULL);
INSERT INTO BOMON VALUES ('HHC', N'Hóa hữu cơ', 'B44', '0838222222', NULL, 'HH', NULL);
INSERT INTO BOMON VALUES ('HL', N'Hóa lý', 'B42', '0838878787', NULL, 'HH', NULL);
INSERT INTO BOMON VALUES ('HPT', N'Hóa phân tích', 'B43', '0838777777', '007', 'HH', '10/15/2007');
INSERT INTO BOMON VALUES ('HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', 'CNTT', '09/20/2004');
INSERT INTO BOMON VALUES ('MMT', N'Mạng máy tính', 'B16', '0838676767', '001', 'CNTT', '05/15/2005');
INSERT INTO BOMON VALUES ('SH', N'Sinh hóa', 'B33', '0838898989', NULL, 'SH', NULL);
INSERT INTO BOMON VALUES (N'VLĐT', N'Vật lý điện tử', 'B23', '0838234234', NULL, 'VL', NULL);
INSERT INTO BOMON VALUES (N'VLƯD', N'Vật lý ứng dụng', 'B24', '0838454545', '005', 'VL', '02/18/2006');
INSERT INTO BOMON VALUES ('VS', 'Vi sinh', 'B32', '0838909090', '004', 'SH', '01/01/2007');

UPDATE GIAOVIEN
SET MABM = 'MMT'
WHERE MAGV = '001';

UPDATE GIAOVIEN
SET MABM = 'HTTT'
WHERE MAGV = '002';

UPDATE GIAOVIEN
SET GVQLCM = '002', MABM = 'HTTT'
WHERE MAGV = '003';

UPDATE GIAOVIEN
SET MABM = 'VS'
WHERE MAGV = '004';

UPDATE GIAOVIEN
SET MABM = N'VLĐT'
WHERE MAGV = '005';

UPDATE GIAOVIEN
SET GVQLCM = '004', MABM = 'VS'
WHERE MAGV = '006';

UPDATE GIAOVIEN
SET MABM = 'HPT'
WHERE MAGV = '007';

UPDATE GIAOVIEN
SET GVQLCM = '007', MABM = 'HPT'
WHERE MAGV = '008';

UPDATE GIAOVIEN
SET GVQLCM = '001', MABM = 'MMT'
WHERE MAGV = '009';

UPDATE GIAOVIEN
SET GVQLCM = '007', MABM = 'HPT'
WHERE MAGV = '010';