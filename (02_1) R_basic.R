install.packages("plotly")

library(plotly)

summary(cars) # 기초 통계량

x <- 3
y <- 2
x+y

rm(x,y) # 객체 삭제 

ls() # check memory

x <- c(1,2,3,4,5,6,7)
y <- c(8,8,8)
b <- c(x,y)
b

A <- 1:15
A

AA <- seq(1,15, 3) # 3씩 증가하면서 숫자 추가
AA
B <- seq(1,15,length=5) # 5개로 분할
B

C <- rep(0,15) # 반복 
C

X <- 1:10
Y <- 1:10
X*Y

spd <- cars$speed

mean(spd)

var(spd)

# Matrix
a <- c(1,2,3)
b <- c(4,5,6)
c <- cbind(a,b)
c

c<-matrix(c(1,2,3,4,5,6), nrow=2)
c

c1 <- matrix(c(1,2,3,4), nrow=2)
c2 <- matrix(c(1,1,1,1), nrow=2)
c1*c2 # 원소간의 곱
c1%*%c2 # 행렬곱
c1
t(c1) # 전치행렬
solve(c1) # 역행렬

c1[1,1] # 특정 행렬
c1[2,]


# 재귀문
for( i in 1:5) {
  print(paste("숫자를 찍어요..", i))
}

i<-1
while(i<=5){
  print(paste("숫자를 찍어요..", i))
  i <- i + 1
}

#Apply 함수
data(trees) 
str(trees) # data의 크기 알아보기 - 3개의 변수, 31개 관측값
?trees

nrow(trees)
ncol(trees)

trees[1:10,] # 10개 row만 취득

head(trees)

# Loop 돌아서 직접 평균 구하기
k <- 30
sum.height <- 0
sum.girth <- 0
sum.volume <- 0
for ( i in 1:k) {
  sum.height = sum.height + trees[i,]$Height
  sum.girth = sum.girth + trees[i,]$Girth
  sum.volume = sum.volume + trees[i,]$Volume
}

print(sum.girth/k)
print(sum.height/k)
print(sum.volume/k)

# apply로 빠르게 계산하기
apply(trees.H <- trees[1:30,], 2, mean)

test_func <-function(a,b,c) {
  
  c <- a + b
  print(c)
}
test_func(1,2,3)
