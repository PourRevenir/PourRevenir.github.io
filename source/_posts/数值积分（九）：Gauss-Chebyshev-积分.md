---
title: 数值积分（九）：Gauss-Chebyshev 积分
date: 2024-09-23 07:48:57
tags: 数值积分
categories: 数值计算和程序设计
---
## 关于 Chebyshev 多项式

Chebyshev 多项式来自于 `Chevyshev 微分方程`

$$
(1-x^2)\dfrac{\mathrm{d}^2y}{\mathrm{d}x^2}-x\dfrac{\mathrm{d}y}{\mathrm{d}x}+n^2y=0\tag{9.1}
$$

$$
(1-x^2)\dfrac{\mathrm{d}^2y}{\mathrm{d}x^2}-3x\dfrac{\mathrm{d}y}{\mathrm{d}x}+n(n+2)y=0\tag{9.2}
$$

式 (9.1) 的解称为 `第一类 Chebyshev 多项式`，式 (9.2) 的解被称为`Chebyshev 多项式`.

第一类 Chebyshev 多项式写成三角形式即为

$$
T_n(x)=\cos(n\arccos x),\ -1<x<1\tag{9.3}
$$

令 $x=\cos\theta$ 即可得到

$$
T_n(\cos\theta)=\cos n\theta \tag{9.4}
$$

可以看出 $T_n(x)$ 是 $n$ 次代数多项式，使用 Euler 公式处理可得

$$
T_n(x)=\cos n\theta = \dfrac{\mathrm{e}^{\mathrm{j}n\theta}+\mathrm{e}^{-\mathrm{j}n\theta}}{2}=\dfrac{(\cos\theta+\mathrm{j}\sin\theta)^n-(\cos\theta-\mathrm{j}\sin\theta)^n}{2}=\dfrac{(x+\sqrt{1-x^2})^n+(x-\sqrt{1-x^2})^n}{2}
$$

设 $x^n$ 项的系数为 $a_n$ ，可以求出

$$
a_n=\lim_{x\to\infty}\dfrac{T_n(x)}{x^n}=2^{n-1}\tag{9.5}
$$

由式 （9.4）可得在 $[-1,1]$ 上有 $|T_n(x)|\leqslant1$，并且有 $n$ 给不相等的实根

$$
x_k=\cos\dfrac{(2k-1)\pi}{2n},\ k=1,2,\cdots,n
$$
