---
title: Legendre 多项式（三）：Legendre 多项式的正交性及广义 Fourier 变换
date: 2024-08-28 21:03:31
tags: Legendre 多项式
categories: 数学物理方法
---
$n$ 阶 Legendre 多项式肯定是 $n$ 阶 Legendre 方程的解，对 $m$ 阶同理，因此有

$$(1-x^2)\dfrac{\mathrm{d}^2P_n(x)}{\mathrm{d}x^2}-2x\dfrac{\mathrm{d}P_n(x)}{\mathrm{d}x}+n(n+1)P_n(x)\equiv 0\tag{3.1}$$

$$(1-x^2)\dfrac{\mathrm{d}^2P_m(x)}{\mathrm{d}x^2}-2x\dfrac{\mathrm{d}P_m(x)}{\mathrm{d}x}+m(m+1)P_m(x)\equiv 0\tag{3.2}$$

将 $(1)\times P_m(x)-(2)\times P_n(x)$ 在 $[-1,1]$ 上积分可得

$$\int^1_{-1}\left(P_m(x)\dfrac{\mathrm{d}}{\mathrm{d}x}\left((1-x^2)\dfrac{\mathrm{d}P_n(x)}{\mathrm{d}x}\right)-P_n(x)\dfrac{\mathrm{d}}{\mathrm{d}x}\left((1-x^2)\dfrac{\mathrm{d}P_m(x)}{\mathrm{d}x}\right)\right)\mathrm{d}x+[n(n+1)-m(m+1)]\int^1_{-1}P_n(x)P_m(x)\mathrm{d}x\equiv 0\tag{3.3}$$

对上式第一项使用分部积分法，得到

$$\left.(1-x^2)\dfrac{\mathrm{d}}{\mathrm{d}x}(P_m(x)-P_n(x))\right|^1_{-1}+\int^1_{-1}(1-x)^2\left(\dfrac{\mathrm{d}P_m(x)}{\mathrm{d}x}\dfrac{\mathrm{d}P_n(x)}{\mathrm{d}x}-\dfrac{\mathrm{d}P_n(x)}{\mathrm{d}x}\dfrac{\mathrm{d}P_m(x)}{\mathrm{d}x}\right)\mathrm{d}x+(n(n+1)-m(m+1))\int^1_{-1}P_n(x)P_m(x)\mathrm{d}x\equiv0\tag{3.4}$$

那么显然，上式第一项为0，第二项也为0，因此可以得到

$$(n(n+1)-m(m+1))\int^1_{-1}P_n(x)P_m(x)\mathrm{d}x\equiv 0\tag{3.5}$$

如果 $n\neq m$ ，自然有

$$\int^1_{-1}P_n(x)P_m(x)\mathrm{d}x\equiv0\tag{3.6}$$

这说明，**不同阶 Legendre 多项式具有正交性**.

因此，Legendre 多项式可以作为 $[-1,1]$ 上连续函数空间的正交完备基底，即

$$f(x)=\sum^{\infty}_ {l=0}A_lP_l(x)\tag{3.7}$$

其中

$$A_l=\dfrac{1}{\int^1_{-1}P_l^2(x)\mathrm{d}x}\int^1_{-1}f(x)P_l(x)\mathrm{d}x\tag{3.8}$$

这种以一组正交基分解的方式被称为`广义 Fourier 变换`.
