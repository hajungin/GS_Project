# 🚩프로젝트명
#### 금융 Project


--- 
# ✏목차
1. [프로젝트 소개](#프로젝트-소개)
2. [프로젝트 목적](#프로젝트-목적)
3. [프로젝트 주제](#프로젝트-주제)
4. [프로젝트 개요](#프로젝트-개요)
5. [프로젝트 기간](#프로젝트-기간)
6. [팀원 소개 및 역할](#팀원-소개-및-역할)
7. [기술스택](#기술스택)
8. [주요기능 및 화면구성](#주요기능-및-화면구성)
9. [ERD](#ERD)
10. [느낀점](#느낀점)

---
# 📰프로젝트 소개
#### GSITM부트캠프에서 진행된 금융 Project

---

# 🔍프로젝트 목적
1. Eclipse 개발 툴 학습
2. Vue.js 및 ajax 활용 학습
3. MyBatis를 이용한 SQL 작성능력 향상
4. 금융 프로세스 이해하기
5. DBA 및 PostgreSQL 활용 학습

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
- 김주성(팀장) : 팀원 일정조율 및 계획문서 관리, 금융 계산기 구현, 설계이력관리, 환율 계산기 구현, DB 설계
- 우가연 : 메인화면 구성, 공지사항 관리 구현, 스케줄 관리 구현, 금융뉴스, 환율 API 호출 및 적용, DB 설계
- 이나래 : 고객관리 구현, 시스템코드 관리 구현, 로그인 및 메인화면 구성, 관리자/사용자별 메뉴 접근 권환분리 구현, DB 설계
- 이호중 : 마이페이지관리 구현, 상담내역관리 구현, 담당자관리 구현, 공통 css 수정, DB 설계
- 하정인 : DB 설계 및
  
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
## 사용자 권한
1. 메인페이지,마이페이지
2. 고객 관리
3. 공지사항 조회
4. 스케줄 관리
5. 판매 관리
6. 환율정보

## 관리자 권한 (사용자권한포함)
1. 상품 관리
2. 시스템 코드 관리
3. 공지사항 관리
4. 판매 달성률 관리
   
---
## 사용자 권한
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
## 관리자 권한
### 상품관리
| 일반상품조회 | 프로모션상품조회 |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/8f84e5e3-0b19-414b-aafa-fcef31f93b41) | ![image](https://github.com/user-attachments/assets/f4b0f092-f5bc-46e7-b418-9df780969803) |

- 상품명, 상품유형, 판매기간, 가입대상, 판매상태, 가입금액 검색 기능
- 상품등록버튼으로 상품등록 페이지 이동
- 이율내역버튼으로 해당 상품 체크박스 선택 후 이율내역 조회
- 해당 상품 클릭 시 상품 수정 및 판매 종료 관리


| 일반상품이율내역 | 프로모션상품이율내역 |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/06561972-c8dc-4f39-bdb9-bf7cf7dc621b) | ![image](https://github.com/user-attachments/assets/7cd4a3b1-cb62-4f85-bcbb-49398b8b4295) |


| 상품 관리 | 상품 수정 | 상품 판매 종료 | 
| --- | --- | --- |
| ![image](https://github.com/user-attachments/assets/36713af0-bc21-4e29-8ced-6a538fd85d1b) | ![image](https://github.com/user-attachments/assets/10a396e0-27f2-4235-ad01-95cfe835e01d) | ![image](https://github.com/user-attachments/assets/80567b96-81fe-403e-955a-7f239776d7ba) |
- 상품관리 : 상품수정버튼 클릭 시 상품정보 저장과 판매종료 활성화 기능, 좌측에 상품 이율정보가 변동 될 시 이율변동 내역에 추가
- 상품수정 : 가입대상, 납입기간, 납입주기, 판매기간 종료일, 적용기간 종료일, 가입금액, 적용이율 수정 기능
- 판매종료 : 수정기능 비활성화


| 상품등록 |
| --- |
| ![image](https://github.com/user-attachments/assets/317330b0-31a3-48f1-8d0d-b1aeec5c57c7) |
- 상품유형 선택 시 자동으로 상품코드 반영
- 적용기간 D-day부터 30일이후로 설정
- 등록버튼 클릭 시 모든 값 유효성 검사

---
### 시스템 코드 관리
| 코드 관리 | 
| --- |
| ![image](https://github.com/user-attachments/assets/846cb513-cb28-4568-a856-64541b837204) |
- 사용중인 코드를 통합하여 관리 기능
- 수정, 추가, 삭제 기능

---
### 공지사항 관리
| 공지사항조회 | 공지사항 추가 | 공지사항 관리 |
| --- | --- | --- |
| ![image](https://github.com/user-attachments/assets/f093b898-b356-419a-a4db-ed6805d3efdf) | ![image](https://github.com/user-attachments/assets/533b4d3c-96df-455a-a6b7-cd01ad1edabd) | ![image](https://github.com/user-attachments/assets/49d2a379-25ee-4760-8389-8089083af9c9) |

---
### 판매 달성률 관리
| 적금상품 | 예금상품 | 대출상품 | 목돈마련상품 |
| --- | --- | --- | --- |
| ![image](https://github.com/user-attachments/assets/eb6e3b92-9fec-468e-a410-020b5dae7b07) | ![image](https://github.com/user-attachments/assets/c3ccf882-7da8-4753-a30d-31a45258f008) | ![image](https://github.com/user-attachments/assets/3c7df32b-676b-4e17-a73f-c23056873028) | ![image](https://github.com/user-attachments/assets/70c4560f-6b72-462e-a570-99e7c6e7d1cb) |


| 목표금액 등록 |
| --- |
| ![image](https://github.com/user-attachments/assets/8a4b380e-815f-4ba4-a412-59fd3ecc4146) |
- 상품유형별로 사용자들이 고객을 상대로 상품을 판매한 금액과 건수를 비교
- 관리자가 등록한 목표금액에 비례하여 사용자 달성률과 등수 표시


---
# 🧩ERD
![image](https://github.com/user-attachments/assets/4c9eebcc-c21e-4514-89ab-7b2fb87b8900)

# ✍느낀점
저의 두번째 웹 프로젝트로서 첫번째 프로젝트에서 아쉬운 점(Ajajx와 SQL 쿼리 작성 및 JAVA)을 적극으로 보완하고자 하였습니다. 주제는 금융프로젝트로 

두 번째 프로젝트에서는 첫 프로젝트에서 배운 설계의 중요성을 고려해 더 철저하게 준비했습니다. 설계 단계에서 각 테이블 간의 관계를 명확하게 정의하고, 데이터 흐름을 미리 파악한 덕분에 첫 프로젝트 설계 개발 과정보다 훨씬 수월했습니다. 또한, 팀원들도 많아지고 역할 분담을 세세히 나눌 수 있는 점에서 각자 맡은 역할이 명확하기 때문에 차질 없이 프로젝트 설계를 마칠 수 있었던 거 같습니다. 
하지만 사용하는 DataBase의 table의 개수가 많아지고 하면서 어쩔 수 없이 약간의 설계 변동이 있었지만 팀원들과 끊임없는 소통을 통해 더 나은 방안을 브레인스토밍방법으로 주고 받으면서 프로젝트의 완성도를 높일 수 있었습니다. 
이번 프로젝트에서는 클로즈드 소스를 사용하면서 초반에 기존 코드를 이해하는데 시간을 많이 사용하였습니다. 기존 코드를 분석과 이해하는 시간을 가지며 실무에서도 이런 경험이 많이 도움이 될 거 같다고 느껴졌습니다. 
이번에 Vue.js를 접해보면서 저번 프로젝트에서 아쉬웟던 Ajax부분을 적극 활용하고 페이지 리로드를 줄이면서 부드러운 인터페이스를 만들었습니다. 처음으로 Vue.js를 사용해보면서 기존의 사용하던 HTML에서 많은 기능을 사용할 수 있었고 간결한 문법 덕분에 학습의 난이도가 높지 않아서 빠른 시간안에 응용하여 개발을 할 수 있었던 거 같습니다.

이번 프로젝트에서는 팀원들과 함께 협업하는 과정에서도 많은 것을 배웠습니다. Git을 사용한 협업과 코드 리뷰를 통해 서로의 코드를 이해하고 개선할 수 있었고, 효과적인 커뮤니케이션의 중요성을 느꼈습니다. 제가 코드에 오류가 발생하거나 해결방안이 떠오르지 않을 때 혼자서 고민을 하는 것보다 주위에 팀원들과 다같이 다양한 의견을 주고 받으며 빠른 문제를 해결할 수 있었고 제가 아는 내용에 대해서 팀원들에게 설명하면서 다시 한 번 복습을 하는 느낌을 얻을 수 있었습니다.


#### [맨위로](#프로젝트명)




























