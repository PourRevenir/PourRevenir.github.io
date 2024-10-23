---
title: 数值积分（八）：Guass-Legendre 积分
date: 2024-09-11 18:15:09
tags:tags: 数值积分
categories: 数值计算和程序设计
---
## 关于 Legendre 多项式

详见 [Legendre 多项式（二）：Legendre 多项式](https://pourrevenir.github.io/2024/08/07/Legendre-%E5%A4%9A%E9%A1%B9%E5%BC%8F%EF%BC%88%E4%BA%8C%EF%BC%89%EF%BC%9ALegendre-%E5%A4%9A%E9%A1%B9%E5%BC%8F/)

Legendre 多项式由下列表达式定义

$$
P_0(x) = 1
$$

$$
P_n(x) = \dfrac1{2^nn!}\dfrac{\mathrm{d}^n}{\mathrm{d}x^n}\left[(x^2-1)^n\right],\ n=1,2,\cdots\tag{8.1}
$$

Legendre 具备以下性质：

- 正交性：不同阶 Legendre 多项式在 $[-1,1]$ 上正交.

$$\int^1_{-1}P_n(x)P_m(x)\mathrm{d}x\equiv0,\ n\neq m\tag{8.2}$$

- 递推性：可以推导出 $P_0(x)=1,\ P_1(x)=x$，且满足递推关系

$$
P_{n+1}(x)=\dfrac{2n+1}{n+1}xP_n(x)-\dfrac{n}{n+1}P_{n-1}(x),\ n=1,2,\cdots\tag{8.3}
$$

- Legendre 多项式的根为在 $[-1,1]$ 上的实根，且彼此不相等.

## Gauss-Legendre 积分

更详细的介绍可以阅读 Wolfram MathWorld 的相关文档 [Legendre-GaussQuadrature](https://mathworld.wolfram.com/Legendre-GaussQuadrature.html)

由 Legendre 多项式的性质，当 $\rho(x)=1$ 时，且积分区间为 $[-1,1]$ ，Legendre 多项式的根即为 Gauss 点，从而得到 `Gauss-Legendre 积分`.

$$
\int^1_{-1}f(x)\mathrm{d}x\approx\sum^n_{k=0}A_kf(x_k)\tag{8.4}
$$

其误差余项为

$$
E_{n+1}=\dfrac{2^{2n+3}[(n+1)!]^4}{(2n+3)[(2n+2)!]^3}\dfrac{\mathrm{d}^{2n+2}f(\xi)}{\mathrm{d}x^{2n+2}},\ \xi\in(-1,1)\tag{8.5}
$$

对于 $[a,b]$ 上的积分，只需做线性变换即可得

$$
\int^b_af(x)\mathrm{d}x=\dfrac{b-a}{2}\int^1_{-1}f(\dfrac{b-a}{2}t+\dfrac{a+b}{2})\mathrm{d}t\tag{8.6}
$$
