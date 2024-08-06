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
