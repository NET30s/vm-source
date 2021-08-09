CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off
set /a numrd=21 %%6
color %numrd%f
mode con lines=22 cols=90
goto check_Permissions

:check_Permissions
title Đổi mật khẩu đăng nhập vps
echo Vui lòng chờ ...
net session >nul 2>&1
if %errorLevel% == 0 (
    goto changepass
) else (
    goto Admin_required
)

:Admin_required
title Đổi mật khẩu đăng nhập vps
cls
echo.
:: ====================================== USB HDD BOOT =======================================
echo                               ĐỔI MẬT KHẨU ĐĂNG NHẬP VPS
echo =========================================================================================
echo.
color CF
echo  == KHÔNG THỂ TIẾP TỤC, VUI LÒNG XEM HƯỚNG DẪN BÊN DƯỚI VÀ THỬ LẠI.
echo.
echo  == HƯỚNG DẪN CẦN THIẾT KHI ĐỔI MẬT KHẨU MỚI:
echo  ==== Chạy script này bằng cách nhấp phải chuột, chọn Run As Administrator.
echo.
echo Bấm phím bất kỳ để thoát.
pause >nul
exit

:changepass
title Đổi mật khẩu đăng nhập vps
cls
color %numrd%f
echo.
:: ====================================== USB HDD BOOT =======================================
echo                               ĐỔI MẬT KHẨU ĐĂNG NHẬP VPS
echo =========================================================================================
echo.
echo  == ĐỂ TRÁNH BỊ NGƯỜI KHÁC QUẤY RỐI KHI SỬ DỤNG VPS, BẠN NÊN ĐỔI MẬT KHẨU MỚI.
echo.
echo. == HƯỚNG DẪN CẦN THIẾT KHI ĐỔI MẬT KHẨU MỚI:
echo  ==== Mật khẩu mới phải bao gồm: chữ hoa + chữ thường + ký tự đặt biệt + ký tự số.
echo  ==== Sau khi đổi mật khẩu xong, hãy Logoff Windows.
echo  ==== Tắt và thoát khỏi phần mềm điều khiển VPS.
echo  ==== Bật lại phần mềm điều khiển và kết nối với VPS bằng mật khẩu mới vừa thay đổi.
echo.
set newpass=
set /p newpass=  [][] Nhập mật khẩu mới tại đây, bấm phím Enter để đổi :
if /I "%newpass%" == "" goto changepass
net user runneradmin %newpass%
net user %username% %newpass%
if %errorlevel% EQU 0 ( goto success ) Else ( Goto error )
goto changepass

:success
title Đổi mật khẩu đăng nhập vps
cls
echo.
:: =============================================================================== USB HDD BOOT
echo                               ĐỔI MẬT KHẨU ĐĂNG NHẬP VPS
echo =========================================================================================
echo.
echo  == ĐỔI MẬT KHẨU THÀNH CÔNG !
echo.
echo  == HƯỚNG DẪN CẦN THIẾT KHI ĐỔI MẬT KHẨU MỚI:
echo  ==== Sau khi đổi mật khẩu xong, hãy Logoff Windows.
echo  ==== Tắt và thoát khỏi phần mềm điều khiển VPS.
echo  ==== Bật lại phần mềm điều khiển và kết nối với VPS bằng mật khẩu mới vừa thay đổi.
echo.
echo Bấm phím bất kỳ để Logoff Windows.
pause >nul
logoff >nul
exit

:error
title Đổi mật khẩu đăng nhập vps
cls
echo.
:: ====================================== USB HDD BOOT =======================================
echo                               ĐỔI MẬT KHẨU ĐĂNG NHẬP VPS
echo =========================================================================================
echo.
color CF
echo  == ĐỔI MẬT KHẨU THẤT BẠI, VUI LÒNG XEM HƯỚNG DẪN BÊN DƯỚI VÀ THỬ LẠI.
echo.
echo  == HƯỚNG DẪN CẦN THIẾT KHI ĐỔI MẬT KHẨU MỚI:
echo  ==== Mật khẩu mới phải bao gồm: chữ hoa + chữ thường + ký tự đặt biệt + ký tự số.
echo.
echo Bấm phím bất kỳ để thử lại.
pause >nul
goto changepass