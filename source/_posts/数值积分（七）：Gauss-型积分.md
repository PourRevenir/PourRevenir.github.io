---
title: 数值积分（七）：Gauss 型积分
date: 2024-09-08 13:46:00
tags: 数值积分
categories: 数值计算和程序设计
---
按照前面所介绍的思想，利用`积分中值定理`

{% note danger simple%}
$$
\int^b_af(x)\mathrm{d}x=(b-a)f(\xi),\ \xi\in(a,b)
$$
{% endnote %}

选取 $[a,b]$ 上离散点函数值的加权平均值作为 $f(\xi)$ 的近似值，得到`机械求积公式`

$$\int^b_af(x)\mathrm{d}x\approx \sum^n _{k=0}A_kf(x_k)\tag{7.1}$$

将定积分的计算转化成被积函数的函数值计算，其中 $A_k$ 是求积系数， $f(x_k)$ 是求积节点.

## 代数精度

{% note info simple%}
**Definition 7.1**

如果对于所有次数不超过 $m$ 的多项式 $f(x)$，求积公式都精确成立，但对次数为 $m+1$ 的多项式不精确成立，则称该求积公式具有 $m$ 次`代数精度`.

{% endnote %}

> 以 Simpson 法则为例
>
> $$\int^b_af(x)\mathrm{d}x\approx\dfrac{b-a}{6}\left[f(a)+4f\left(\dfrac{a+b}{2}\right)+f(b)\right]$$
>
> 具备三次代数精度.

## Gauss 型求积公式

考虑式 (7.1) 的求积公式，共有 n+1 个节点与 n+1 个系数，共 2n+2 个参数，因此可构造出代数精度至少为 2n+1 的求积公式. 注意，**等分点并不是最佳的求积节点**.

> 以下面这个求积公式为例
>
> $$\int^1_{-1}f(x)\mathrm{d}x\approx A_0f(x_0)+A_1f(x_1)$$
>
> 构造 $f(x)=1,x,x^2,x^3$ 代入求积公式，使其精确成立，得到四个待定系数方程
>
> $$\begin{cases}A_0+A_1=2\\A_0x_0+A_1x_1=0\\A_0x_0^2+A_1x_1^2=\dfrac23\\A_0x_0^3+A_1x_1^3=0\end{cases}$$
>
> 可以解出系数 $A_0=1,\ A_1=1$，节点 $x_0=-\dfrac{\sqrt{3}}{3},\ x_1=\dfrac{\sqrt{3}}{3}$
>
> 从而得到求积公式
>
> $$\int^1_{-1}f(x)\mathrm{d}x\approx f\left(-\dfrac{\sqrt{3}}{3}\right)+f\left(\dfrac{\sqrt{3}}{3}\right)$$
>
> 该公式对 $f(x)=x^4$ 不精确成立，故有 3 次代数精度.

一般的，考虑机械求积公式

$$\int^b_af(x)\mathrm{d}x\approx \sum^n _{k=0}A_kf(x_k)$$

{% note info simple %}
**Definition 7.2**

若存在节点 $x_k\in[a,b]$ 即系数 $A_k$，使得机械求积公式具有 $2n+1$ 次代数精度，则称节点 $x_k$ 为 `Gauss 点`，$A_k$ 为 `Gauss 系数`，求积公式为 `Gauss 型求积公式`.
{% endnote %}

**Gauss 型求积公式在所有机械求积公式中代数精度最高**.

确定 Gauss 点和 Gauss 系数共有两种方法，一种是解非线性方程组，此法较为困难；另一种是先确定 Gauss 点，再通过解线性方程组确定 Gauss 系数.
