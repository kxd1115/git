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

###### 备注：向量内的数值都必须是同一种数据类型

#### 矩阵

```
y <- matrix(1:20, nrow=5, ncol=4)
```
```
z <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))
> z
>    C1 C2
> R1  1 26
> R2 24 21
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

