library(ggplot2)
str(mtcars) #�������� ������ ���캻��
?mtcars

head(mtcars)

# scatter plot
# mpg ����, cyl : �Ǹ����� ����
qplot(mpg, cyl, data = mtcars, main = " �� �Ǹ��� ������ ���� ���� ���� ������.")
                                      # ���� ������ ���� �� �Ǹ����� ������ ������ ����?

qplot(mpg, hp, data = mtcars, main = " ���� ���� ���� ���� ������.")


# hybrid scatter plot
qplot(mpg, hp, data = mtcars, color= cyl, size = wt, main = " �Ǹ��� ������ ���� ���԰� ���� ��������, ���� �������� ���� ����.")

# ������׷� 
qplot(mpg,wt,data=mtcars,facets=cyl~.,colour=factor(cyl), #facets : ������ �׸���(cly~. : �Ǹ����� ����)
      ylab = "����", xlab = "����")

ggplot(data=mtcars, aes(x=disp, y=mpg, size=wt, color=cyl),
       main="��ⷮ�� ����� �������̴�. ") + 
  geom_point() + 
  stat_smooth(color='red', fill='green') # red line�� �������� �ŷڼ��� 95%

## Histogram and distribution
```{r}
par(mfrow=c(4,1))
hist(mtcars$mpg, breaks=30, 
     col=8, xlim=c(10, 35), main='��ü')
hist(mtcars$mpg[mtcars$cyl==4], breaks=30, 
     col=3, xlim=c(10, 35), main='4����') # cly =4
hist(mtcars$mpg[mtcars$cyl==6], breaks=30, 
     col=4, xlim=c(10, 35), main='6����') # cly =6
hist(mtcars$mpg[mtcars$cyl==8], breaks=30, 
     col=5, xlim=c(10, 35), main='8����') # cly =8

#

scale_colour_discrete <- function(...) # ���� ���� util �Լ�1
  scale_color_brewer(palette="Set1", ...)
scale_fill_discrete <- function(...) # ���� ���� util �Լ�2
  scale_fill_brewer(palette="Set1", ...)

mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5), # ��� ������ ���� ����
                      labels=c("3gears","4gears","5gears"))
mtcars$am <- factor(mtcars$am,levels=c(0,1), # Ʈ�����̼� ������ ���� ����
                    labels=c("Automatic","Manual"))
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8), # t�Ӥ����� �� ������ ���� ����
                     labels=c("4cyl","6cyl","8cyl"))
qplot(mpg, data=mtcars, geom="density", fill=cyl, 
      alpha=I(.5), main="�Ǹ��� ������ ���� ����", xlab="Miles Per Gallon",
      ylab="Density")
```

# �� ���� �� ����� �м�
data("mtcars") # ������ �ٽ� �ε�
cor(mtcars) # correlation coefficient ��� (symmetric matrix)

# �Ǿ �������� ������� ���� �� ������� charting
install.packages("corrplot")
install.packages("magrittr")
library(corrplot) # correlation test and visualization
library(magrittr) # pipe operator library : ������� ����

# mtcars �������� ��� ������ ������ ���� ���� ��, p-value�� ����
mtcars%>%cor.mtest(method='pearson')->p.value

#p.value����, ���� Ȯ���ϱ� 
str(p.value)

dev.new() # chart �׸��� device �غ� 
#�Ϲ�ȭ�� corr
mtcars %>% na.omit%>%cor %>% corrplot.mixed(p.mat=p.value[[1]], sig.level=.05, lower = 'number', upper='pie', tl.cex=.6, tl.col='black', order='hclust')
```