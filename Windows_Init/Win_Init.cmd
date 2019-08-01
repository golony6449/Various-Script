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
netsh -c interface ip set address name="이더넷" source=static addr=%ip% mask=255.255.255.0 gateway=%gateway%
netsh -c interface ip set address name="이더넷 2" source=static addr=%ip% mask=255.255.255.0 gateway=%gateway%
netsh -c interface ip set address name="이더넷 3" source=static addr=%ip% mask=255.255.255.0 gateway=%gateway%
echo.
netsh -c interface ip set dns name="이더넷" source=static addr=8.8.8.8 register=primary
netsh -c interface ip set dns name="이더넷 2" source=static addr=8.8.8.8 register=primary
netsh -c interface ip set dns name="이더넷 3" source=static addr=8.8.8.8 register=primary
echo.
echo    IP 설정이 완료되었습니다.
echo.
echo.
echo.   계정 비밀번호를 설정합니다.
echo.
echo.
:: 필요시 수정
net user CS cs2019
echo.
echo.
echo   비밀번호 설정이 완료되었습니다.
echo.
echo.
CLS
echo    초기작업이 끝났습니다.
echo.
echo.
echo.
pause