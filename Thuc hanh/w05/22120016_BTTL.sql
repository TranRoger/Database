USE QLDeTai
GO

--Q35. Cho biết mức lương cao nhất của các giảng viên.--
SELECT DISTINCT GV1.LUONG N'Lương'
FROM GIAOVIEN GV1
WHERE GV1.LUONG >= ALL (SELECT GV2.LUONG
                        FROM GIAOVIEN GV2)

--Q36. Cho biết những giáo viên có lương lớn nhất.--
SELECT *
FROM GIAOVIEN GV1
WHERE GV1.LUONG >= ALL (SELECT GV2.LUONG
                        FROM GIAOVIEN GV2)

--Q37. Cho biết lương cao nhất trong bộ môn “HTTT”.--
SELECT GV1.LUONG N'Lương cao nhất'
FROM GIAOVIEN GV1
WHERE GV1.MABM = 'HTTT' AND GV1.LUONG >= ALL (SELECT GV2.LUONG
                                                FROM GIAOVIEN GV2
                                                WHERE GV2.MABM = 'HTTT')

--Q38. Cho biết tên giáo viên lớn tuổi nhất của bộ môn Hệ thống thông tin.--
SELECT GV1.HOTEN N'Tên'
FROM GIAOVIEN GV1
WHERE GV1.MABM = 'HTTT' 
    AND DATEDIFF(YEAR, GV1.NGSINH, GETDATE()) >= ALL (SELECT DATEDIFF(YEAR, GV2.NGSINH, GETDATE())
                                                    FROM GIAOVIEN GV2
                                                    WHERE GV2.MABM = 'HTTT')

--Q39. Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin.--
SELECT GV1.HOTEN N'Tên'
FROM GIAOVIEN GV1 JOIN BOMON BM ON GV1.MABM = BM.MABM
WHERE BM.MAKHOA = 'CNTT'
    AND DATEDIFF(DAY, GV1.NGSINH, GETDATE()) <= ALL (SELECT DATEDIFF(DAY, GV2.NGSINH, GETDATE())
                                                        FROM GIAOVIEN GV2 JOIN BOMON ON GV2.MABM = BOMON.MABM
                                                        WHERE BOMON.MAKHOA = 'CNTT')

--Q40. Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.--
SELECT GV1.HOTEN N'Tên', 
        KHOA.TENKHOA N'Tên khoa'
FROM GIAOVIEN GV1 JOIN BOMON BM ON GV1.MABM = BM.MABM, KHOA
WHERE BM.MAKHOA = KHOA.MAKHOA AND GV1.LUONG >= ALL (SELECT GV2.LUONG
                                                    FROM GIAOVIEN GV2)

--Q41. Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ.--
SELECT *
FROM GIAOVIEN GV1
WHERE GV1.LUONG >= ALL (SELECT GV2.LUONG
                        FROM GIAOVIEN GV2
                        WHERE GV2.MABM = GV1.MABM)

--Q42. Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.--
SELECT DT.TENDT N'Tên đề tài'
FROM DETAI DT
WHERE DT.MADT NOT IN (SELECT TG.MADT
                        FROM THAMGIADT TG JOIN GIAOVIEN GV ON TG.MAGV = GV.MAGV
                        WHERE GV.HOTEN = N'Nguyễn Hoài An')

--Q43. Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra tên đề tài,
-- tên người chủ nhiệm đề tài.
SELECT DT.TENDT N'Tên đề tài',
        GV1.HOTEN N'Tên gv chủ nhiệm đề tài'
FROM DETAI DT JOIN GIAOVIEN GV1 ON DT.GVCNDT = GV1.MAGV
WHERE DT.MADT NOT IN (SELECT TG.MADT
                        FROM THAMGIADT TG JOIN GIAOVIEN GV ON TG.MAGV = GV.MAGV
                        WHERE GV.HOTEN = N'Nguyễn Hoài An')

--Q44. Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.--
SELECT GV1.HOTEN N'Tên'
FROM GIAOVIEN GV1 JOIN BOMON BM ON GV1.MABM = BM.MABM
WHERE BM.MAKHOA = 'CNTT' AND NOT EXISTS (SELECT *
                                        FROM THAMGIADT TG
                                        WHERE TG.MAGV = GV1.MAGV)

--Q45. Tìm những giáo viên không tham gia bất kỳ đề tài nào--
SELECT *
FROM GIAOVIEN GV
WHERE GV.MAGV NOT IN (SELECT TG.MAGV
                        FROM THAMGIADT TG)