# MSP Architect 2026
On-Premise Kubernetes Automation Platform

---

## ▍시나리오

Kubernetes 클러스터를 운영하다 보면 노드 교체, 테스트 환경 재구성, 장애 복구 상황이 반복적으로 발생한다.
그때마다 OS 설치부터 패키지 구성, 보안 설정, 클러스터 조인까지 수작업으로 처리해야 했고
작업자마다 환경이 달라지는 문제가 생겼다.

단순히 빠른 설치가 아니라, **누가 작업하든 동일한 환경이 재현되는 구조**가 필요했다.

**MSP Architect 2026**은 VM 전원 인가 순간부터 Kubernetes 클러스터, CI/CD, 모니터링, GitOps, 장애 자동복구까지
전체 인프라를 코드로 정의하고 자동화한 온프레미스 플랫폼입니다.

---

## ▍핵심 기능

- 🖥️ **PXE 자동 OS 설치** — VM 전원 인가만으로 Rocky Linux 9.3 자동 설치
- ⚙️ **Ansible 원클릭 자동화** — 단일 명령어로 7대 노드 전체 플랫폼 자동 구축
- ☸️ **Kubernetes 클러스터** — kubeadm 기반 멀티 노드 클러스터 자동 구성
- 💾 **NFS Dynamic Storage** — PVC 요청 시 PV 동적 프로비저닝 자동화
- 🦊 **GitLab CI/CD** — 코드 Push만으로 빌드부터 Kubernetes 자동 배포
- 🔁 **ArgoCD GitOps** — Git 변경사항 자동 감지 및 클러스터 자동 동기화
- 📊 **모니터링 스택** — Prometheus + Grafana + Alertmanager Slack 실시간 알림
- 🔄 **Self-Healing** — CNI 장애, 노드 이탈 등 장애 상황 자동 복구

---

## ▍아키텍처

### PXE 자동 설치 아키텍처
<img width="700" alt="PXE 자동 설치 아키텍처" src="https://github.com/user-attachments/assets/d0171938-44b6-437a-bbd6-669a0bf14a61" />

### Ansible 플랫폼 자동화 아키텍처
<img width="700" alt="Ansible 플랫폼 자동화 아키텍처" src="https://github.com/user-attachments/assets/47584d07-cb67-4049-90bb-c772e58fd07e" />

### 클러스터 운영 통합 아키텍처
<img width="700" alt="클러스터 운영 통합 아키텍처" src="https://github.com/user-attachments/assets/0de692ff-4359-437c-abc4-f02d5b83ae7c" />




---

## ▍전체 자동화 흐름
```
PXE 부팅
  → Rocky Linux 자동 설치 (Kickstart)
    → Ansible 플랫폼 자동 구성 (install-platform.yml)
      → Kubernetes Cluster (kubeadm)
        → NFS Dynamic Storage
          → GitLab CI/CD (HTTPS)
            → Helm 배포
              → ArgoCD GitOps 자동 배포
                → Ingress Controller (Nginx)
                  → Prometheus + Grafana + Alertmanager (Slack 연동)
                    → Self-Healing 자동 복구
```

---

## ▍인프라 구성

| 노드 | 역할 | IP |
|------|------|----|
| pxe-ansible | PXE 서버 + Ansible 실행 서버 | 192.168.0.101 |
| k8s-control-1 | Kubernetes Control Plane | 192.168.0.120 |
| k8s-worker-1~4 | Kubernetes Worker 노드 | 192.168.0.118 / 181 / 166 / 156 |
| k8s-storage-1 | NFS Storage 서버 | 192.168.0.155 |
| gitlab-server | GitLab 서버 (Docker) | 192.168.0.112 |

---

## ▍Quick Start
```bash
ansible-playbook -i ~/ansible-k8s/inventory/inventory.ini ~/ansible-k8s/install-platform.yml
```

전체 설치 및 검증 절차 → **[Wiki](https://github.com/msp-architect-2026/yang-junpyo/wiki)**

---


## ▍문서 안내

| 문서 | 바로가기 |
|------|---------|
| 📖 Wiki 전체 문서 | [Wiki 이동](https://github.com/msp-architect-2026/yang-junpyo/wiki) |
| 🎬 플랫폼 기능 시연 및 증빙 | [플랫폼 기능 시연 및 증빙 이동](https://github.com/msp-architect-2026/yang-junpyo/wiki/Verification) |
