install.packages("plotly")

library(plotly)

summary(cars) # ���� ��跮

x <- 3
y <- 2
x+y

rm(x,y) # ��ü ���� 

ls() # check memory

x <- c(1,2,3,4,5,6,7)
y <- c(8,8,8)
b <- c(x,y)
b

A <- 1:15
A

AA <- seq(1,15, 3) # 3�� �����ϸ鼭 ���� �߰�
AA
B <- seq(1,15,length=5) # 5���� ����
B

C <- rep(0,15) # �ݺ� 
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
c1*c2 # ���Ұ��� ��
c1%*%c2 # ��İ�
c1
t(c1) # ��ġ���
solve(c1) # �����

c1[1,1] # Ư�� ���
c1[2,]


# ��͹�
for( i in 1:5) {
  print(paste("���ڸ� ����..", i))
}

i<-1
while(i<=5){
  print(paste("���ڸ� ����..", i))
  i <- i + 1
}

#Apply �Լ�
data(trees) 
str(trees) # data�� ũ�� �˾ƺ��� - 3���� ����, 31�� ������
?trees

nrow(trees)
ncol(trees)

trees[1:10,] # 10�� row�� ���

head(trees)

# Loop ���Ƽ� ���� ��� ���ϱ�
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

# apply�� ������ ����ϱ�
apply(trees.H <- trees[1:30,], 2, mean)

test_func <-function(a,b,c) {
  
  c <- a + b
  print(c)
}
test_func(1,2,3)