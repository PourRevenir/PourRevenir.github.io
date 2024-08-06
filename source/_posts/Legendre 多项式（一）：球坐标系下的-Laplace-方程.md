---
title: Legendre 多项式（一）：球坐标系下的 Laplace 方程
date: 2024-08-06 09:47:54
tags: Legendre 多项式
categories: 数学物理方法
---
对于球坐标系下的 Laplace 方程

$$
\dfrac{1}{r^2}\dfrac{\partial}{\partial r}\left(r^2\dfrac{\partial u}{\partial r}\right)+\dfrac{1}{r^2\sin\theta}\left(\sin\theta\dfrac{\partial u}{\partial\theta}\right)+\dfrac{1}{r^2\sin^2\theta}\dfrac{\partial^2u}{\partial\phi^2}=0\tag{1.1}
$$

采用分离变量法 $u(r,\theta,\phi)=R(r)Y(\theta,\phi)$ ，其中 $R(r)$ 称为`径向函数`，$Y(\theta,\phi)$ 称为`球谐函数`. 得到

$$
\dfrac{Y(\theta.\phi)}{r^2}\dfrac{\mathrm{d}}{\mathrm{d}r}\left(r^2\dfrac{\mathrm{d}R(r)}{\mathrm{d}r}\right)+\dfrac{R(r)}{r\sin\theta}\dfrac{\partial}{\partial \theta}\left(\sin\theta\dfrac{\partial^2Y(\theta,\phi)}{\partial\phi^2}\right)+\dfrac{R(r)}{r^2\sin^2\theta}\dfrac{\partial Y(\theta,\phi)}{\partial \phi^2}=0\tag{1.2}
$$

$$
\dfrac{1}{R(r)}\dfrac{\mathrm{d}}{\mathrm{d}r}\left(r^2\dfrac{\mathrm{d}R(r)}{\mathrm{d}r}\right)=-\dfrac{1}{Y(\theta,\phi)\sin\theta}\dfrac{\partial}{\partial\theta}\left(\sin\theta\dfrac{\partial Y(\theta,\phi)}{\partial\theta}\right)-\dfrac{1}{Y(\theta,\phi)\sin^2\theta}\dfrac{\partial^2Y(\theta,\phi)}{\partial\phi^2}\tag{1.3}
$$

分别得到`径向方程`和`球谐方程`

$$\dfrac{\mathrm{d}}{\mathrm{d}r}\left(r^2\dfrac{\mathrm{d}R(r)}{\mathrm{d}r}\right)-l(l+1)R(r)=0\tag{1.4}$$

$$\dfrac{1}{\sin\theta}\dfrac{\partial}{\partial \theta}\left(\sin\theta\dfrac{\partial Y(\theta,\phi)}{\partial \theta}\right)+\dfrac{1}{\sin^2\theta}\dfrac{\partial^2Y(\theta,\phi)}{\partial \phi^2}+l(l+1)Y(\theta,\phi)=0\tag{1.5}$$

对式 (1.5) 进一步分离变量 $Y(\theta,\phi)=\Theta(\theta)\Phi(\phi)$

$$\dfrac{\Phi(\phi)}{\sin\theta}\dfrac{\mathrm{d}}{\mathrm{d}\theta}\left(\sin\theta\dfrac{\mathrm{d}\Theta(\theta)}{\mathrm{d}\theta}\right)+\dfrac{\Theta(\theta)}{\sin^2\theta}\dfrac{\mathrm{d}^2\Phi(\phi)}{\mathrm{d}\phi^2}+l(l+1)\Theta(\theta)\Phi(\phi)=0\tag{1.5}$$

两边同时乘上 $\dfrac{\sin^2\theta}{\Theta\Phi}$

$$\dfrac{\sin\theta}{\Theta(\theta)}\dfrac{\mathrm{d}}{\mathrm{d}\theta}\left(\sin\theta\dfrac{\mathrm{d}\Theta(\theta)}{\mathrm{d}\theta}\right)+\left[l(l+1)-\dfrac{\lambda}{\sin^2\theta}\right]\Theta(\theta)=0\tag{1.6}$$

于是我们通过两次分离变量得到了三个微分方程

{% note info simple %}
$$\dfrac{\mathrm{d}^2\Phi(\phi)}{\mathrm{d}\phi^2}+\lambda\Phi(\phi)=0\tag{1.7a}$$

$$\dfrac{1}{\sin\theta}\dfrac{\mathrm{d}}{\mathrm{d}\theta}\left(\sin\theta\dfrac{\mathrm{d}\Theta(\theta)}{\mathrm{d}\theta}\right)+\left[l(l+1)-\dfrac{\lambda}{\sin^2\theta}\right]\Theta(\theta)=0\tag{1.7b}$$

$$\dfrac{\mathrm{d}}{\mathrm{d}r}\left(r^2\dfrac{\mathrm{d}R(r)}{\mathrm{d}r}\right)-l(l+1)R(r)=0\tag{1.7c}$$
{% endnote %}

可以看出，式 (1.7a) 和 (1.7b) 通过参数 $\lambda$ 耦合，而式 (1.7b) 和 (1.7c) 通过参数 $l$ 耦合.

我们首先求解式 (1.7c)，展开得到

$$r^2\dfrac{\mathrm{d}^2R(r)}{\mathrm{d}r^2}+2r\dfrac{\mathrm{d}R(r)}{\mathrm{d}r}-l(l+1)R(r)=0\tag{1.8}$$

此时可以直接通过幂级数展开求解，但是这并不必要. 不妨设 $R(r)\thicksim r^n$ ，从而有

$$n(n-1)r^n+2nr^n-l(l+1)r^n=0$$

容易得到 $n_1=l$ ，$n_2=-(l+1)$

因此径向方程的通解为

$$R_l(r)=A_lr^l+B_l\dfrac{1}{r^l-1}\tag{1.9}$$

求解式 (1.7a) ，一方面为了保证解的单值性，另一方面从物理角度来看，都需要引入一个`自然边界条件` $\Phi(\phi)=\Phi(\phi+2\pi)$ ，这样就得到了一个 `Sturm-Liouville 问题` ，我们知道其解为

$$\lambda_m=m^2,\ \Phi_m(\phi)=\mathrm{e}
^{\mathrm{j}m\phi},\quad m=0,\pm1,\pm2,\cdots$$

相应的 $\Phi_m(\phi)$ 可以写成 $\sin(m\phi)$ 和 $\cos(m\phi)$ 的线性组合形式

$$\lambda_m=m^2,\ \Phi_m(\phi)=\binom{\sin(m\phi)}{\cos(m\phi)} ,\quad m=0,1,2,\cdots$$

求解式 (1.7b)，我们可以通过如下变量代换使求解变得简便

$$x=\cos \theta,\ y=\Theta(\theta)$$

从而就有 $-\dfrac{1}{\sin\theta}\dfrac{\mathrm{d}}{\mathrm{d}\theta}=\dfrac{\mathrm{d}}{\mathrm{d}x}$， $\sin^2\theta=1-x^2$

$$\dfrac{\mathrm{d}}{\mathrm{d}x}\left[(1-x^2)\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}\right]+\left[l(l+1)-\dfrac{m^2}{1-x^2}\right]y(x)=0\tag{1.10}$$

展开得到

$$(1-x^2)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-wx\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+\left[l(l+1)-\dfrac{m^2}{1-x^2}\right]y(x)=0\tag{1.11}$$

由于 $0\leqslant \theta\leqslant\pi$ ，因此变量代换后 $-1\leqslant x\leqslant 1$ .上式被称为`缔合 Legendre 方程`，也被称为`连带 Legendre 方程`，如果系统具有**极轴转动对称性**，那么意味着 $\Phi(\phi)=\mathrm{Const}$ ，也就是意味着 $m=0$ ，这时缔合 Legendre 方程就退化为了 `Legendre 方程`

{% note info simple %}
$$
(1-x^2)\dfrac{\mathrm{d}^2y(x)}{\mathrm{d}x^2}-2x\dfrac{\mathrm{d}y(x)}{\mathrm{d}x}+l(l+1)y(x)\tag{1.12}
$$
{% endnote %}