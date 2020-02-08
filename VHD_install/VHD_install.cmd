@echo off

echo.
echo.
echo.
echo		VHD 설정 스크립트
echo.
echo.
echo    경상대학교 자연과학대학
echo                    컴퓨터과학과 실습조교실
echo.
echo.
echo.
:restart
echo    초기설정을 진행합니다.
echo.
echo.
echo    주의) 0번 디스크가 초기화됩니다.
echo.
pause
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
echo	이미지를 복사합니다.
robocopy .\vhd c:\vhd /ETA

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

echo	부모를 Attach한 뒤, V 문자를 할당합니다.
echo.
diskpart /s .\diskpart\attach_and_expand_vhd.txt

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
