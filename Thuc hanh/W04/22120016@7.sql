USE QLDeTai
GO

-- Q75: Cho biết họ tên giáo viên và tên bộ môn họ làm trường bộ môn nếu có
SELECT GV.HOTEN, (SELECT TENBM FROM BOMON BM WHERE GV.MAGV = BM.TRUONGBM) AS TENBM_LATRUONGBM
FROM GIAOVIEN GV

-- Hay
SELECT HOTEN, TENBM AS TENBM_LATRUONGBM
FROM GIAOVIEN LEFT JOIN BOMON ON GIAOVIEN.MAGV = BOMON.TRUONGBM


-- Q76. Cho danh sách tên bộ môn và họ tên trưởng bộ môn đó nếu có
SELECT TENBM, (SELECT HOTEN FROM GIAOVIEN GV WHERE BM.TRUONGBM = GV.MAGV) AS HOTEN_TRUONGBM
FROM BOMON BM

-- Hay
SELECT TENBM, HOTEN AS HOTEN_TRUONGBM
FROM BOMON BM LEFT JOIN GIAOVIEN GV ON BM.TRUONGBM = GV.MAGV

-- Q77. Cho danh sách tên giáo viên và các đề tài giáo viên đó chủ nhiệm nếu có
SELECT HOTEN, TENDT
FROM GIAOVIEN GV LEFT JOIN DETAI DT ON GVCNDT = MAGV

-- Q78. Xuất ra thông tin của giáo viên (MAGV, HOTEN) và mức lương của giáo viên. 
--      Mức lương được xếp theo quy tắc: Lương của giáo viên < $1800 : “THẤP” ; Từ $1800 đến $2200: TRUNG BÌNH; Lương > $2200: “CAO"

SELECT MAGV, HOTEN, LUONG, (CASE 
								WHEN LUONG < 1800 THEN N'THẤP'
								WHEN LUONG <= 2200 THEN N'TRUNG BÌNH'
								WHEN LUONG > 2200 THEN N'CAO'
							END
							) AS XEPLOAI_LUONG
FROM GIAOVIEN

-- Q79. Xuất ra thông tin giáo viên (MAGV, HOTEN) và xếp hạng dựa vào mức lương. Nếu giáo viên có lương cao nhất thì hạng là 1.
SELECT MAGV, HOTEN, (SELECT COUNT(*) FROM GIAOVIEN GV2 WHERE GV2.LUONG >= GV1.LUONG and GV2.MAGV != GV1.MAGV) AS HANG
FROM GIAOVIEN GV1

-- Q80. Xuất ra thông tin thu nhập của giáo viên. Thu nhập của giáo viên được tính bằng 
--      LƯƠNG + PHỤ CẤP. Nếu giáo viên là trưởng bộ môn thì PHỤ CẤP là 300, và giáo viên là trưởng khoa thì PHỤ CẤP là 600.
SELECT MAGV, HOTEN, (CASE 
						WHEN GV.MAGV IN (SELECT TRUONGBM FROM BOMON) and GV.MAGV IN (SELECT TRUONGKHOA FROM KHOA ) THEN LUONG + 300 + 600
						WHEN GV.MAGV IN (SELECT TRUONGBM FROM BOMON) THEN LUONG + 300
						WHEN GV.MAGV IN (SELECT TRUONGKHOA FROM KHOA ) THEN LUONG + 600
						ELSE LUONG
					
					  END) AS THUNHAP
FROM GIAOVIEN GV

-- Q81. Xuất ra năm mà giáo viên dự kiến sẽ nghĩ hưu với quy định: Tuổi nghỉ hưu của Nam là 60, của Nữ là 55
SELECT MAGV, HOTEN, (CASE PHAI
					WHEN 'Nam' THEN year(NGAYSINH) + 60
					WHEN N'Nữ' THEN year(NGAYSINH) + 55
					END ) AS NAMNGHIHUU_DUKIEN
FROM GIAOVIEN
-----------------------------

-- Q82. Cho biết danh sách tất cả giáo viên (magv, hoten) và họ tên giáo viên là quản lý chuyên môn của họ.
SELECT GV1.MAGV, GV1.HOTEN, GV2.HOTEN AS GVQLCM
FROM GIAOVIEN GV1 LEFT JOIN GIAOVIEN GV2 ON GV1.GVQLCM = GV2.MAGV


-- Q83. Cho biếtdanh sáchtất cả bộ môn (mabm, tenbm), tên trưởng bộ môn cùng số lượng giáo viên của mỗi bộ môn.
SELECT BM.MABM, TENBM ,GV.HOTEN AS TRUONGBM, (SELECT COUNT(*) FROM GIAOVIEN GV2 WHERE GV2.MABM = BM.MABM) AS SLGV
FROM BOMON BM LEFT JOIN GIAOVIEN GV ON TRUONGBM = MAGV

-- Q84. Cho biết danh sách tất cả các giáo viên nam và thông tin các công việc mà họ đã tham gia.
SELECT GV.MAGV, HOTEN, TENCV, NGAYBD, NGAYKT
FROM GIAOVIEN GV LEFT JOIN THAMGIADT TGDT ON TGDT.MAGV = GV.MAGV JOIN CONGVIEC CV ON CV.MADT = TGDT.MADT and CV.SOTT = TGDT.STT 
WHERE GV.PHAI = 'Nam'

-- Q85. Cho biết danh sách tất cả các giáo viên và thông tin các công việc thuộc đề tài 001 mà họ tham gia.
SELECT GV.MAGV, GV.HOTEN, TENCV, NGAYBD, NGAYKT
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV = TGDT.MAGV JOIN CONGVIEC CV ON CV.MADT = TGDT.MADT and CV.STT = TGDT.STT 
WHERE TGDT.MADT = '001'

-- Q86. Cho biết thông tin các trưởng bộ môn (magv, hoten) sẽ về hưu vào năm 2014. Biết rằng độ tuổi về hưu của giáo viên nam là 60 còn giáo viên nữ là 55.
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV JOIN BOMON BM ON BM.TRUONGBM = GV.MAGV
WHERE (CASE PHAI
		WHEN 'Nam' THEN year(NGAYSINH) + 60
		WHEN N'Nữ' THEN year(NGAYSINH) + 55
	   END ) = 2014

-- Q87. Cho biết thông tin các trưởng khoa (magv) và năm họ sẽ về hưu.
SELECT K.TRUONGKHOA, GV.HOTEN, K.TENKHOA, (CASE PHAI
											WHEN 'Nam' THEN year(NGAYSINH) + 60
											WHEN N'Nữ' THEN year(NGAYSINH) + 55
										   END) AS NAMVEHUU
FROM GIAOVIEN GV JOIN KHOA K ON GV.MAGV = K.TRUONGKHOA

-- Q88. Tạo bảng DANHSACHTHIDUA (magv, sodtdat, danhhieu) gồm thông tin mã giáo viên, số đề tài họ tham gia đạt kết quả và danh hiệu thi đua:
CREATE TABLE DANHSACHTHIDUA (
	MAGV CHAR(3) PRIMARY KEY,
	SODTDAT INT,
	DANHHIEU NVARCHAR(30),
)
GO

ALTER TABLE DANHSACHTHIDUA ADD CONSTRAINT 
FK_GV_DSTD FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
GO

--      a. Insert dữ liệu cho bảng này (để trống cột danh hiệu)
-- B1. tạo bảng ảo với dữ liệu từ bảng TGDT
SELECT MAGV, (SELECT COUNT(*) FROM THAMGIADT TGDT1 WHERE TGDT1.MAGV = TGDT.MAGV AND KETQUA = N'Đạt' ) AS SODTDAT, DANHHIEU = NULL
INTO #TEMP_1
FROM THAMGIADT TGDT
GROUP BY MAGV
GO

-- B2. insert dữ liệu vào bảng THAMGIATHIDUA với dữ liệu từ temp
INSERT INTO DANHSACHTHIDUA
SELECT MAGV, SODTDAT, DANHHIEU
FROM #TEMP_1
GO

--      b. Dựa vào cột sldtdat (số lượng đề tài tham gia có kết quả là “đạt”) để cập nhật dữ liệu cho cột danh hiệu theo quy định:
--          i. Sodtdat = 0 thì danh hiệu “chưa hoàn thành nhiệm vụ”
--          ii. 1 <= Sodtdat <= 2 thì danh hiệu “hoàn thành nhiệm vụ”
--          iii. 3 <= Sodtdat <= 5 thì danh hiệu “tiên tiến”
--          iv. Sodtdat >= 6 thì danh hiệu “lao động xuất sắc”

-- B1. tạo bảng ảo
SELECT MAGV, (CASE 
				WHEN SODTDAT = 0 THEN N'chưa hoàn thành nhiệm vụ'
				WHEN 1 <= SODTDAT and SODTDAT <= 2 THEN N'hoàn thành nhiệm vụ'
				WHEN 3 <= SODTDAT and SODTDAT <= 5 THEN N'tiên tiến'
				ELSE N'lao động xuất sắc'
			  END) AS DANHHIEU
INTO #TEMP_2
FROM DANHSACHTHIDUA
GO

-- B2. update bảng DANHSACHTHIDUA
UPDATE DANHSACHTHIDUA 
SET DANHHIEU = (SELECT T.DANHHIEU
				FROM #TEMP_2 T
				WHERE DANHSACHTHIDUA.MAGV = T.MAGV
			) 
GO


-- Q89. Cho biết magv, họ tên và mức lương các giáo viên nữ của khoa “Công nghệ thông tin”, mức lương trung bình, mức lương lớn nhất và nhỏ nhất của các giáo viên này.
SELECT MAGV, HOTEN, LUONG 
into #TEMP_LUONG_NU_CNTT
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM JOIN KHOA K ON BM.MAKHOA = K.MAKHOA
WHERE K.TENKHOA = N'Công nghệ thông tin' and PHAI = N'Nữ'

SELECT * FROM #TEMP_LUONG_NU_CNTT
SELECT AVG(LUONG) AS AVG_LUONG, MAX(LUONG) AS MAX_LUONG, MIN(LUONG) AS MIN_LUONG
FROM #TEMP_LUONG_NU_CNTT T


-- Q90. Cho biết makhoa, tenkhoa, số lượng gv từng khoa, số lượng gv trung bình, lớn nhất và nhỏ nhất của các khoa này.
SELECT K.MAKHOA, K.TENKHOA, (SELECT COUNT(*) FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM = BM.MABM WHERE BM.MAKHOA = K.MAKHOA) AS SLGV
INTO #TEMP_TK_GVKHOA
FROM KHOA K

SELECT * FROM #TEMP_TK_GVKHOA
SELECT AVG(SLGV) AS SLGVTB, MAX(SLGV) AS SLGVLN, MIN(SLGV) AS SLGVNN
FROM #TEMP_TK_GVKHOA


-- Q91. Cho biết danh sách các tên chủ đề, kinh phí cho chủ đề (là kinh phí cấp cho các đề tài thuộc chủ đề), tổng kinh phí, kinh phí lớn nhất và nhỏ nhất cho các chủ đề.
SELECT TENCD, SUM(KINHPHI) AS KINHPHI
into #TEMP_TK_KPCD
FROM CHUDE CD JOIN DETAI DT ON CD.MACD = DT.MACD
group by CD.MACD, CD.TENCD

SELECT * FROM #TEMP_TK_KPCD
SELECT SUM(KINHPHI) AS TONGKP, MAX(KINHPHI) AS KPLN, MIN(KINHPHI) AS MINKP
FROM #TEMP_TK_KPCD

-- Q92. Cho biết madt, tendt, kinh phí đề tài, mức kinh phí tổng và trung bình của các đề tài này theo từng giáo viên chủ nhiệm.
SELECT MADT, TENDT, KINHPHI, GVCNDT
INTO #TEMP_TKDT
FROM DETAI DT

SELECT * FROM #TEMP_TKDT
SELECT GVCNDT, SUM(KINHPHI) AS TONGKP, AVG(KINHPHI) AS TBKP 
FROM #TEMP_TKDT 
GROUP BY (GVCNDT)

-- Q93. Cho biết madt, tendt, kinh phí đề tài, mức kinh phí tổng và trung bình của các đề tài này theo từng cấp độ đề tài.
SELECT MADT, TENDT, KINHPHI, CAPQL
into #TEMP_TKDT_CAPQL
FROM DETAI DT

SELECT * FROM #TEMP_TKDT_CAPQL
SELECT CAPQL, SUM(KINHPHI) AS TONGKP, AVG(KINHPHI) AS TBKP 
FROM #TEMP_TKDT_CAPQL
GROUP BY (CAPQL)

-- Q94. Tổng hợp số lượng các đề tài theo (cấp độ, chủ đề), theo (cấp độ), theo (chủ đề).
SELECT CAPQL, TENCD, COUNT (*) AS SLDT
FROM DETAI DT JOIN CHUDE CD ON DT.MACD = CD.MACD
GROUP BY CAPQL, TENCD WITH CUBE

-- Q95. Tổng hợp mức lương tổng của các giáo viên theo (bộ môn, phái), theo (bộ môn).
SELECT MABM, PHAI, SUM(LUONG) AS TONGLUONG
FROM GIAOVIEN
GROUP BY MABM, PHAI WITH ROLLUP

-- Q96. Tổng hợp số lượng các giáo viên của khoa CNTT theo (bộ môn, lương), theo (bộ môn), theo (lương).
SELECT (CASE 
			WHEN TENBM IS NULL AND grouping (TENBM) = 1 THEN N'BM bất kỳ'
			ELSE TENBM			
		END) AS TENBM, (CASE
							WHEN LUONG IS NULL AND GROUPING(LUONG) = 1 THEN N'Lương bất kì'
							ELSE CAST(LUONG AS NVARCHAR(20))		
						END) AS LUONG, COUNT(MAGV) AS SLGV
FROM GIAOVIEN GV RIGHT JOIN BOMON BM ON GV.MABM = BM.MABM
WHERE BM.MAKHOA = 'CNTT'
GROUP BY TENBM, LUONG WITH CUBE