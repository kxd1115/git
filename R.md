# R语言

## 一、数据结构

#### 向量
- R语言中下标是从1开始
- 向量b的输出结果等价于向量a
```
a <- c(1,2,3,4,5,6)
b <- c(1:6)	

```
> seq()和rep()

```R
seq(from=1, to=100, by=2)
# 创建一个从1到100的等差数列，差值是2

rep(x, 5)
# 将x重复5次
```

> 向量可以直接作为一个整体被运算符运算

```R
x <- c(1,2,3,4,5)
y <- x * 5
y
 [1] 5 10 15 20 25
length(x) # 查询向量x包含的值得数量
x[2] # 索引向量中第二个值
x[c(4:18)] # 索引向量中第4到第18个值
x[c(1,4,5,7)] # 索引指定位置的值

# 可以利用逻辑值索引，将索引值为T的找出来
y <- c(1:20)
y
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
y[c(T,F,T,F)]
 [1]  1  3  5  7  9 11 13 15 17 19
y[y>4 & y<10]
[1] 5 6 7 8 9

# 在向量中增加值
v <- 1:3
v
[1] 1 2 3
v[c(4,5,6)] <- c(4,5,6)
v
[1] 1 2 3 4 5 6
v[20] <- 4
v
 [1]  1  2  3  4  5  6 NA NA NA NA NA NA NA NA NA NA NA NA NA  4
append(x=v, values = 99, after=5)
 [1]  1  2  3  4  5 99  6 NA NA NA NA NA NA NA NA NA NA NA NA NA  4
rm(v) # 删除某个向量


names(y) # 为向量中的每一个值命名
```

###### 备注：

###### 1. 向量内的数值都必须是同一种数据类型

###### 2. 向量化编程的好处：R首先是作为一个统计软件来使用的，向量化编程能够提高统计效率！

###### 3. R中的索引是从1开始

#### 矩阵

```
y <- matrix(1:20, nrow=5, ncol=4)
```
``` R
z <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))
> z
>    C1 C2
> R1  1 26
> R2 24 21

# 索引
z[1,1] # 查询第一行，第一列的值
z[,1] # 查询第一列的值
z[1,] # 查询第一行的值

# 矩阵运算(当矩阵中的值都是数值时，可以直接进行运算)
z * 1 
z + z #矩阵相加时，不同的矩阵之间行和列必须一致

colSums(z) # 以列求和
rowMeans(z) # 以行求和
colMeans(z) # 以列求平均值
rowMeans(z) # 以行求平均值
dig(z) # 求一个矩阵的对角线的值
t(z) # 转换行和列
```
#### 数组
- 数组的维度可以＞2
- 下面是一个2 X 3 X 4的数组
> dimnames对应的dim1,dim2,dim3对应c(2,3,4)中的各维度的名称
```
dim1 <- c("a1", "a2")
dim2 <- c("b1", "b2", "b3")
dim3 <- c("c1", "c2", "c3", "c4")
h <- array(1:24, c(2,3,4), dimnames=list(dim1,dim2,dim3))
> h
, , c1

   b1 b2 b3
a1  1  3  5
a2  2  4  6

, , c2

   b1 b2 b3
a1  7  9 11
a2  8 10 12

, , c3

   b1 b2 b3
a1 13 15 17
a2 14 16 18

, , c4

   b1 b2 b3
a1 19 21 23
a2 20 22 24
```
##### 矩阵和数组的部分常规操作



#### 数据框

- 类似于excel表格的结构，python中的dataframe
```R
patinentID <- c(1,2,3,4)
age <- c(24, 23, 22, 21)
diabetes <- c("type1", "type2", "type3", "type4")
patientdata <- data.frame(patinentID, age, diabetes)
> patientdata
  patinentID age diabetes
1          1  24    type1
2          2  23    type2
3          3  22    type3
4          4  21    type4

patientdata[1:2] #选取1-2列
  patinentID age
1          1  24
2          2  23
3          3  22
4          4  21
patientdata[c("age", "diabetes")] # 选取特定列
  age diabetes
1  24    type1
2  23    type2
3  22    type3
4  21    type4
```

#### 基础函数

- ls()

> 展示目前程序中的变量名称，并可以呈现出变量的类型和值

```R
> ls()
[1] "z"
> ls.str()
z :  num 1
```

- rm()

> 删除某个变量

```R
rm(list=ls())
```

- 转移所有已安装的R包

```R
Rpack <- installed.packages()[,1]
save(Rpack, file="Rpack.Rdata")
```

#### 缺失值

- R语言中，使用NA来代表缺失值



## 二、读取文件

- read.table()

```R
matrix_1 <- read.table("C:/Users/kxd18/Desktop/RData/matrix.csv", header = T, sep = ",")
```

###### 	常用参数说明

1. header：表示文件第一行是否包含变量名
2. sep：指定文件中分开数据值的分隔符
3. row.names：指定行名
4. col.names：指定列名（当header=F时，用于指定列的名称，如果忽略，列名会被命名为V1，V2……）
5. skip：读取数据前可以设置需要跳过的行数

> 其他参数可以使用`help(read.table)`查看

- 导入excel文件

```R
lirbrary(xlsx)
read.xlsx(file, 1) # 导入文件中的第一个工作表
```

- 访问数据库管理系统

1. ODBC接口

```R
install.packages("RODBC")  #安装相关包
odbcConnect(dsn, uid="", pwd="")  #建立连接
sqlFetch(channel, sqltable) #读取数据库中的某个表到一个数据框中
sqlQuery(channel, query) #提交查询并返回结果
close(chanel) #关闭连接
```

2. DBI相关包

- 处理数据对象的实用函数

```R
length(object) # 显示对象中成分的数量
head(object) # 显示前几行
tail(object) # 显示最后几行
……
```

## 三、初阶图形

- 使用图形

```R
pdf("mygraph.pdf") # 将图形保存为pdf
attach(mtcars) # 访问数据集mtcars
plot(wt, mpg) # 画图（横轴wy，纵轴mpg）
abline(lm(mpg~wt)) # 添加趋势线
title("Regression of MPG on weight") # 设置图标标题
detach(mtcars) # 从该数据集中退出
dev.off() # 关闭图形设备

```

```R
# 将图形保存为其他形式
win.metafile()
png()
jpeg()
bmp()
tiff()
xfig()
postscript()
```

```R
dev.set()
# 指定一个特定的设备为活跃设备，但若没有那个指定的设备，等同于dev.next();若指定设备的值为1，则打开一个新的设备，并且指定那个设备为活跃设备。返回新设备的名字和编号。

dev.new()
# 打开一个新的设备。R中经常根据需要自动的打开新的设备，但也能使用跨平台的方式打开更多的设备；返回新设备的名字和编号。

dev.cur()
# 查看当前的活跃设备；返回包含当前活跃设备的名字和编号的向量；如果是返回值是1,空设备，即没有活跃设备。

dev.next()
# 查看紧随当前活跃进程的下一个进程；返回其名字和编号。

dev.prev()
# 查看当前活跃进程的前一个进程；返回其名字和编号。
```

- example

```R
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type = "b") # plot(x, y, type="b") x轴，y轴，type="b"表示同时绘制点和线
```

- 图形参数

> 用来自定义设置一幅图形的多个特征

1. 使用函数par()指定图形参数

```R
opar <- par(no.readonly=TRUE)  # 复制图形参数
par(lty=2, pch=17)             # 修改为虚线（lty=2），点符号改为三角形（pch=17）
plot(dose, drugA, type="b")    # 绘制图形
par(opar) 					   # 还原原始设置

# par()函数一次可以设置多个参数，也可以一次只设置一个参数

plot(dose, drugA, type="b", lty=2, pch=17)
# 仅对这幅图本身有效
```

- 符号和线条

```R
pch		#指定绘图的点使用的符号
cex		#指定点符号的大小
lty		#指定线条类型
lwd		#指定线条宽度
```

- 颜色

```R
col 	#默认绘图颜色	→ 可以使用颜色下标、颜色名称、十六进制颜色值、RGB值或者HSV值来指定颜色
col.axis #坐标轴刻度文字的颜色
col.lab  #坐标轴标签的颜色
col.main #标题颜色
col.sub  #副标题颜色
fg 		 #前景色
bg 		 #背景色

# 函数colors()会返回所有颜色的名称
# R有一个包（RColorBrewer）可以创建好看的颜色组合
```

- 文本属性

```R
cex 	#表示相对默认大小缩放倍数的数值
cex.axis #坐标轴刻度文字缩放倍数
cex.lab  #坐标轴标签名称缩放倍数
cex.main #标题缩放倍数
cex.sub  #副标题缩放倍数
```

```R
font    #整数，指定字体样式
font.axis #坐标轴刻度的字体样式
font.lab  #坐标轴标签的字体样式
font.main #标题的字体样式
font.sub  #副标题的字体样式
ps 		  #字体磅值（文字大小）
family    # 绘制文本时使用的字体族

par(font.lab=3, cex.lab=3, font.main=4, cex.main=2)
# 执行该语句之后，后面所有的代码都会有斜体，1.5倍于默认字体的坐标轴标签名称
```

- 图形的大小和尺寸

```R
pin 	# 以英寸表示的图形尺寸
mai		# 以数值向量表示的边界大小，顺序是“下，左，上，右”，单位是英寸
mar		# 以数值向量表示的边界大小，顺序是“下，左，上，右”，单位是英分
```



