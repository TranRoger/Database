--TUAN 3--

--Q1--
SELECT  GV.HOTEN AS N'Họ tên', 
        GV.LUONG AS N'Lương'
FROM GIAOVIEN GV
WHERE GV.PHAI = N'Nữ';

--Q2--
SELECT  GV.HOTEN AS N'Họ tên',
        GV.LUONG AS N'Lương trước khi tăng',
        GV.LUONG * 1.1 AS N'Lương sau khi tăng'
FROM GIAOVIEN GV;

--Q3--
SELECT GV.MAGV AS N'Mã giáo viên'
FROM GIAOVIEN GV
WHERE (GV.HOTEN LIKE N'Nguyễn%' AND GV.LUONG > 2000) 
UNION
SELECT BM.TRUONGBM
FROM BOMON BM
WHERE (DATEDIFF(YYYY, BM.NGAYNHANCHUC, '1995') < 0);

--Q4--
SELECT GV.HOTEN N'Họ tên'
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM
WHERE BM.MAKHOA = 'CNTT';

--Q5--
SELECT  BM.MABM N'Mã bộ môn',
        BM.TENBM N'Tên bộ môn',
        BM.PHONG N'Phòng',
        BM.DIENTHOAI N'Điện thoại',
        BM.TRUONGBM N'Trưởng bộ môn',
        GV.HOTEN N'Họ tên trưởng bộ môn',
        GV.PHAI N'Giới tính',
        GV.NGSINH N'Ngày sinh',
        BM.NGAYNHANCHUC N'Ngày nhận chức',
        GV.DIACHI N'Địa chỉ'
FROM BOMON BM JOIN GIAOVIEN GV ON BM.TRUONGBM = GV.MAGV;

--Q6--
SELECT  GV.MAGV N'Mã giáo viên',
        GV.HOTEN N'Họ tên',
        GV.PHAI N'Giới tính',
        GV.NGSINH N'Ngày sinh',
        GV.DIACHI N'Địa chỉ',
        GV.LUONG N'Lương',
        GV.MABM N'Mã bộ môn',
        BM.TENBM N'Tên bộ môn',
        BM.PHONG N'Phòng',
        BM.DIENTHOAI N'Điện thoại bộ môn',
        BM.MAKHOA N'Mã khoa',
        GV.GVQLCM
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM;

--Q7--
SELECT  DT.MADT N'Mã đề tài',
        DT.TENDT N'Tên đề tài',
        DT.CAPQL N'Cấp quản lý',
        DT.KINHPHI N'Kinh phí',
        DT.NGAYBD N'Ngày bắt đầu',
        DT.NGAYKT N'Ngày kết thúc',
        DT.MACD N'Mã chủ đề',
        DT.GVCNDT,
        GV.HOTEN N'Họ tên giáo viên',
        GV.PHAI N'Giới tính',
        GV.NGSINH N'Ngày sinh',
        GV.DIACHI N'Địa chỉ'
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV;

--Q8--
SELECT  K.MAKHOA N'Mã khoa',
        K.TENKHOA N'Tên khoa',
        K.NAMTL N'Năm thành lập',
        K.PHONG N'Phòng',
        K.DIENTHOAI N'Điện thoại',
        K.TRUONGKHOA N'Trưởng khoa',
        GV.HOTEN N'Họ tên trưởng khoa',
        GV.PHAI N'Giới tính',
        GV.NGSINH N'Ngày sinh',
        K.NGAYNHANCHUC N'Ngày nhận chức',
        GV.DIACHI N'Địa chỉ'
FROM KHOA K JOIN GIAOVIEN GV ON K.TRUONGKHOA = GV.MAGV;

--Q9--
SELECT  GV.MAGV N'Mã giáo viên',
        GV.HOTEN N'Họ tên',
        GV.PHAI N'Giới tính',
        GV.NGSINH N'Ngày sinh',
        GV.DIACHI N'Địa chỉ'
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV
WHERE DT.MADT = '006' AND GV.MABM = 'VS';

--Q10--
SELECT  DT.MADT N'Mã đề tài',
        DT.MACD N'Mã chủ đề',
        GV.HOTEN N'Họ tên GVCN',
        GV.NGSINH N'Ngày sinh',
        GV.DIACHI N'Địa chỉ'
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV
WHERE DT.CAPQL = N'Thành phố';

--Q11--
SELECT  GV.HOTEN N'Họ tên giáo viên',
        GVPT.HOTEN N'Họ tên người phụ trách'
FROM GIAOVIEN GV    JOIN BOMON BM ON GV.MABM = BM.MABM
                    JOIN GIAOVIEN GVPT ON BM.TRUONGBM = GVPT.MAGV
WHERE GV.MAGV != GVPT.MAGV;

--Q12--
SELECT  GV.HOTEN N'Họ tên giáo viên'
FROM GIAOVIEN GV JOIN GIAOVIEN GVQLCM ON GV.GVQLCM = GVQLCM.MAGV
WHERE GVQLCM.HOTEN = N'Nguyễn Thanh Tùng';

--Q13--
SELECT  GV.HOTEN N'Họ tên trưởng bộ môn'
FROM GIAOVIEN GV JOIN BOMON BM ON BM.TRUONGBM = GV.MAGV
WHERE BM.TENBM = N'Hệ thống thông tin';

--Q14--
SELECT DISTINCT GV.HOTEN N'Họ tên chủ nhiệm đề tài'
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV
WHERE DT.MACD = 'QLGD';

--Q15--
SELECT  DT.TENDT N'Tên đề tài'
FROM DETAI DT
WHERE MONTH(DT.NGAYBD) = 3 AND YEAR(NGAYBD) = 2008;

--Q16--
SELECT  GV.HOTEN N'Họ tên giáo viên',
        GVQLCM.HOTEN N'Họ tên người quản lý chuyên môn'
FROM GIAOVIEN GV JOIN GIAOVIEN GVQLCM ON GV.GVQLCM = GVQLCM.MAGV;