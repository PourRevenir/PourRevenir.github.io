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

由式（9.4）可得在 $[-1,1]$ 上有 $|T_n(x)|\leqslant1$，并且有 $n$ 个不相等的实根

$$
x_k=\cos\dfrac{(2k+1)\pi}{2n+2},\ k=0,1,2,\cdots,n\tag{9.6}
$$

由式 (9.4) 还可判断出，当 $n$ 为偶数时 $T_n(x)$ 是偶函数，反之是奇函数. 除奇偶性外，Chebyshev 多项式还具有正交性完备性等性质. 与 Legendre 多项式类似的，Chebyshev 多项式也存在递推关系

$$
T_0(x)=1
$$

$$
T_1(x)=x
$$

$$
T_{n+1}(x)=2xT_n(x)-T_{n-1}(x)\tag{9.7}
$$

通过这个递推关系，很容易通过编写 MATLAB 程序得到各阶 Chebyshev 多项式的图像，绘制在一张图上

![Chebyshev 多项式](img/chebyshev.svg)

绘制代码如下，这里取 $n=7$

```matlab
n = 7;

x = -1:0.01:1;
t = zeros(n,length(x));

t(1,:) = 1;
t(2,:) = x;

for i = 3:n
    t(i,:) = 2*x.*t(i-1,:) - t(i-2,:);
end

figure;
for j = 1:n
    plot(x,t(j,:),'LineWidth',1);hold on
    grid on;
end
```

此外还有一个导数形式的递推关系，可从下面的式子得出

$$
2T_{n}(x)=\dfrac{1}{n+1}\dfrac{\mathrm{d}}{\mathrm{d}x}T_{n+1}(x)-\dfrac{1}{n-1}\dfrac{\mathrm{d}}{\mathrm{d}x}T_{n-1}(x),\ n=1,2,\cdots\tag{9.8}
$$

## Gauss-Chebyshev 求积公式

与 Legendre 多项式类似，由于 Chebyshev 多项式具备正交性等性质，因此可以用于 Gauss 型积分.

为了计算 Gauss-Chebyshev 积分的求积系数，从 Gauss 型积分的定义出发，即要具备 $2n+1$ 次代数精度，首先需要计算如下积分

$$
\int^1_{-1}\dfrac{x^n}{\sqrt{1-x^2}}\mathrm{d}x\Longrightarrow x=\sin t\Longrightarrow \int^{\frac\pi2}_{-\frac\pi2}\sin^nt\mathrm{d}t\tag{9.9}
$$

当 $n$ 为奇数时，被积函数为奇函数，积分为 0.

当 $n$ 为偶数时，被积函数为偶函数

$$
\int^1_{-1}\dfrac{x^n}{\sqrt{1-x^2}}\mathrm{d}x=\int^{\frac\pi2}_{-\frac\pi2}\sin^nt\mathrm{d}t=2\int^{\frac\pi2}_0\sin^nt\mathrm{d}t\tag{9.10}
$$

记积分

$$
I_n=\int^{\frac\pi2}_0\sin^nx\mathrm{d}x=\int^{\frac\pi2}_0\sin^{n-2}x(1-\cos^2x)\mathrm{d}x\tag{9.12}
$$

不难看出右边第一项为 $I_{n-2}$ ，并对第二项使用分部积分法

$$
I_n=I_{n-2}-\int^{\frac\pi2}_ 0\sin^{n-2}x\cos^2x\mathrm{d}x=I_{n-2}-\int^{\frac\pi2}_ 0\dfrac{\cos x}{n-1}\mathrm{d}\sin^{n-1}x=I_{n-2}-\int^{\frac\pi2}_0\dfrac{\sin^nx}{n-1}\mathrm{d}x
$$

最终得到 $I_n=I_{n-2}-\dfrac{1}{n-1}I_n$，即

$$I_n=\dfrac{n-1}{n}I_{n-2}\tag{9.13}$$

$n$ 为偶数时即 `Wallis 公式` 

$$
\dfrac{(n-1)!!}{n!!}\pi\tag{9.14}
$$

求积公式

$$
\sum^{n}_{k=0}A_kf(x_k)
$$

对 $2n+1$ 次都要精准成立，取 Chebyshev 多项式的零点为 Gauss 点


列表

|$n$|$\int^1_{-1}\dfrac{x^n}{\sqrt{1-x^2}}\mathrm{d}x$|
|:---|:---|
|$n=0$|$\pi$|
|$n=1$|0|
|$n=2$|$\dfrac12\pi$|
|$n=3$|0|
|$n=4$|$\dfrac34\dfrac12\pi$|
|$n=5$|0|
|$n=6$|$\dfrac56\dfrac34\dfrac12\pi$|

解线性方程组并类推可得

$$
A_k=\dfrac{\pi}{n+1}\tag{9.15}
$$

因此可得 `Gauss-Chebyshev` 求积公式

$$
\int^1_{-1}\dfrac{1}{\sqrt{1-x^2}}f(x)\mathrm{d}x\approx\dfrac{\pi}{n+1}\sum^n_{k=0}f(x_k)\tag{9.16}
$$

该求积公式的误差余项为

$$
R=\dfrac{2\pi}{2^{n+2}(2n+2)!}\dfrac{\mathrm{d}^{2n+2}f(\xi)}{\mathrm{d}x^{2n+2}},\ \xi\in(-1,1)\tag{9.17}
$$

对于非 $[-1,1]$ 上的积分，可类比式 (8.6) 做线性变换，以及采用复化求积的办法
