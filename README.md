# 🚩프로젝트명
#### 금융 Project


--- 
# ✏목차
1. [프로젝트 소개](#프로젝트-소개)
2. [프로젝트 주제](#프로젝트-주제)
3. [프로젝트 개요](#프로젝트-개요)
4. [프로젝트 기간](#프로젝트-기간)
5. [팀원 소개 및 역할](#팀원-소개-및-역할)
6. [기술스택](#기술스택)
7. [주요기능 및 화면구성](#주요기능-및-화면구성)
8. [ERD](#ERD)

---
# 📰프로젝트 소개
#### GSITM부트캠프에서 진행된 금융 Project

---
# 📠프로젝트 주제
#### 금융사에서 고객관리와 상품관리를 진행하고 사원은 고객들에게 상품 판매를 진행

---
# 📚프로젝트 개요
#### 금융사 금융 상품 판매활용 웹 서비스
- 고객관리 : 고객의 개인정보를 관리 특히 고객별 직업, 연령층 등 상품 홍보 및 판매에 필요한 정보를 활용
- 상품관리 : 상품유형, 이율, 프로모션 여부 등 고객이 원하는 종류의 상품을 즉시 활용 가능한 기능
- 판매관리 : 금융 계산기, 상품 가입 현황 등 판매와 관련되어 있거나 판매완료 후 정보를 관리하는 기능
- 활동관리 : 개인별 일정을 관리하는 기능

---
# 🗓프로젝트 기간
#### 2024.06.11~2024.07.01

---
# 👨‍👩‍👦‍👦팀원 소개 및 역할
- 김주성(팀장) : 팀원 일정조율 및 계획문서 관리, 금융 계산기 구현, 설계이력관리, 환율 계산기 구현
- 우가연 : 메인화면 구성, 공지사항 관리 구현, 스케줄 관리 구현, 금융뉴스, 환율 API 호출 및 적용
- 이나래 : 고객관리 구현, 시스템코드 관리 구현, 로그인 및 메인화면 구성, 관리자/사용자별 메뉴 접근 권환분리 구현
- 이호중 : 마이페이지관리 구현, 상담내역관리 구현, 담당자관리 구현, 공통 css 수정
- 하정인
  
  __관리자 권한__
    - 상품관리
      
      ▷ 상품조회(일반상품, 프로모션상품) :  검색 기능 구현, 상품 이율내역 조회 및 인쇄, 상품정보 수정
      
      ▷ 상품등록(관리자) : 일반상품, 프로모션 상품 등록
    - 판매관리
      
      ▷ 판매달성률 : 상품유형별 목표금액에 비례한 사용자들의 판매금액 비교
  

   __사용자 권한__
    - 판매관리
      
      ▷ 상품 조회(판매중 상품) : 검색 기능 구현, 상품 상세내역 조회, 프로모션 상품 맞춤 고객 추천
      
      ▷ 가입 현황 : 금융 상품에 가입된 고객 리스트
  

---
# 🛠기술스택
| **IDE** | **DBMS** | **DBA** | **API** | **Server** | **형상관리** |
| --- | --- | --- | --- | --- | :---: |
| ![image](https://github.com/user-attachments/assets/b3c7a2f6-6243-472e-918e-b60e936e774f) | ![image](https://github.com/user-attachments/assets/367a1891-03f7-4b66-873b-8c678f0c7d8a) | ![image](https://github.com/user-attachments/assets/f42f9d16-6b47-4847-aa23-b4ab488c0c43) | ![image](https://github.com/user-attachments/assets/bdb3019d-a186-426b-9afd-8d1c8d404024) | ![image](https://github.com/user-attachments/assets/7e016246-31fb-4d34-bbfc-a22c3c4f5892) | ![image](https://github.com/user-attachments/assets/22a7ba1a-b6ab-4caa-bec2-f5c29d5994fc) |


 #### **FrameWork/Library**
| **BootStrap** | **Vue.js** | **JQuery** | **JSP** | **MyBatis** |
| :---: | --- | --- | --- | --- |
| ![image](https://github.com/user-attachments/assets/a8b27f0c-788f-4669-a20c-9ede84214e77) | ![image](https://github.com/user-attachments/assets/5cc28af9-a79d-4671-8e31-14aeee97234e) | ![image](https://github.com/user-attachments/assets/2e978b73-5151-403a-9c98-cbb07af4044f) | ![image](https://github.com/user-attachments/assets/8c47e637-021c-4cd3-8116-cc99573535bf) | ![image](https://github.com/user-attachments/assets/222f1b07-2cda-4b69-8cdf-2f36e8bcfb43) | 

#### **Backend / Frontend**
| **Java 18** | **HTML** | **CSS** | **JavaScript** |
| :---: | --- | --- | :---: |
| ![image](https://github.com/user-attachments/assets/e22eaf94-f5a1-469b-9bc1-918c0bd7a8f8) | ![image](https://github.com/user-attachments/assets/8d391950-50db-4c09-bfd9-7f19a96f6dc2) | ![image](https://github.com/user-attachments/assets/180080b8-70c0-44ad-9d94-6aab257b6c1a) | ![image](https://github.com/user-attachments/assets/27825bce-1585-46cb-b15a-ee9cf6e25866) |

---
# 📌주요기능 및 화면구성
| ## 사용자 권한 | ## 관리자 권한 |
| --- | --- |
| 1. 메인페이지, 마이페이지
2. 고객관리
3. 공지사항
4. 스케줄 관리
5. 판매관리
6. 환율정보 |
| 1. 상품관리
2. 판매 달성률 관리 |

   
| 메인페이지 | 마이페이지 |
| ---- | --- |
| ![image](https://github.com/user-attachments/assets/2ef087a2-fca9-4470-9d97-55dd4df5473a) | ![image](https://github.com/user-attachments/assets/6c18d943-e612-439f-95b9-5daef340b60a) |
- 사이드 메뉴바 (사용자권한)
- 금융소식 (API)
- 공지사항(최신공지사항링크연결)
- 달력 및 스케줄 (API)
- 로그인 정보 조회
- 이달의 우수사원 (금융상품 판매 금액 순)

---
### <고객관리>

| 고객목록 조회 |
| --- |
| ![image](https://github.com/user-attachments/assets/c7314542-4132-4b56-8c26-e8173515cf0e) |
- 이벤트(생일, 만기도래), 고객명, 전화번호, 관리담당자 검색기능
- 아이콘 파란색 자신의 고객 표시
- 회원등록, 상담목록 조회 버튼
- 고객 정보 관리 기능 (더블클릭)
- 페이징 처리 기능


| 고객기본정보관리 | 신규회원등록 |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/5c778c0b-3115-4e35-b7ee-3c8bddec6cdd) | ![image](https://github.com/user-attachments/assets/b06431ee-4bec-4eac-ae86-0bdb44374fed) |

| 상담내역조회 | 상담상세내역 |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/4e8896ea-72f6-4068-a4e8-4c1c5b8ba5fd) | ![image](https://github.com/user-attachments/assets/842b9304-dec1-4a02-bff8-97959779d4ce) |
- 상담일시, 고객명, 상담내용, 상담자 검색기능
- 상담내역 삭제 기능
- 페이징 처리 기능

---
### 공지사항
| 공지사항목록조회 | 목록상세 |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/c9e6ce32-817c-4173-9f93-e956992a7eb2) | ![image](https://github.com/user-attachments/assets/e1e944e5-60af-443a-8557-8b32ca84d0cb) |
- 제목, 내용 검색 기능
- 페이징 처리 기능
- 목록 클릭 시 목록 상세로 이동

---
### 스케줄관리
| 스케줄 목록 조회 및 추가| 스케줄 정보 관리| 
| --- | --- |
| ![image](https://github.com/user-attachments/assets/4460e0ef-021c-4f0d-8d13-0506ef0cdc77) | ![image](https://github.com/user-attachments/assets/7f7e8e86-0a9e-4c20-84c6-97270893495e) |
- 드래그로 스케줄 추가
- 기존 스케줄 클릭 시 스케줄 이벤트 정보관리

---
### 판매관리
| 판매중 상품 조회 | 상품 상세 내역 |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/0ca5f925-8638-41fd-848d-5e8cce6b2b96) | ![image](https://github.com/user-attachments/assets/23557958-b145-456a-b7b1-9520db214105) |

- 상품명, 상품유형, 판매기간, 프로모션, 가입대상, 가입금액 검색 기능
- 가입등록 버튼 금융계산기 이동
- 상세내역 버튼 체크박스 선택 후 상품 상세내역 출력

| 금융계산기 | 설계저장 | 가입저장 |
| --- | --- | --- |
| ![image](https://github.com/user-attachments/assets/5d30daa4-5731-4b0b-b576-e0013290efdd) | ![image](https://github.com/user-attachments/assets/398a4eea-d840-4485-bce7-c30365612d71) | ![image](https://github.com/user-attachments/assets/455f0a3c-1ea2-4c24-8261-ae7b700c0f52) |


- 등록된 상품 적금, 예금, 대출, 목돈마련 상품 카테고리 별로 계산 기능
- 설계저장 : 가입 진행 전 설계이력만 저장
- 설계이력조회 : 해당 고객 클릭 시 고객정보를 가지고 금융 계산기로 이동
- 가입저장 : 가입현황에 등록 (판매처리)

---
| 환율 계산기 |
| --- |


---
# 🧩ERD
[ERD.drawio.svg](ERD.drawio.svg)




































