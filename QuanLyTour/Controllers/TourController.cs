﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using QuanLyTour.Models;
using X.PagedList;
using X.PagedList.Extensions;
namespace QuanLyTour.Controllers
{
    public class TourController : Controller
    {
        private readonly string _connectionString;
        private readonly ILogger<TourController> _logger;

        public TourController(ILogger<TourController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public IActionResult ChiTietTour(string maTour, string maLoai, int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;
            TourViewModel tour = null;
            List<TourViewModel> tourtt = new List<TourViewModel>();

            // Lấy thông tin người dùng từ session
            var tenNguoiDung = HttpContext.Session.GetString("UserName");
            var soDienThoai = HttpContext.Session.GetString("UserPhone");
            var diaChi = HttpContext.Session.GetString("UserAd");
            var maNguoiDung = HttpContext.Session.GetInt32("UserId");

            ViewBag.TenNguoiDung = tenNguoiDung;
            ViewBag.SoDienThoai = soDienThoai;
            ViewBag.DiaChi = diaChi;
            ViewBag.MaNguoiDung = maNguoiDung;

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                // Truy vấn thông tin tour hiện tại
                string sql = "SELECT p.MaTour, p.TenTour, p.MaLoaiTour, p.TrangThai, p.GiaTour, p.HinhAnh1, p.HinhAnh2, p.HinhAnh3, l.TenLoaiTour, p.MoTa, p.LichTrinh " +
                    "FROM Tour p " +
                    "INNER JOIN LoaiTour l ON p.MaLoaiTour = l.MaLoaiTour " +
                    "WHERE p.MaTour = @maTour";


                using (var command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@maTour", maTour);

                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            tour = new TourViewModel
                            {
                                MaTour = !reader.IsDBNull(0) ? reader.GetInt32(0) : 0,
                                TenTour = !reader.IsDBNull(1) ? reader.GetString(1) : string.Empty,
                                MaLoaiTour = !reader.IsDBNull(2) ? reader.GetInt32(2) : 0,
                                TrangThai = !reader.IsDBNull(3) && reader.GetBoolean(3),
                                GiaTour = !reader.IsDBNull(4) ? reader.GetDecimal(4) : 0,
                                HinhAnh1 = !reader.IsDBNull(5) ? reader.GetString(5) : string.Empty,
                                HinhAnh2 = !reader.IsDBNull(6) ? reader.GetString(6) : string.Empty,
                                HinhAnh3 = !reader.IsDBNull(7) ? reader.GetString(7) : string.Empty,
                                TenLoaiTour = !reader.IsDBNull(8) ? reader.GetString(8) : string.Empty,
                                MoTa = !reader.IsDBNull(9) ? reader.GetString(9) : string.Empty,
                                LichTrinh = !reader.IsDBNull(10) ? reader.GetString(10) : string.Empty,
                            };
                        }
                    }
                }
                // Truy vấn các tour tương tự
                string sqlTourtt = "SELECT p.MaTour, p.TenTour, p.MaLoaiTour, p.TrangThai, p.GiaTour, p.HinhAnh1, p.HinhAnh2, p.HinhAnh3, l.TenLoaiTour " +
                                   "FROM Tour p " +
                                   "INNER JOIN LoaiTour l ON p.MaLoaiTour = l.MaLoaiTour " +
                                   "WHERE  p.MaTour != @maTour AND p.MaLoaiTour = @maLoaiTour";

                using (var command = new SqlCommand(sqlTourtt, connection))
                {
                    command.Parameters.AddWithValue("@maTour", maTour);
                    command.Parameters.AddWithValue("@maLoaiTour", tour?.MaLoaiTour ?? 0); // Sử dụng `MaLoaiTour` từ tour hiện tại

                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            tourtt.Add(new TourViewModel
                            {
                                MaTour = reader.GetInt32(0),
                                TenTour = reader.GetString(1),
                                MaLoaiTour = reader.GetInt32(2),
                                TrangThai = reader.GetBoolean(3),
                                GiaTour = reader.GetDecimal(4),
                                HinhAnh1 = reader.GetString(5),
                                HinhAnh2 = reader.GetString(6),
                                HinhAnh3 = reader.GetString(7),
                                TenLoaiTour = reader.GetString(8)
                            });
                        }
                    }
                }
            }

            if (tour == null)
            {
                return NotFound();
            }

            // Sử dụng PagedList để phân trang danh sách tour tương tự
            var pagedAvailableTours = tourtt.ToPagedList(pageNumber, pageSize);

            var viewModel = new DetailViewModel
            {
                TourHienTai = tour,
                TourTuongTu = pagedAvailableTours
            };

            return View(viewModel);

        }
        public IActionResult DanhMucTour(int pageTrongNuoc = 1, int pageNuocNgoai = 1, int pageSize = 12)
        {
            var model = new TourTabsViewModel();
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    connection.Open();

                    // Lấy danh sách Tour Trong Nước
                    string queryTrongNuoc = @"
                SELECT p.MaTour, p.TenTour, p.MaLoaiTour, p.TrangThai, p.GiaTour, p.HinhAnh1, l.TenLoaiTour FROM Tour p 
                INNER JOIN LoaiTour l ON p.MaLoaiTour = l.MaLoaiTour WHERE p.MaLoaiTour = 1";

                    var tourTrongNuoc = GetTours(connection, queryTrongNuoc);
                    model.TourTrongNuoc = tourTrongNuoc.ToPagedList(pageTrongNuoc, pageSize);

                    // Lấy danh sách Tour Nước Ngoài
                    string queryNuocNgoai = @"SELECT p.MaTour, p.TenTour, p.MaLoaiTour, p.TrangThai, p.GiaTour, p.HinhAnh1, l.TenLoaiTour FROM Tour p 
                    INNER JOIN LoaiTour l ON p.MaLoaiTour = l.MaLoaiTour WHERE p.MaLoaiTour = 2";

                    var tourNuocNgoai = GetTours(connection, queryNuocNgoai);
                    model.TourNuocNgoai = tourNuocNgoai.ToPagedList(pageNuocNgoai, pageSize);
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Có lỗi xảy ra: " + ex.Message;
            }

            return View(model);
        }

        // Hàm lấy danh sách tour
        private List<TourViewModel> GetTours(SqlConnection connection, string query)
        {
            var tours = new List<TourViewModel>();

            using (var command = new SqlCommand(query, connection))
            {
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        tours.Add(new TourViewModel
                        {
                            MaTour = reader.GetInt32(0),
                            TenTour = reader.GetString(1),
                            MaLoaiTour = reader.GetInt32(2),
                            TrangThai = reader.GetBoolean(3),
                            GiaTour = reader.GetDecimal(4),
                            HinhAnh1 = reader.GetString(5),
                            TenLoaiTour = reader.GetString(6)
                        });
                    }
                }
            }

            return tours;
        }
        [HttpPost]
        public IActionResult DatTour(int MaNguoiDung, string TenNguoiDung, string SoDienThoai, string DiaChi, int SoLuong, string SoThe, string ChuThe, int maTour, DateTime NgayDi)
        {
            if (string.IsNullOrWhiteSpace(SoThe) || string.IsNullOrWhiteSpace(ChuThe))
            {
                ModelState.AddModelError("", "Thông tin thanh toán không được để trống.");
                return RedirectToAction("ChiTietTour", new { maTour });
            }

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                // Thêm thông tin đặt tour vào bảng PhieuDatTour
                string sqlInsertPhieu = "INSERT INTO PhieuDatTour (MaNguoiDung, NgayDatTour, MaTour, SoLuong, NgayDi) " +
                                        "VALUES (@MaNguoiDung, @NgayDatTour, @MaTour, @SoLuong, @NgayDi); SELECT SCOPE_IDENTITY();";
                int maPhieu;

                using (var command = new SqlCommand(sqlInsertPhieu, connection))
                {
                    command.Parameters.AddWithValue("@MaNguoiDung", MaNguoiDung);
                    command.Parameters.AddWithValue("@NgayDatTour", DateTime.Now);
                    command.Parameters.AddWithValue("@MaTour", maTour);
                    command.Parameters.AddWithValue("@SoLuong", SoLuong);
                    command.Parameters.AddWithValue("@NgayDi", NgayDi);

                    maPhieu = Convert.ToInt32(command.ExecuteScalar());
                }

                // Tính tổng tiền
                decimal giaTour = 0;
                string sqlGetGiaTour = "SELECT GiaTour FROM Tour WHERE MaTour = @MaTour";
                using (var command = new SqlCommand(sqlGetGiaTour, connection))
                {
                    command.Parameters.AddWithValue("@MaTour", maTour);
                    giaTour = Convert.ToDecimal(command.ExecuteScalar());
                }

                decimal tongTien = giaTour * SoLuong;

                // Thêm thông tin thanh toán vào bảng HoaDon
                string sqlInsertHoaDon = "INSERT INTO HoaDon (MaNguoiDung, MaPhieu, TongTien, NgayThanhToan) " +
                                         "VALUES (@MaNguoiDung, @MaPhieu, @TongTien, @NgayThanhToan)";
                using (var command = new SqlCommand(sqlInsertHoaDon, connection))
                {
                    command.Parameters.AddWithValue("@MaNguoiDung", MaNguoiDung);
                    command.Parameters.AddWithValue("@MaPhieu", maPhieu);
                    command.Parameters.AddWithValue("@TongTien", tongTien);
                    command.Parameters.AddWithValue("@NgayThanhToan", DateTime.Now);

                    command.ExecuteNonQuery();
                }
            }

            TempData["SuccessMessage"] = "Đặt tour và thanh toán thành công!";
            return RedirectToAction("ThanhCongView", "Tour"); 
        }
    public ActionResult ThanhCongView()
        {
            return View();
        }
    }
}
