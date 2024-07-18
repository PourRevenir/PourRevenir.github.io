---
title: 数值积分（四）：Newton-Cotes 公式
date: 2024-07-18 12:27:06
tags: 数值积分
categories: 数值计算和程序设计
---
## 梯形法则和中矩法则

计算定积分

$$I=\int^b_af(x)\mathrm{d}x\tag{4.1}$$

一种思路是利用`积分中值定理`对其进行近似.

{% note warning simple%}
**Theorem 4.1**

$$\exists\ \xi\in(a,b),\ \text{s.t.}\int^b_af(x)\mathrm{d}x=f(\xi)(b-a)$$

{% endnote%}

这就需要对 $f(\xi)$ 进行近似. 显然可以用计算区域两端的函数值平均对其进行近似，这样就会得到`梯形公式`

$$I=\int^b_af(x)\mathrm{d}x=\dfrac{f(b)-f(a)}{2}(b-a)\tag{4.2}$$

采用计算区域中点的函数值对其进行近似，就会得到`中矩公式`

$$I=\int^b_af(x)\mathrm{d}x=f(\frac{b-a}{2})(b-a)\tag{4.3}$$

## Simpson 法则


