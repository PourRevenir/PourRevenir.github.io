---
title: 数值积分（十）：Gauss 型积分总结
date: 2024-09-24 18:41:54
tags: 数值积分
categories: 数值计算和程序设计
---
## Gauss 型求积公式

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档[GaussianQuadrature](https://mathworld.wolfram.com/GaussianQuadrature.html)

在前面我们已经讨论了 Gauss-Legendre 求积公式和 Gauss-Chebyshev 求积公式，其基本思想均来自于 Thm 7.2，除此之外还有几类 Gauss 型求积公式，在这里做一个列表进行汇总

|权函数 $\rho(x)$|积分区间|$x_k$ 作为根所对应的多项式|
|:---|:---|:---|
|$1$|$(-1,1)$|$P_n(x)$ `Legendre多项式`|
|$e^{-x}$|$(0,+\infty)$|$L_n(x)$`Laguerre多项式`|
|$e^{-x^2}$|$(-\infty,+\infty)$|$H_n(x)$`Hermite多项式`|
|$\dfrac{1}{\sqrt{1-x^2}}$|$(-1,1)$|$T_n(x)$`第一类 Chebyshev 多项式`|
|$\sqrt{1-x^2}$|$(-1,1)$|$U_n(x)$`第二类 Chebyshev 多项式`|
|$\sqrt{x}$|$(0,1)$|$\sqrt{x}P_{2n+1}(\sqrt{x})$|
|$\dfrac{1}{\sqrt{x}}$|$(0,1)$|$P_{2n}(\sqrt{x})$|
|$(1-x)^\alpha(1+x)^\beta$|$(-1,1)$|$P_n^{(\alpha,\beta)}$`Jacobi 多项式`，当 $\alpha=\beta=0$ 时退化为 Legendre 多项式|

这里顺带列出上述几种多项式作为解对应的微分方程

|多项式|微分方程|
|:---|:---|
|$P_n(x)$|$(1-x^2)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-2x\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+n(n+1)y(x)=0$|
|$L_n(x)$|$x\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}+(1-x)\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+ny(x)=0$|
|$H_n(x)$|$\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-2x\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+2ny(x)=0$|
|$T_n(x)$|$(1-x)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-x\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+n^2y(x)=0$|
|$U_n(x)$|$(1-x^2)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-3x\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+n(n+2)y(x)=0$|
|$P_n^{(\alpha,\beta)}$|$(1-x^2)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}+[\beta-\alpha-(\alpha+\beta+2)x]\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+n(n+\alpha+\beta+1)y(x)=0$|

### Gauss-Laguerre 积分

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档 [Laguerre-GaussQuadrature](https://mathworld.wolfram.com/Laguerre-GaussQuadrature.html)

$$\int^{+\infty} _ 0e^{-x}f(x)=\sum^n _ {k=0}A_kf(x_k)$$

求积系数

$$A_k=\dfrac{x_k}{(n+2)^2L^2_{n+2}(x_k)}$$

误差余项

$$E_{n+1}=\dfrac{(n+1)!^2}{(2n+2)!}\dfrac{\mathrm{d}^{2n+2}f(\xi)}{\mathrm{d}x^{2n+2}}$$

### Gauss-Hermite 积分

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档 [Hermite-GaussQuadrature](https://mathworld.wolfram.com/Hermite-GaussQuadrature.html)

$$\int^{+\infty} _ {-\infty}e^{-x^2}f(x)=\sum^n _ {k=0}A_kf(x_k)$$

求积系数

$$A_k=\dfrac{2^n(n+1)!\sqrt\pi}{(n+1)!H^2_n(x_k)}$$

误差余项

$$E_{n+1}=\dfrac{(n+1)!\sqrt\pi}{2^n(2n+2)!}\dfrac{\mathrm{d}^{2n+2}f(\xi)}{\mathrm{d}x^{2n+2}}$$

## 权函数、Gauss 系数和误差余项

在第 7 节中对此有较详细的介绍，这里做更一般的讨论. 主要思想还是进行 Lagrange 插值多项式进行拟合

$$
\omega_{n+1}(x)=\prod^n_{k=0}(x-x_k)\tag{10.1}
$$

$$
\omega_{n+1}'(x)=\prod^n_{i=0,i\neq k}(x_k-x_i)\tag{10.2}
$$

权函数的实际作用是用于归一化正交函数

$$
\phi(x)=\sum^n _ {k=0}\dfrac{\omega_{n+1}(x)}{(x-x_k)\omega'_ {n+1}(x_k)}f(x_k)\tag{10.3}
$$

$$
\int^b _ a\rho(x)\phi(x)\mathrm{d}x=\int^b _ a\sum^n _ {k=0}\dfrac{\rho(x)\omega _ {n+1}(x)}{(x-x_k)\omega' _ {n+1}(x_k)}f(x_k)\mathrm{d}x=\sum^n _ {k=0}A _ kf(x _ k)\tag{10.4}
$$

Gauss 系数

$$
A_k=\dfrac{1}{\omega_{n+1}'(x_k)}\int^b_a\dfrac{\rho(x)\omega_{n+1}(x)}{x-x_k}\mathrm{d}x\tag{10.5}
$$

$$
\phi_{k+1}(x)=a_{k+1}\omega_{n+1}(x)\tag{10.6}
$$

其中 $a_{k+1}$ 是 $\phi_{n+1}(x)$ 中 $x^{n+1}$ 项前的系数

$$
A _ k=\dfrac{1}{\phi' _ {n+1}(x)}\int^b _ a\rho(x)\dfrac{\phi(x)}{x-x _ k}\mathrm{d}x=-\dfrac{a _ {n+2}\gamma _ {n+1}}{a _ {n+1}\phi _ {n+1}'(x _ k)\phi _ {n+2}(x)}\tag{10.7}
$$

$$
\gamma_{n+1}=\int\rho(x)\phi^2_{n+1}\mathrm{d}x\tag{10.8}
$$

有递推关系

$$
\phi_{n+1}(x_k)=-\dfrac{a_{n+1}a_{n-1}}{a_n^2}\dfrac{\gamma_n}{\gamma_{n-1}}\phi_{n-1}(x_k)\tag{10.9}
$$

所得 Gauss 型求积公式对应的误差余项为

$$
E_{n+1}=\dfrac{1}{(2n+2)!}\dfrac{\mathrm{d}^{2n+2}f(\xi)}{\mathrm{d}x^{2n+2}}\int^b_a\rho(x)\omega^2_{n+1}(x)\mathrm{d}x=\dfrac{\gamma_{n+1}}{a^2_{n+1}}\dfrac{1}{(2n+2)!}\dfrac{\mathrm{d}f^{2n+2}(\xi)}{\mathrm{d}x^{2n+2}}\tag{10.10}
$$

## Gauss-Radau 积分

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档[RadauQuadrature](https://mathworld.wolfram.com/RadauQuadrature.html)

$$
\int^1_{-1}f(x)\mathrm{d}x\approx A_0f(-1)+\sum^n_{k=1}A_kf(x_k)
$$

$x_k$ 来自于多项式 $\dfrac{P_{n-1}(x)+P_n(x)}{1+x}$ 的根.

求积系数

$$
A_1=\dfrac{1}{n^2}
$$

$$
A_k=\dfrac{1}{(1-x_k){P'_n}^2(x_k)}
$$

误差余项

$$
E_{n+1}=\dfrac{2^{2n+1}(n+1)n!^4}{(2n+1)!^3}\dfrac{\mathrm{d}^{2n+1}f(\xi)}{\mathrm{d}x^{2n+1}}
$$

## Gauss-Lobatto 积分

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档 [LobattoQuadrature](https://mathworld.wolfram.com/LobattoQuadrature.html)

$$
\int^1_{-1}f(x)\mathrm{d}x\approx A_0f(-1)+A_nf(1)+\sum^{n-1}_{k=1}A_kf(x_k)
$$

$x_k$ 来自于多项式 $\dfrac{2}{n(n+1)P^2_n(x_k)}$ .

求积系数

$$
A_0=A_n=\dfrac{2}{n(n+1)}
$$

$$
A_k=\dfrac{2}{n(n+1)P_n^2(x_k)}
$$

误差余项

$$
E_{n+1}=-\dfrac{(n+1)n^32^{2n+1}(n-1)!^4}{(2n+1)2n!^3}\dfrac{\mathrm{d}^{2n+1}f(\xi)}{\mathrm{d}x^{2n+1}}
$$

MATLAB 函数为

```matlab
[q,func] = quadl(fun,a,b,tol,trace,p1,p2,...);
```

适用于精度要求高，被积函数曲线比较平滑的数值积分，速度和精度均较好.

## Gauss-Kronrod 积分

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档 [Gauss-KronrodQuadrature](https://mathworld.wolfram.com/Gauss-KronrodQuadrature.html)

求积公式为

$$
\int^1_{-1}f(x)\mathrm{d}x\approx \sum^n_{k=0}A_kf(x_k)+\sum^{n+1}_{j=0}B_jf(y_j)
$$

$x_k$ 为 $n$ 阶 Legendre 函数的根. 合理选取 $y_j$ 可使代数精度达到 $3n+4$. 事实上 $y_j$ 是 Stieltjes 多项式的根.

求积系数

$$
A _ k=\left[\dfrac{1}{p'  _ n(x _ k)E _ {n+1}(x _ k)}-\dfrac{1}{p _ n'(x _ k)p _ {n+1}(x _ k)}\right]\int^1 _ {-1}p' _ n(x)\mathrm{d}x
$$

$$
B_j=\dfrac{1}{p_n'(y_j)E_{n+1}'(y_j)}\int^1_{-1}p_n^2(x)\mathrm{d}x
$$

MATLAB 函数为

```matlab
[q,errbnd] = quadgk(fun,a,b,param1,val1,param2,val2,...)
```

适用于高精度和震荡数值积分，支持无穷区间，并且能够处理端点包含奇点的情况，同时还支持沿着不连续函数积分，复数域线性路径的围道积分法.
