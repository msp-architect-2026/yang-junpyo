# 01 - PXE Auto Installation

## 1. 개요

본 단계는 Kubernetes 클러스터 구축 전,
서버 운영체제를 자동으로 설치하기 위한 PXE 기반 프로비저닝 환경을 구성하는 과정이다.

PXE(Preboot eXecution Environment)를 활용하여
네트워크를 통해 Rocky Linux 9를 무인 자동 설치하도록 구성하였다.

---

## 2. PXE 동작 원리

PXE 부팅 흐름은 다음과 같다.

1. 클라이언트가 네트워크 부팅 요청 (DHCP Discover)
2. DHCP 서버가 IP 및 부팅 파일 정보 전달
3. TFTP 서버에서 pxelinux 파일 다운로드
4. Kickstart 파일 기반 자동 설치 진행

즉, 수동 ISO 설치 없이
네트워크 기반으로 OS 설치를 자동화하는 구조이다.

---

## 3. 구성 요소

본 프로젝트에서 사용한 구성 요소는 다음과 같다.

- DHCP Server : IP 할당 및 부팅 정보 전달
- TFTP Server : PXE 부팅 파일 제공
- PXELINUX : 부팅 메뉴 로딩
- Kickstart : Rocky Linux 무인 자동 설치 스크립트
- FTP Repository : 설치 패키지 제공

---

## 4. 주요 설정 파일

| 파일 | 설명 |
|------|------|
| dhcpd.conf | PXE 부팅 대상 클라이언트 IP 및 부팅 파일 지정 |
| pxelinux.cfg/default | PXE 부팅 메뉴 설정 |
| rocky9.ks | Kickstart 자동 설치 스크립트 |
| pxe-setup.sh | PXE 서버 초기 구성 자동화 스크립트 |

---

## 5. 네트워크 구성

- PXE 전용망: 192.168.0.0/24
- PXE 서버: 192.168.0.101 (pxe-ansible)
- 외부 통신망: 192.168.2.0/24
- PXE 대상 클라이언트: 192.168.0.x 대역 VM

---

## 6. 결과

- PXE 부팅 메뉴 정상 표시 확인
- Kickstart 기반 Rocky Linux 9 자동 설치 완료
- 수동 개입 없이 OS 설치 자동화 성공

---

## 7. 의의

본 단계는 이후 Ansible 기반 설정 자동화 및
Kubernetes 클러스터 구축의 기반이 되는
"운영체제 자동 프로비저닝 단계"이다.

수작업 OS 설치를 제거함으로써
인프라 재현성과 확장성을 확보하였다.
