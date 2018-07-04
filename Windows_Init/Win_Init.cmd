@echo off

echo.
echo.
echo.
echo    Windows 10 초기작업
echo.
echo    경상대학교 자연과학대학
echo                    컴퓨터과학과 실습조교실
echo.
echo    ip주소를 설정합니다.
echo.
set /p ip="설정하려는 IP를 입력해주세요."
echo.
set /p gateway="설정하려는 gateway를 입력해주세요."
echo.
netsh -c interface ip set address name="로컬 영역 연결" source=static addr=%ip% mask=255.255.255.0 gateway=%gateway%
echo.
echo.
echo    IP 설정이 완료되었습니다.
echo.
echo.
echo.   계정 비밀번호를 설정합니다.
echo.
echo.
:: TODO 비밀번호 설정
:: TODO README.md 작성