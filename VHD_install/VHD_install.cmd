@echo off

echo.
echo.
echo.
echo		VHD 설정 스크립트 (Part 1)
echo.
echo.
echo.
:restart
set /p isSSD=SSD PC 입니까? (y/n)


if "%isSSD%" == "y" (
echo	SSD 환경에서의 설정을 진행합니다.
) else (
if "%isSSD%" == "n" (
echo	HDD 환경에서의 설정을 진행합니다.
) else (
echo	올바르지 않은 입력입니다.
echo.
goto restart
)

:start
echo.
echo	DISK 초기화 수행
echo.
echo.
diskpart /s .\diskpart\clean.txt
echo.
echo	초기화 완료
echo.
echo.
echo.
echo	부트로더 설치
echo.
bootrec /fixmbr
bootrec /fixboot
echo.
echo.
echo	부트로더 설치 완료
echo.
echo.
echo.

if exist C:\vhd\windows.vhd (
echo	이미지가 존재합니다.
) else (
echo	이미지를 복사합니다.
robocopy .\vhd c:\vhd /ETA
)

echo.
echo.
echo.
echo.
echo	VHD 작업 시작
echo.
if %isSSD% == "y" (

echo	부모를 Attach한 뒤, V 문자를 할당합니다.
echo.
diskpart /s .\diskpart\vhdSSD.txt

) else (

echo	Child를 생성하고 Attach한 뒤, V 문자를 할당합니다.
echo.
diskpart /s .\diskpart\vhd.txt

)

echo.
echo	VHD 작업 완료
echo.
echo.
echo	부트로더에 VHD 추가
echo.
bcdboot v:\windows /l ko-kr
echo.
echo.
echo	부트로더 작업 완료
echo.
echo.
echo	작업이 완료되었습니다.

pause
