@echo off
:check
echo.
echo Đang kiểm tra kết nối, vui lòng chờ giây lát !
ping 127.0.0.1 > nul
if %errorLevel% == 0 (
    goto connected
) else (
    goto disconnect
)
goto check

:connected
cls
echo.
echo  ==============================================================================
echo                        ĐÃ KHỞI TẠO VPS THÀNH CÔNG !
echo                     CPU 2 Core - Ram 7GB - SSD 256Gb
echo  ==============================================================================
echo.
echo   == THÔNG TIN TRUY CẬP VPS:
echo   ++ Địa chỉ kết nối VPS lấy tại đây: https://dashboard.ngrok.com/status/tunnels
echo   ++ Tên đăng nhập: NET30s
echo   ++ Mật khẩu mặc định: Vps@2021
echo.
echo  ------------------------------------------------------------------------------
echo  == HƯỚNG DẪN CẦN THIẾT:
echo  ==== Sau khi đăng nhập thành công, nên đổi mật khẩu mới.
echo  ==== Có thể sử dụng Script tên NEW PASSWORD.BAT trên Desktop để đổi mật khẩu mới.
echo  ==== Thời hạn sử dụng vps tối đa 6 giờ
echo  ==== Khi hết hạn sử dụng, có thể tạo lại vps mới bằng cách sau:
echo             ++ Vào mục Action, Click mục VM FREE - AP hoặc VM FREE - US.
echo             ++ Chọn Re-run jobs ở bên phải màn hình, Re-run all jobs.
echo             ++ Nhấn vào Build ở bên trái màn hình để lấy thông tin VPS mới.
echo  ------------------------------------------------------------------------------
echo.
echo Bạn có thể đóng trang web này.
@Exit

:disconnect
cls
echo.
echo  ==============================================================================
echo                   KHÔNG THỂ KẾT NỐI VỚI NGROK.
echo  ==============================================================================
echo.
echo  == HƯỚNG DẪN CẦN THIẾT:
echo             ++ Phải đảm bảo NGROK_AUTH_TOKEN chính xác trong Settings, mục Secrets, mục Repository secret.
echo             ++ Cũng có thể VPS trước đó của bạn vẫn đang chạy: https://dashboard.ngrok.com/status/tunnels
echo.
@Exit