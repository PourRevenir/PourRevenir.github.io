---
title: Legendre 多项式（二）：Legendre 多项式
date: 2024-08-07 08:02:02
tags: Legendre 多项式
categories: 数学物理方法
---
求解如下 Legendre 方程

{% note info simple %}
$$
(1-x^2)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-2x\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+l(l+1)y(x)=0,\quad -1\leqslant x\leqslant 1\tag{2.1}
$$
{% endnote %}

需要注意 $y(x)$ 应当是有限的.

解这个方程就是一个 Liouville 本征值问题，对 $y(x)$ 进行幂级数展开 $y(x)=\sum^{\infty}_{n=0}a_nx^n$ ，可以得到系数满足

$$a_{k+2}=\dfrac{(k-1)(k+l+1)}{(k+1)(k+2)}a_k\tag{2.2}$$

解写成线性组合形式 $y=a_0y_0(x)+a_1y_1(x)$ . 可以看出幂级数的收敛半径为 $R=1$.

为了使其收敛，最好的办法是使其自然截断为多项式. 假设 $l$ 为偶数，则可以使

$$a_{l+2}=0,\ a_1=0$$

使 $y_0(x)$ 自然截断为多项式，并去掉依然发散的 $y_1(x)$ . 或者假设 $l$ 为奇数，使

$$a_{l+2}=0,\ a_0=0$$

使 $y_1(x)$ 自然截断为多项式，并去掉依然发散的 $y_0(x)$ .

复杂一点，写成 $a_l=\dfrac{(2l)!}{2^l(l!)^2}$ 则有

$$P_l(x)=\sum^N_{k=0}\dfrac{(-1)^k(2l-2k)!}{2^lk!(l-k)!(l-2k)!}x^{l-2k}\tag{2.3}$$

上式即为 `l-阶 Legendre 多项式`，其中当 $l$ 为偶数时 $N=\dfrac l2$ ，当 $l$ 为奇数时 $N=\dfrac {l-1}2$ .

从而我们可以得到各阶 Legendre 多项式，下面列出一部分

||
|:---|
|$P_0(x)=1$|
|$P_1(x)=x$|
|$P_2(x)=\dfrac12(3x^2-1)$|
|$P_3(x)=\dfrac12(5x^3-3x)$|
|$P_4(x)=\dfrac18(35x^4-30x^2+3)$|

绘制在一张图上

![Legendre 多项式](img\post8_fig1.svg)
