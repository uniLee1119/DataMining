library(ggplot2)
str(mtcars) #데이터의 구조를 살펴본다
?mtcars

head(mtcars)

# scatter plot
# mpg 연비, cyl : 실린더의 개수
qplot(mpg, cyl, data = mtcars, main = " 차 실린더 갯수가 많을 수록 연비가 안좋다.")
                                      # 연비가 안좋을 수록 차 실린더의 갯수가 증가로 수정?

qplot(mpg, hp, data = mtcars, main = " 연비가 좋을 수록 연비가 안좋다.")


# hybrid scatter plot
qplot(mpg, hp, data = mtcars, color= cyl, size = wt, main = " 실린더 갯수가 적고 무게가 적게 나갈수록, 힘은 약해져도 연비가 좋다.")

# 히스토그램 
qplot(mpg,wt,data=mtcars,facets=cyl~.,colour=factor(cyl), #facets : 나눠서 그리기(cly~. : 실린더에 대해)
      ylab = "무게", xlab = "연비")

ggplot(data=mtcars, aes(x=disp, y=mpg, size=wt, color=cyl),
       main="배기량과 연비는 역관계이다. ") + 
  geom_point() + 
  stat_smooth(color='red', fill='green') # red line을 기준으로 신뢰수준 95%

## Histogram and distribution
```{r}
par(mfrow=c(4,1))
hist(mtcars$mpg, breaks=30, 
     col=8, xlim=c(10, 35), main='전체')
hist(mtcars$mpg[mtcars$cyl==4], breaks=30, 
     col=3, xlim=c(10, 35), main='4기통') # cly =4
hist(mtcars$mpg[mtcars$cyl==6], breaks=30, 
     col=4, xlim=c(10, 35), main='6기통') # cly =6
hist(mtcars$mpg[mtcars$cyl==8], breaks=30, 
     col=5, xlim=c(10, 35), main='8기통') # cly =8

#

scale_colour_discrete <- function(...) # 색을 위한 util 함수1
  scale_color_brewer(palette="Set1", ...)
scale_fill_discrete <- function(...) # 색을 위한 util 함수2
  scale_fill_brewer(palette="Set1", ...)

mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5), # 기어 명목형 변수 선언
                      labels=c("3gears","4gears","5gears"))
mtcars$am <- factor(mtcars$am,levels=c(0,1), # 트랜스미션 명목형 변수 선언
                    labels=c("Automatic","Manual"))
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8), # tㅣㄹ린더 수 명목형 변수 선언
                     labels=c("4cyl","6cyl","8cyl"))
qplot(mpg, data=mtcars, geom="density", fill=cyl, 
      alpha=I(.5), main="실린더 개수별 연비 분포", xlab="Miles Per Gallon",
      ylab="Density")
```

# 각 변수 간 상관성 분석
data("mtcars") # 데이터 다시 로드
cor(mtcars) # correlation coefficient 계산 (symmetric matrix)

# 피어슨 상관계수를 기반으로 변수 간 상관성을 charting
install.packages("corrplot")
install.packages("magrittr")
library(corrplot) # correlation test and visualization
library(magrittr) # pipe operator library : 결과값을 연결

# mtcars 데이터의 모든 변수간 상관계수 검정 진행 후, p-value로 저장
mtcars%>%cor.mtest(method='pearson')->p.value

#p.value구조, 변수 확인하기 
str(p.value)

dev.new() # chart 그리기 device 준비 
#일반화된 corr
mtcars %>% na.omit%>%cor %>% corrplot.mixed(p.mat=p.value[[1]], sig.level=.05, lower = 'number', upper='pie', tl.cex=.6, tl.col='black', order='hclust')
```