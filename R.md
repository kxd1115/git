# R语言

## 数据结构

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

## 基础函数

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

