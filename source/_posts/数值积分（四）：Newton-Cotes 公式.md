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

$$I=\int^b_af(x)\mathrm{d}x\approx\dfrac{f(b)+f(a)}{2}(b-a)\tag{4.2}$$

采用计算区域中点的函数值对其进行近似，就会得到`中矩法则`

$$I=\int^b_af(x)\mathrm{d}x\approx f(\frac{b+a}{2})(b-a)\tag{4.3}$$

由于中矩法则需要中点的函数值，因此在实际中应用较少. 为了方便编写数值计算程序，用 $x_0$ 代替 $a$，用 $h$ 代替步长 $\Delta x$，计算点即 $x_k=x_0+hk$，用 $f_k$ 代替 $f(x_k)$. 由于式 (4.2) 中只需要两个点，因此可写成

$$I=\int^{x_1}_{x_0}f(x)\mathrm{d}x\approx\dfrac h2(f_0+f_1)\tag{4.4}$$

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

$$f(x_1)=f(x_0+h)\approx f(x_0)+h\dfrac{\mathrm{d}f(x_0)}{\mathrm{d}x}+\dfrac{h^2}{2}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.9}$$

需要说明的是，式 (4.7) 和式 (4.9) 中的 $\xi$ 其实不能直接认为是相同的，但是可以证明二者是相等的，因此这里没有做区分. 证明也很容易，从 $f(x)=\dfrac{\mathrm{d}F(x)}{\mathrm{d}x}$ 出发即可.

因此计算值即式 (4.4) 可以写成

$$I=\dfrac h2(f_0+f_1)=hf(x_0)+\dfrac{h^2}{2}\dfrac{\mathrm{d}f(x_0)}{\mathrm{d}x}+\dfrac{h^3}{4}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.10}$$

式 (4.8) 减去式 (4.10) 即可得到误差项

$$\varepsilon=-\dfrac{h^3}{12}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.11}$$

因此可得梯形法则

$$I=\int^{x_1}_{x_0}f(x)\mathrm{d}x=\dfrac h2(f_0+f_1)-\dfrac{h^3}{12}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}\tag{4.12}$$

可以看出，梯形法则具有二阶精度.

## Simpson 法则

简单来说，`Simpson 法则`可以看做用三点拟合一条二次多项式，从而近似计算积分的值. 实际上，梯形法则、Simpson法则都是取不同个数的点然后通过 Lagrange 插值拟合多项式得到的，这也是 Newton-Cotes 公式的思路，如果选取四点拟合三次多项式，就得到了 `Simpson 3/8 法则`，如果选取五点拟合二次多项式，就得到了 `Boole 法则` .

### 多项式拟合

多项式拟合是拟合曲线的一种方法，给定 n+1 个点，可以用一个 n 次多项式进行拟合

$$(x_i,y_i),\ i=0,1,2\cdots n$$

多项式如下

$$P_n(x)=a_nx^n+a_{n-1}x^{n-1}+\cdots+a_1x+a_0\tag{4.13}$$

带入数据点，得到方程组

$$\begin{cases}
y_0=a_nx_0^n+a_{n-1}x_0^{n-1}+\cdots+a_1x_0+a_0\\
y_1=a_nx_1^n+a_{n-1}x_1^{n-1}+\cdots+a_1x_1+a_0\\
\qquad\qquad\qquad\qquad\vdots\\
y_n=a_nx_n^n+a_{n-1}x_n^{n-1}+\cdots+a_1x_n+a_0\\
\end{cases}\tag{4.14}$$

由于这是一个线性方程组，因此可以通过 MATLAB 直接求解.

但是这种求解方法计算量较大，更为直接的一种方法是利用 `Lagrange 插值法`，例如给定两个数据点 $(x_0,y_0)$ $(x_1,y_1)$，通过这两点的直线可以写成

$$P_1(x)=y_0\dfrac{x-x_1}{x_0-x_1}+y_1\dfrac{x-x_0}{x_1-x_0}\tag{4.15}$$

上式也可简记为

$$P_1(x)=y_0L_{1,0}(x)+y_1L_{1,1}(x)\tag{4.16}$$

类似的可以发现，Lagrange 系数 $L_{n,k}$ 有以下特点

$$L_{n,k}(x_j)=\begin{cases}
1,& j=k\\
0,& j\neq k
\end{cases}\tag{4.17}$$

这样，我们可以通过 n+1 个数据点，拟合出 n 次幂多项式

$$P_n(x)=\sum^n_{k=0}y_kL_{n,k}(x)\tag{4.18}$$

其中 Lagrange 系数为

$$L_{n,k}(x)=\prod^n\dfrac{x-x_i}{x_k-x_i},\ i\neq k\tag{4.19}$$

并具有式 (4.17) 中的性质.

### Simpson 法则

Simpson 法则实际上就是利用三个数据点构建一个 Lagrange 多项式

$$P_2(x)=f_0\dfrac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0-x_2)}+f_1\dfrac{(x-x_0)(x-x_2)}{(x_1-x_0)(x_1-x_2)}+f_2\dfrac{(x-x_0)(x-x_1)}{(x_2-x_0)(x_2-x_1)}\tag{4.20}$$

插入到积分中

$$I=\int^{x_2}_{x_0}f(x)\mathrm{d}x\approx \int^{x_2}_{x_0}P_2(x)\mathrm{d}x\tag{4.21}$$

$$I=f_0\int^{x_2}_{x_0}\dfrac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0-x_2)}\mathrm{d}x+f_1\int^{x_2}_{x_0}\dfrac{(x-x_0)(x-x_2)}{(x_1-x_0)(x_1-x_2)}\mathrm{d}x+f_2\int^{x_2}_{x_0}\dfrac{(x-x_0)(x-x_1)}{(x_2-x_0)(x_2-x_1)}\mathrm{d}x\tag{4.22}$$

分别计算各项积分的值

$$
\int^{x_2}_{x_0}\dfrac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0-x_2)}\mathrm{d}x&=\dfrac{1}{2h^2}\int^{x_2}_{x_0}(x-x_1)(x-x_2)\mathrm{d}x\\
&=\dfrac{1}{2h^2}\left.\left[\dfrac13x^3-\dfrac{x_1+x_2}2x^2+x_1x_2x\right]\right|_{x_0}^{x_2}\\
&=\dfrac{1}{2h^2}\left[\dfrac132h(x_2^2+x_0x_2+x_0^2)-\dfrac{x_1+x_2}22h(x_2+x_0)+2hx_1x_2x\right]
$$

代入 $x_2=x_0+2h$，$x_1=x_0+h$ 得到

$$\int^{x_2}_{x_0}\dfrac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0-x_2)}\mathrm{d}x=\dfrac{h}{3}$$

用同样的方法求解出

$$\int^{x_2}_{x_0}\dfrac{(x-x_0)(x-x_2)}{(x_1-x_0)(x_1-x_2)}\mathrm{d}x=\dfrac{4h}{3}$$

$$\int^{x_2}_{x_0}\dfrac{(x-x_0)(x-x_1)}{(x_2-x_0)(x_2-x_1)}\mathrm{d}x=\dfrac{h}{3}$$

于是可以得到式 (4.22) 等于

$$I=\int^{x_2}_{x_0}f(x)\mathrm{d}x\approx\dfrac h3(f_0+4f_1+f_2)\tag{4.23}$$

现在让我们考虑 Simpson 法则的误差，与计算式 （4.8）时的操作类似，对 $F(x_2)$ 做 Taylor 展开

$$F(x_2)=F(x_0+2h)=F(x_0)+2h\dfrac{\mathrm{d}F(x)}{\mathrm{d}x}+\dfrac{4h^2}{2}\dfrac{\mathrm{d}^2F(x)}{\mathrm{d}x^2}+\dfrac{8h^3}{6}\dfrac{\mathrm{d}^3F(x)}{\mathrm{d}x^3}+\dfrac{16h^4}{24}\dfrac{\mathrm{d}^4F(x)}{\mathrm{d}x^4}+\dfrac{32h^5}{120}\dfrac{\mathrm{d}^5F(\xi)}{\mathrm{d}x^5}\tag{4.24}$$

利用 $\dfrac{\mathrm{d}F(x)}{\mathrm{d}x}=f(x)$ 可得

$$I=\int^{x_2}_{x_0}f(x)\mathrm{d}x=F(x_2)-F(x_0)=2hf(x_0)+2h^2\dfrac{\mathrm{d}f(x)}{\mathrm{d}x}+\dfrac{4h^3}{3}\dfrac{\mathrm{d}^2f(x)}{\mathrm{d}x^2}+\dfrac{2h^4}{3}\dfrac{\mathrm{d}^3f(x)}{\mathrm{d}x^3}+\dfrac{4h^5}{15}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}\tag{4.25}$$

分别对 $f(x_1)$ 和 $f(x_2)$ 做 Taylor 展开

$$f(x_1)=f(x_0+h)=f(x_0)+h\dfrac{\mathrm{d}f(x)}{\mathrm{d}x}+\dfrac{h^2}{2}\dfrac{\mathrm{d}^2f(x)}{\mathrm{d}x^2}+\dfrac{h^3}{6}\dfrac{\mathrm{d}^3f(x)}{\mathrm{d}x^3}+\dfrac{h^4}{24}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}\tag{4.26}$$

$$f(x_2)=f(x_0+2h)=f(x_0)+2h\dfrac{\mathrm{d}f(x)}{\mathrm{d}x}+2h^2\dfrac{\mathrm{d}^2f(x)}{\mathrm{d}x^2}+\dfrac{4h^3}{3}\dfrac{\mathrm{d}^3f(x)}{\mathrm{d}x^3}+\dfrac{2h^4}{3}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}\tag{4.26}$$

近似值即可写成

$$
I&\approx\dfrac h3(f_0+4f_1+f_2)\\
&=2hf(x_0)+2h^2\dfrac{\mathrm{d}f(x)}{\mathrm{d}x}+\dfrac{4h^3}{3}\dfrac{\mathrm{d}^2f(x)}{\mathrm{d}x^2}+\dfrac{2h^4}{3}\dfrac{\mathrm{d}^3f(x)}{\mathrm{d}x^3}+\dfrac{5h^5}{18}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}
\tag{4.27}$$

用式 (4.24) 减去式 (4.27) 即可得误差项

$$\varepsilon=-\dfrac{h^5}{90}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}\tag{4.28}$$

从而得到 Simpson 法则

$$I=\int^{x_2}_{x_0}f(x)\mathrm{d}x=\dfrac h3(f_0+4f_1+f_2)-\dfrac{h^5}{90}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}\tag{4.29}$$

可以看出 Simpson 法则具有四阶精度.

## 小结

通过 Newton-Cotes 公式的基本思路，我们可以推导出下面的法则，并估计相应的误差.

|||
|:---|:---|
|梯形法则|$\dfrac h2(f_0+f_1)-\dfrac{h^3}{12}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}$|
|Simpson 法则|$\dfrac h3(f_0+4f_1+f_2)-\dfrac{h^5}{90}\dfrac{\mathrm{d}^2f(\xi)}{\mathrm{d}x^2}$|
|Simpson 3/8 法则|$\dfrac {3h}{8}(f_0+3f_1+3f_2+f_3)-\dfrac{3h^5}{80}\dfrac{\mathrm{d}^4f(\xi)}{\mathrm{d}x^4}$|
|Boole 法则|$\dfrac{2h}{45}(7f_0+32f_1+12f_2+32f_3+7f_4)-\dfrac{h^3}{12}\dfrac{\mathrm{d}^6f(\xi)}{\mathrm{d}x^6}$|
