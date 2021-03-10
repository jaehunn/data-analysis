# 데이터 입력

# 텍스트 파일 읽기
# 현재 working directory 를 알아봅시다.
getwd() 
[1] "/Users/bangjaehun"

# read.table() 은 텍스트 파일을 불러옵니다. 컬럼명이 있다면 header를 T(True) 로 설정합니다.
# 그외 옵션으로는 sep(구분자 체크, 기본값은 공백), nrows(읽어들일 행 수), skip(스킵할 행 수) 가 있다.
read.table("workspace/temp/data.txt", header=T) 
  ID NAME AGE
1  1  KIM  25
2  2  LEE  24
3  3 PARK  26
4  4 JANG  24
5  5 CHOI  24

# working directory 를 변경합니다.
setwd("/Users/bangjaehun/workspace") 

getwd()
[1] "/Users/bangjaehun/workspace"

# CSV 파일(데이터 구분자가 쉼표인 파일) 읽기
# CSV 파일의 컬럼명이 없다면 header=F 와 변수이름 벡터를 생성하고 col.names=[벡터] 를 추가해야한다.
read.csv("temp/data.csv")
  ID  NAME AGE
1  1   KIM  25
2  2   LEE  24
3  3  PARK  26
4  4  JANG  24
5  5  CHOI  24

# 구분자가 Tab 인 파일 읽기
read.delim("temp/data.txt", header=T)
  ID..NAME....AGE
1  1   KIM     25
2  2   LEE     24
3  3   PARK    26
4  4   JANG    24
5  5   CHOI    24

# 다음과 같다.
read.table("temp/data.txt", sep="\t", header=T)
  ID..NAME....AGE
1  1   KIM     25
2  2   LEE     24
3  3   PARK    26
4  4   JANG    24
5  5   CHOI    24

# scan() 로 데이터 읽기 
# scan() 은 데이터를 한번에 빨리 읽는다. what 값이 공백이면 문자, 0 이면 숫자로 표현한다.
scan("temp/data.txt", what=" ")
Read 18 items
[1] "ID"   "NAME" "AGE"  "1"    "KIM"  "25"   "2"    "LEE"  "24"   "3"    "PARK" "26"   "4"    "JANG" "24"   "5"    "CHOI" "24"

# edit() 로 키보드입력 데이터 읽기
mydata <- data.frame() # 데이터 프레임을 만들고
mydata <- edit(mydata) # 데이터 편집기를 호출한다.

# 엑셀 읽기
install.packages("readxl")
library(readxl)

mydata <- read_excel("[엑셀 파일 주소]") # 컬럼명이 없다면 col_names=F 추가 

# *URL 로 읽기
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/boot/acme.csv"
mydata <- read.csv(url) 
str(mydata) # str() 로 데이터 구조를 파악한다.

'data.frame':	60 obs. of  4 variables:
 $ X     : int  1 2 3 4 5 6 7 8 9 10 ...
 $ month : chr  "1/86" "2/86" "3/86" "4/86" ...
 $ market: num  -0.06113 0.00822 -0.00738 -0.06756 -0.00624 ...
 $ acme  : num  0.0302 -0.1655 0.0801 -0.1099 -0.1149 ...

head(mydata, 5) # head 로 데이터 확인

  X month    market      acme
1 1  1/86 -0.061134  0.030160
2 2  2/86  0.008220 -0.165457
3 3  3/86 -0.007381  0.080137
4 4  4/86 -0.067561 -0.109917
5 5  5/86 -0.006238 -0.114853


# TODO) Hadoop 으로 읽기


# 데이터 출력

# 출력하고 싶은 데이터를 지정하고 파일 위치를 설정한다.
write(mydata, "temp/data2.txt")

# append 로 기존 파일에 이어서 작성한다면 T, 새로이 저장한다면 F 로 설정한다.
write(mydata, "temp/data2.txt", append=T)

# 표 형태, CSV 형태로 출력
# write.table() 로 데이터를 표 형태로 출력한다.
write.table(mydata, "temp/data3.txt")

# CSV 형태로 출력한다.
write.table(mydata, "temp/data3.csv", sep=",")

# 데이터 추가, 삭제
# 행렬 데이터를 불러온다.
mydata <- read.table("temp/data.txt", header=T)
mydata
  ID NAME AGE
1  1  KIM  25
2  2  LEE  24
3  3 PARK  26
4  4 JANG  24
5  5 CHOI  24

mydata2 <- read.table("temp/data2.txt", header=T)
mydata2
  ID NAME AGE
1  6  MUN  25

# rbind() 를 통해 두 데이터의 행을 합친다.
mydata3 <- rbind(mydata, mydata2)
mydata3
  ID NAME AGE
1  1  KIM  25
2  2  LEE  24
3  3 PARK  26
4  4 JANG  24
5  5 CHOI  24
6  6  MUN  25

# 새로운 컬럼과 열 데이터를 생성한다.
mydata4 <- read.table("temp/data3.txt", header=T)
mydata4
     SEX
1   MALE
2 FEMALE
3   MALE
4   MALE
5 FEMALE
6 FEMALE

# cbind() 로 두 데이터의 열을 합친다.
mydata5 <- cbind(mydata3, mydata4)
mydata5
  ID NAME AGE    SEX
1  1  KIM  25   MALE
2  2  LEE  24 FEMALE
3  3 PARK  26   MALE
4  4 JANG  24   MALE
5  5 CHOI  24 FEMALE
6  6  MUN  25 FEMALE

# 데이터[-행 번호,] 로 행을 삭제한다.
mydata6 <- mydata5[-1,]
mydata6
  ID NAME AGE    SEX
2  2  LEE  24 FEMALE
3  3 PARK  26   MALE
4  4 JANG  24   MALE
5  5 CHOI  24 FEMALE
6  6  MUN  25 FEMALE

# 여러 행을 삭제하려면, 데이터[-c(행 번호, 행 번호),] 로 삭제한다. 마지막 콤마에 주의한다.
mydata7 <- mydata5[-c(2,5),]
mydata7
  ID NAME AGE    SEX
1  1  KIM  25   MALE
3  3 PARK  26   MALE
4  4 JANG  24   MALE
6  6  MUN  25 FEMALE

# 열을 삭제하려면 콤마를 앞에 붙힌다.
mydata8 <- mydata7[,-1]
mydata8
  NAME AGE    SEX
1  KIM  25   MALE
3 PARK  26   MALE
4 JANG  24   MALE
6  MUN  25 FEMALE


# TODO) 짝수,홀수 행 삭제하기
mydata8 <- mydata5[-c(which(MYDATA%%2 ==0))]

# 공공데이터 활용하기
# https://www.data.go.kr 회원가입 후 데이터 다운로드

# CSV 파일 
mydata <- read.csv("/Users/bangjaehun/Downloads/한국도로공사_교통사고통계_20191231.csv", header=T)
head(mydata, n = 5) # 데이터 5개 확인

  X.... X.....1 X.....2 X.....3
1  2000    3910     569    2845
2  2001    3638     456    2331
3  2002    3957     421    2115
4  2003    3585     348    1843
5  2004    3242     300    1555

# 엑셀 파일
mydata <- read_excel("[엑셀파일.xls]")
head(mydata, 5)

# Open API 로 다운로드 
# OpenAPI 요청 후 승인까지 시간이 좀 걸린다. 
# OpenAPI 로 xml/json 형태를 받아온다. 따라서 R 에서 패키지 2개를 다운받는다.(XML, rjson)
install.packages("XML") # XML 은 태그 형식으로 구성된다.
install.packages("rjson") # json 은 key=value 로 구성된다.

# 추가로 웹페이지를 읽는 기능이 필요하다. (RCurl)
install.packages("RCurl")

# 데이터 프레임을 선언하고, 요청 주소와 파라미터를 설정한다.
mydata <- data.frame()
reqUrl <- paste("[요청 주소]", "[필요한 분야, 카테고리]", "[서비스 키]", "[한 페이지 결과 수]", "[페이지 번호]", "[발급받은 key]")

# 필요한 라이브러리 호출
library(XML)
library(RCurl)
library(plyr)

# TODO)
# 총 데이터 개수와 총 페이지 수 구하기
# 한 페이지에서 데이터 가져오기

# 결과를 csv 파일로 저장
write.csv(mydata, "약국정보.csv")


