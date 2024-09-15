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

由 Legendre 多项式的性质，可以取 Legendre 多项式的根作为 Gauss 点，从而得到 `Gauss-Legendre 积分`.
