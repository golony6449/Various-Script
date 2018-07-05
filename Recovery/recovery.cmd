@echo off

echo.
echo.
echo.
echo    자식 VHD 기반 윈도우즈 초기화 스크립트
echo.
echo    경상대학교 자연과학대학
echo                    컴퓨터과학과 실습조교실
echo.
echo.
set /p confirm="자식 VHD가 없는 경우(SSD PC의 경우) 부팅되지않습니다. 계속하시겠습니까? (y/n)"
if %confirm% == "y" (
    echo    작업을 진행합니다.
) else (
    echo    작업을 종료합니다.
    goto end
)

echo.
echo    부트 메뉴에서 현재 매체를 삭제합니다.
bcdedit /delete {current}
echo.
echo.
echo    자식 VHD를 Clean 이미지로 교체합니다.
echo.
if exist d:\vhd\child.vhd (
    set param="child.vhd"
    copy d:\vhd\child_copy.vhd d:\vhd\child1.vhd
    diskpart /s .\diskpart\attach.txt
    bcdboot v:\windows /l ko-kr
) else (
    if exist d:\vhd\child1.vhd (
        set param="child1.vhd"
        copy d:\vhd\child_copy.vhd d:\vhd\child.vhd
        diskpart /s .\diskpart\attach1.txt
        bcdboot v:\windows /l ko-kr
    )
)
echo.
echo.
echo.
echo    작업이 완료되었습니다.
echo.
echo    재부팅 이후 %param% 파일을 지워주세요.
echo.
echo.

:end