# MSP Architect 2026
On-Premise Kubernetes Automation Platform

## ▍프로젝트 개요

VM 전원 인가부터 Kubernetes 클러스터 구축, CI/CD, 모니터링까지  
전체 인프라 플랫폼을 자동화한 온프레미스 Kubernetes 운영 환경입니다.

PXE 네트워크 부팅을 통해 Rocky Linux를 자동 설치하고,  
Ansible 단일 명령어로 전체 플랫폼이 자동 구성됩니다.

---

## ▍핵심 기능

- 🖥️ **PXE 자동 OS 설치** — VM 전원 인가 후 수동 개입 없이 Rocky Linux 9.3 자동 설치
- ⚙️ **Ansible 원클릭 자동화** — 단일 명령어로 전체 플랫폼 자동 구축
- ☸️ **Kubernetes 클러스터 자동 구성** — kubeadm 기반 멀티 노드 클러스터 자동 구성
- 💾 **NFS Dynamic Storage** — PVC 요청 시 PV 동적 프로비저닝 자동화
- 🦊 **GitLab CI/CD** — HTTPS 기반 파이프라인 자동 실행 및 Kubernetes 자동 배포
- 🔁 **ArgoCD GitOps** — 코드 변경 시 자동 배포 반영
- 📊 **모니터링 스택** — Prometheus + Grafana + Alertmanager Slack 연동

---

## ▍전체 자동화 흐름
```
PXE 부팅
  → Rocky Linux 자동 설치 (Kickstart)
    → Ansible 플랫폼 자동 구성
      → Kubernetes Cluster (kubeadm)
        → NFS Dynamic Storage
          → GitLab CI/CD (HTTPS)
            → Helm 배포
              → ArgoCD GitOps 자동 배포
                → Ingress Controller (Nginx)
                  → Prometheus + Grafana + Alertmanager
```

---

## ▍아키텍처

### PXE 자동 설치 아키텍처
<!-- 아키텍처 사진 추가 예정 -->

### Ansible 플랫폼 자동화 아키텍처
<!-- 아키텍처 사진 추가 예정 -->

---

## ▍인프라 구성

| 노드 | 역할 | IP |
|------|------|----|
| pxe-ansible | PXE 서버 + Ansible 실행 서버 | 192.168.0.101 |
| k8s-control-1 | Kubernetes Control Plane | 192.168.0.120 |
| k8s-worker-1 | Kubernetes Worker 노드 | 192.168.2.130 |
| k8s-worker-2 | Kubernetes Worker 노드 | 192.168.2.131 |
| k8s-worker-3 | Kubernetes Worker 노드 | 192.168.2.134 |
| k8s-worker-4 | Kubernetes Worker 노드 | 192.168.2.140 |
| k8s-storage-1 | NFS Storage 서버 | 192.168.0.155 |
| gitlab-server | GitLab 서버 (Docker) | 192.168.0.112 |

---

## ▍Quick Start

전체 설치 및 검증 절차는 **[Wiki](https://github.com/msp-architect-2026/yang-junpyo/wiki)** 에 상세히 정리되어 있습니다.
```bash
# 1. Ansible 인벤토리 설정
vi ~/ansible-k8s/inventory/inventory.ini

# 2. 원클릭 전체 플랫폼 자동 구축
ansible-playbook -i ~/ansible-k8s/inventory/inventory.ini ~/ansible-k8s/install-platform.yml
```

---

## ▍문서 안내

| 문서 | 바로가기 |
|------|---------|
| 📖 Wiki 전체 문서 | [Wiki 이동](https://github.com/msp-architect-2026/yang-junpyo/wiki) |
| 🖥️ PXE 기반 자동 OS 설치 | [Demo-PXE](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-PXE) |
| ⚙️ Ansible 기반 Kubernetes 클러스터 자동화 | [Demo-Ansible](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-Ansible) |
| 💾 NFS 스토리지 자동 구성 | [Demo-NFS-Storage](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-NFS-Storage) |
| 🦊 GitLab CI/CD 파이프라인 | [Demo-GitLab-CICD](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-GitLab-CICD) |
| 📊 모니터링 스택 | [Demo-Monitoring](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-Monitoring) |
| 🔁 ArgoCD GitOps 자동 배포 | [Demo-ArgoCD](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-ArgoCD) |
| 🌐 Ingress 기반 외부 서비스 접근 | [Demo-Ingress](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-Ingress) |
| 🔄 Self-Healing 장애 복구 | [Demo-Self-Healing](https://github.com/msp-architect-2026/yang-junpyo/wiki/Demo-Self-Healing) |
