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

对于 Newton-Cotes 求积公式

$$\int^b_af(x)\mathrm{d}x=(b-a)\sum^n_{j=0}C_j^{(n)}f(x_j^{(n)})+E_n\tag{7.2}$$

其误差余项为

当 $n$ 为奇数：

$$E_n=C_nh^{n+3}\dfrac{\mathrm{d}^{n+2}f(\xi)}{\mathrm{d}x^{n+2}}\tag{7.3}$$

当 $n$ 为偶数：

$$E_n=C_nh^{n+2}\dfrac{\mathrm{d}^{n+1}f(\xi)}{\mathrm{d}x^{n+1}}\tag{7.4}$$

由此可以看出，$n$ 为偶数时，代数精度为 $n+1$ ；$n$ 为奇数时，代数精度为 $n$ .

## Gauss 型求积公式

考虑式 (7.1) 的求积公式，共有 $n+1$ 个节点与 $n+1$ 个系数，共 $2n+2$ 个参数，因此可构造出代数精度至少为 $2n+1$ 的求积公式. 注意，**等分点并不是最佳的求积节点**.

> 以下面这个求积公式为例
>
> $$\int^1_{-1}f(x)\mathrm{d}x\approx A_0f(x_0)+A_1f(x_1)$$
>
> 构造 $f(x)=1,x,x^2,x^3$ 代入求积公式，使其精确成立，得到四个待定系数方程
>
> $$\begin{cases}A_0+A_1=2\\
A_0x_0+A_1x_1=0\\
A_0x_0^2+A_1x_1^2=\dfrac23\\
A_0x_0^3+A_1x_1^3=0\end{cases}$$
>
> 可以解出系数 $A_0=1,\ A_1=1$，节点 $x_0=-\dfrac{\sqrt{3}}{3},\ x_1=\dfrac{\sqrt{3}}{3}$
>
> 从而得到求积公式
>
> $$\int^1_{-1}f(x)\mathrm{d}x\approx f\left(-\dfrac{\sqrt{3}}{3}\right)+f\left(\dfrac{\sqrt{3}}{3}\right)$$
>
> 该公式对 $f(x)=x^4$ 不精确成立，故有 3 次代数精度.

一般的，考虑求积公式

$$\int^b_a\rho(x)f(x)\mathrm{d}x\approx \sum^n _{k=0}A_kf(x_k)\tag{7.5}$$

{% note info simple %}
**Definition 7.2**

若存在节点 $x_k\in[a,b]$ 即系数 $A_k$，使得机械求积公式具有 $2n+1$ 次代数精度，则称节点 $x_k$ 为 `Gauss 点`，$A_k$ 为 `Gauss 系数`，求积公式 (7.5) 为 `Gauss 型求积公式`. $\rho(x)$ 为`权函数`.
{% endnote %}

权函数是非负的，并且有两个性质需要知道，一是 $\int_a^b|x|^n\rho(x)\mathrm{d}x$ 可积且有限，二是如果 $\int^b_a\rho(x)g(x)\mathrm{d}x=0$ 则一定有 $g(x)=0$ .

**Gauss 型求积公式在所有机械求积公式中代数精度最高**，不可能出现代数精度为 $2n+2$ 或以上的求积公式. 证明方法是构造 $f(x)=\omega^2_{n+1}(x)$，其中 $\omega_{n+1}(x)=\prod^n_{k=0}(x-x_k)$ ，读者自证不难.

确定 Gauss 点和 Gauss 系数共有两种方法，一种是解非线性方程组，此法较为困难；另一种是先确定 Gauss 点，再通过解线性方程组确定 Gauss 系数. 

## Gauss 点的性质

判定 Gauss 点的充分必要条件是

{% note danger simple %}
**Theorem7.1**

对求积节点 $x_k$，其是 Gauss 点的充分必要条件是：

$$\omega_{n+1}(x)=\prod^n_{k=0}(x-x_k)$$

对 $\forall p\in\Phi_n[a,b]$ 满足

$$\int^b_a\rho(x)\omega_{n+1}(x)p(x)\mathrm{d}x=0$$

即与任一不超过 $n$ 次的多项式带权正交.

{% endnote %}

证明必要性

$$
\int^b_a=\rho(x)\omega_{n+1}(x)p(x)\mathrm{d}x=\sum^n_{k=0}A_k\omega_{n+1}(x_k)p(x_k)=0\tag{7.6}
$$

证明充分性，由 Thm 7.1 已知正交性，令 $f(x)=\omega_{n+1}(x)p(x)+q(x)$

$$
\int^b_a\rho(x)f(x)\mathrm{d}x=\int^b_a\rho(x)\omega_{n+1}(x)p(x)\mathrm{d}x+\int^b_a\rho(x)q(x)\mathrm{d}x=\sum^n_{k=0}A_kq(x_k)=\sum^n_{k=0}A_kf(x_k)\tag{7.7}
$$

证毕.

因此我们还可以得知

{% note danger simple%}
**Theorem 7.2**

式 (7.5) 具备 $2n+1$ 次代数精度的充分必要条件是求积节点是 $[a,b]$ 上带权 $n+1$ 次正交多项式的零点.

{% endnote %}

这是因为 Gauss 型求积公式的代数精度就是 $2n+1$，Gauss 点的性质可以帮助我们构造 Gauss 点，从而通过解线性方程组得到 Gauss 系数.

## Gauss 型求积公式的误差余项

由于 Gauss 型求积公式的代数精度是 $2n+1$ ，我们不妨构造一个 $2n+1$ 次的多项式 $H_{2n+1}(x)$，对各个积分节点 $x_k$ 上的函数值和一阶导数值满足

$$
H_{2n+1}(x_k)=f(x_k),\ \dfrac{\mathrm{d}H_{2n+1}(x)}{\mathrm{d}x}=\dfrac{\mathrm{d}f(x)}{\mathrm{d}x}
$$

由于 $k=0,1,\cdots,n$ ，因此可以建立 $2n+2$ 个线性方程，从而可以确定 $2n+1$ 次多项式各项系数.

同时还可以知道，对 $H_{2n+1}(x)$ 使用求积公式可以精确成立

$$
\int^b_a\rho(x)H_{2n+1}(x)\mathrm{d}x=\sum^n_{k=0}A_kf(x_k)\tag{7.8}
$$
