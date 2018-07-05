# 자동화 스크립트
==========================

## VHD_install
* 학과 실습실 세팅용 스크립트
* MBR(BIOS) 기반 설정
* 명령프롬프트에서 사용하려면 EUR-KR로 인코딩 후 사용

### 디렉토리 구조
| | root | |
|-|-|-|
| vhd | diskpart | VHD_install.cmd |
| windows.vhd | clean.txt | |
| | vhdSSD.txt | |
| | vhd.txt | |

### 파일 / 디렉토리 역할
* `vhd`: 세팅할 VHD 파일이 위치하는 디렉토리
* `windows.vhd`: 세팅 할 VHD
* `diskpart`: diskpart 스크립트가 위치하는 디렉토리
* `clean.txt`: 디스크 초기화 이후, 파티션 생성 및 문자(C) 할당
* `vhd.txt`: `windows.vhd`를 상속받는 자식 VHD를 생성하고 이를 연결(Attach)
* `vhdSSD.txt`: `windows.vhd`를 연결(Attach). (128GB(SSD)의 조달용 PC 대응을 위함)