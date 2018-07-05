@echo off

echo.
echo.
echo.
echo		VHD 설정 스크립트
echo.
echo.
echo.

:: SSD, HDD 여부 설정
:restart
set /p isSSD=SSD PC 입니까? (y/n)

if "%isSSD%" == "y" (
echo	SSD 환경에서의 설정을 진행합니다.
) else (
if "%isSSD%" == "n" (
echo	HDD 환경에서의 설정을 진행합니다.
) else (
echo	올바르지 않은 입력입니다.
goto restart
)
)

:: 기존 이미지 사용 여부 확인
:imgcheck
if exist C:\vhd\windows.vhd (
echo	이미지가 존재합니다.
echo.

set /p oldimg="기존 이미지를 사용하겠습니까? (y/n)"

if "%oldimg%" == "y" (
    echo    기존 이미지를 사용합니다.
    goto vhd
) else (
    if "%oldimg%" == "n" (
        echo    스토리지를 초기화 하고 새 이미지를 복사합니다.
        goto start
    ) 
)
) else (
echo	이미지가 존재하지 않습니다. 계속 진행합니다.
set oldimg=n
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
if "%oldimg%" == "n" (
echo	이미지를 복사합니다.
robocopy .\vhd c:\vhd /ETA
)

:: VHD 작업 파트
:vhd
echo.
echo.
echo.
echo.
echo	VHD 작업 시작
echo.
echo    VHD 용량을 확장합니다.
echo.
if "%isSSD%" == "y" (

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
