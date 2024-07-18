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

{% note danger simple%}
**Theorem 4.1**

$$\exists\ \xi\in(a,b),\ \text{s.t.}\int^b_af(x)\mathrm{d}x=f(\xi)(b-a)$$

{% endnote%}

这就需要对 $f(\xi)$ 进行近似. 显然可以用计算区域两端的函数值平均对其进行近似，这样就会得到`梯形法则`

$$I=\int^b_af(x)\mathrm{d}x=\dfrac{f(b)+f(a)}{2}(b-a)\tag{4.2}$$

采用计算区域中点的函数值对其进行近似，就会得到`中矩法则`

$$I=\int^b_af(x)\mathrm{d}x=f(\frac{b+a}{2})(b-a)\tag{4.3}$$

由于中矩法则需要中点的函数值，因此在实际中应用较少. 为了方便编写数值计算程序，用 $x_0$ 代替 $a$，用 $h$ 代替步长 $\Delta x$，计算点即 $x_k=x_0+hk$，用 $f_k$ 代替 $f(x_k)$. 由于式 (4.2) 中只需要两个点，因此可写成

$$I=\int^{x_1}_{x_0}f(x)\mathrm{d}x=\dfrac h2(f_0+f_1)\tag{4.4}$$

现在，我们来考虑梯形法则的误差. 由 `Newton-Leibnitz 公式` 

{% note danger simple%}
**Theorem 4.2**

$$I=\int^b_af(x)\mathrm{d}x=F(b)-F(a)$$

{% endnote %}

可得

$$I=\int^{x_1}_{x_0}f(x)\mathrm{d}x=F(x_1)-F(x_0)\tag{4.5}$$

对 $F(x_1)$ 作 Taylor 展开，类似式 (1.1)，可得

$$F(x_1)=F(x_0+h)=F(x_0)+h\dfrac{\mathrm{d}F(x_0)}{\mathrm{d}x}+\dfrac{h^2}{2}\dfrac{\mathrm{d}^2F(x_0)}{\mathrm{d}x^2}+\dfrac{h^3}{6}\dfrac{\mathrm{d}^3F(\xi)}{\mathrm{d}x^3}\tag{4.6}$$

其中 $\xi\in(x_0,x_1)$ .

因此可得

$$I=F(x_1)-F(x_0)=h\dfrac{\mathrm{d}F(x_0)}{\mathrm{d}x}+\dfrac{h^2}{2}\dfrac{\mathrm{d}^2F(x_0)}{\mathrm{d}x^2}+\dfrac{h^3}{6}\dfrac{\mathrm{d}^3F(\xi)}{\mathrm{d}x^3}\tag{4.7}$$

$F(x)$ 是 $f(x)$ 的原函数，因此上式即可写成

$$I=hf(x_0)+\dfrac{h^2}{2}\dfrac{\mathrm{d}f(x_0)}{\mathrm{d}x}+\dfrac{h^3}{6}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.8}$$

上式为真值.

再看计算值，对 $f(x_1)$ 作 Taylor 展开，可得

$$f(x_1)=f(x_0+h)=f(x_0)+h\dfrac{\mathrm{d}f(x_0)}{\mathrm{d}x}+\dfrac{h^2}{2}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.9}$$

需要说明的是，式 (4.7) 和式 (4.9) 中的 $\xi$ 其实不能直接认为是相同的，但是可以证明二者是相等的，因此这里没有做区分. 证明也很容易，从 $f(x)=\dfrac{\mathrm{d}F(x)}{\mathrm{d}x}$ 出发即可.

因此计算值即式 (4.4) 可以写成

$$I=\dfrac h2(f_0+f_1)=hf(x_0)+\dfrac{h^2}{2}\dfrac{\mathrm{d}f(x_0)}{\mathrm{d}x}+\dfrac{h^3}{4}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.10}$$

式 (4.8) 减去式 (4.10) 即可得到误差项

$$\varepsilon=-\dfrac{h^3}{12}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.11}$$

因此可得梯形法则

$$I=\int^{x_1}_{x_0}f(x)\mathrm{d}x=\dfrac h2(f_0+f_1)-\dfrac{h^3}{12}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.12}$$

## Simpson 法则
