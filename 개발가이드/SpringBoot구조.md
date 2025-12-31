# yml 설정
- applicaiton.yml 내에 profiles는 바라보는 설정을 의미
- ex) 아래와 같은 경우에는 application-local.yml 의 파일을 참고하여 서버를 킨다.
```
spring:
  profiles:
    active: local
```

- ✅ yml은 들여쓰기 기준으로 설정되기 때문에 들여쓰기를 조심해야한다.
- ---
- ❗️yml 파일에 본인 개발 DB 정보를 바꿔서 작업해야한다. 
```
spring:
  sql:
    init:
      mode: always
  application:
    name: delivery
  datasource:
    driver-class-name: org.mariadb.jdbc.Driver
    url: jdbc:mariadb://localhost:33306/delivery # 여기
    username: root
    password: 1234
```
---


# 시작시 자동 셋팅
1. schema.sql을 통해 테이블이 자동 생성됨 (기존에 존재하는 테이블이 맞지 않는 경우 오류 발생 가능성 있음)
2. data.sql을 통해 기본 데이터는 삽입됨