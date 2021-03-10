# R 기초 문법

# package 적용
# 1. 기본 패키지: 바로 사용
# 2. 추천 패키지(기본 패키지와 같이 자동으로 설치되는 패키지): library("[패키지 이름]")
# 3. 추가 패키지: install.packages("[패키지 이름]") 로 다운받고, library("[패키지 이름]") 으로 사용

# 주석 처리: #
# R의 주석입니다.

# 도움말 사용: ? [명령어]
? base # base 패키지에 대한 도움말을 엽니다.

# 변수 저장: [변수] <- 1 또는 1 -> [변수]
x <- 1 # 변수 x에 1을 저장합니다.
1 -> x # 이것도 가능해요.

x
[1] 1


# 벡터(여러 데이터 입력): c([데이터], ...)

# 자료형은 숫자(정수, 실수), 문자열, 불리언 등이 있다.
# 정수는 숫자 뒤에 L 을 붙힌다.
x <- 1 # x 는 실수형입니다.
y <- 1L # y 는 정수형입니다.
z <- "String" # z 는 문자열입니다.
o <- TRUE # o 는 불리언입니다.

# 자료형 확인: typeof([데이터])
typeof(x) # x의 타입을 조사합니다.
[1] "double"

typeof(y) 
[1] "integer"

typeof(z)
[1] "character"

typeof(o)
[1] "logical"


# 범주형 변수: factor(c(1, 2))
# 범주형 변수는 산술연산이 되지않는다.
mydata <- factor(c(1,2)) # factor 는 범주를 정의하고 범주내 데이터만 허용합니다.

mydata 
[1] 1 2
Levels: 1 2

mydata2 <- factor(3, c(1,2)) # 범주내 데이터 외의 값을 첫 인자로 가지면 NA 를 리턴합니다.
mydata2
[1] <NA>
Levels: 1 2

mydata[1] # 범주에서 level 1의 값은 1입니다.
[1] 1
Levels: 1 2

mydata[2] # 범주에서 level 2의 값은 2입니다.
[1] 2
Levels: 1 2

mydata[1] + mydata[2] # 범주형은 산술 연산을 하지 못한다.

mydata3 <- factor(levels=c(1, 2), labels=c('male', 'female')) # 레벨에 이름을 매핑

mydata3 # 값이 설정되지 않았다.
factor(0)
Levels: male female

# 산술 연산
1 + 2 # 더하기 3
1 - 2 # 빼기 -2
1 * 2 # 곱하기 2
1 / 2 # 나누기 0.5
5 ^ 2 # 지수승 25
5 ** 2 # 지수승 25
5 %% 2 # 나머지 1
5 %/% 2 # 몫 2

# 대입 연산
x <- 1
y <- 2
z <- x + y 

z # 3입니다.

# 관계 연산
x <- 1
y <- 2

x < y # TRUE 입니다.
x >= y # FALSE 입니다.
x == y # FALSE 입니다.

# 논리 연산
x <- 0
y <- 2

x & y # FALSE AND TRUE 는 FALSE 입니다.
x | y # FALSE OR TRUE 는 TRUE 입니다.
!x # NOT(FALSE) 는 TRUE 입니다.

# 제어문
x <- 0 

# x 가 FALSE 면 y에 5를 할당합니다.
if (!x) { 
+ y <- 5
+ }

# 5가 할당되었습니다.
y 
[1] 5

# i가 1부터 10까지 루프를 돌면서 i를 출력합니다. 두 줄 이상이면, 중괄호를 사용합니다.
for (i in 1:10) print(i) 

# 1부터 10까지의 벡터를 생성합니다.
p <- c(1:10) 

# 1부터 10까지 출력합니다.
for (i in p) print(i) 

i <- 0

# i는 0부터 9까지 출력됩니다. 명령문은 세미콜론으로 구분합니다.
while (i < 10) { print(i); i <- i + 1 } 

# 함수
# 함수의 반환값은 소괄호로 묶습니다.
sum <- function (a, b) { return(a+b) } 

sum(1,2) 
[1] 3

# 벡터와 리스트
x <- c(1, 2, 3, 4, 5) # 벡터는 1차원으로 같은 자료형을 여러개 담습니다.

x
[1] 1 2 3 4 5

z <- c(1, TRUE) # 같은 자료형이 아니므로 형변환 된다.
[1] 1 1

z <- c("1", TRUE) 
[1] "1" "TRUE"

y <- list(1, TRUE, "A", FALSE, 11) 

# 리스트는 대괄호가 두개 붙습니다.
y 
[[1]] 
[1] 1

[[2]]
[1] TRUE

[[3]]
[1] "A"

[[4]]
[1] FALSE

[[5]]
[1] 11

# 리스트에 접근합니다.
y[[3]]
[1] "A"

# 배열
# 벡터 x 를 3차원으로 변환시킨다.
x <- c(1:6)
dim(x) <- c(1, 2, 3) 

x 
, , 1

     [,1] [,2]
[1,]    1    2

, , 2

     [,1] [,2]
[1,]    3    4

, , 3

     [,1] [,2]
[1,]    5    6

# x:1 y:1 z:3 은 5가 출력된다.
x[1, 1, 3] 
[1] 5

# 데이터 프레임
id <- c(1, 2, 3, 4, 5)
name <- c("KIM", "LEE", "PARK", "JANG", "CHOI")
age <- c(25, 24, 26, 24, 24)

# data 패키지의 frame 함수를 사용해 데이터 프레임을 생성한다.
mydataframe <- data.frame(ID = id, NAME = name, AGE = age) 

# 데이터 프레임은 각 열이 다른 타입을 가질 수 있다. 
mydataframe 
  ID NAME AGE
1  1  KIM  25
2  2  LEE  24
3  3 PARK  26
4  4 JANG  24
5  5 CHOI  24

# 벡터를 행의 수를 5개로 하고, 행을 기준으로 나열한다.
mymatrix <- matrix(c(1, "KIM", 25, 2, "LEE", 24, 3, "PARK", 26, 4, "JANG", 24, 5, "CHOI", 24), 5, byrow=T) 

# 데이터 프레임과 메트릭스의 차이는 데이터 타입의 동일성이다. 인자인 벡터는 형변환된다.
mymatrix 

mydataframe2 <- data.frame(mymatrix)

# names() 로 열들의 이름을 설정한다.
names(mydataframe2) <- c("ID", "NAME", "AGE") 
