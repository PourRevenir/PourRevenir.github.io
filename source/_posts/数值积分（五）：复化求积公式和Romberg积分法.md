---
title: 数值积分（五）：复化求积公式和 Romberg 积分法
date: 2024-07-30 10:41:37
tags: 数值积分
categories: 数值计算和程序设计
---
## 可分解法则

梯形法则仅给出了一个步长范围内的值，要计算整个区间上的值，就要把整个计算区间进行划分，对划分成的每个小区间使用梯形法则.

因此我们可以得到

$$\int^b_af(x)\mathrm{d}x\approx\sum^{N-1}_ {j=0}\dfrac{h}{2}(f_j+f_{j+1})=\dfrac{h}{2}\left(f_0+f_N+2\sum^{N-1}_ {j=1}f_j\right)\tag{5.1}$$

上式即为`复化梯形公式`，其中 $h=\dfrac{b-a}{N}$.

如果使用 Simpson 法则，就会得到

$$\int^b_af(x)\mathrm{d}x\approx\sum^{N-1}_ {j=0}\dfrac{h}{6}(f_{2j}+4f_{2j+1}+f_{2j+2})=\dfrac{h}{6}\left(f_0+f_N+2\sum^{N-1}_  {j=1}f_{2j}+4\sum^{N-1}_ {j=0}f_{2j+1}\right)\tag{5.2}$$

上式即为`复化 Simpson 公式`，其中 $h=\dfrac{b-a}{2N}$.

## 精度递归改进

以梯形法则为例，选取 $2h$ 作为步长，则积分近似值即为

$$\int^b_af(x)\mathrm{d}x\approx\sum^{N/2-1}_ {j=0}h(f_{2j}+f_{2j+2})=h\left(f_0+f_N+2\sum^{N/2-1}_ {j=1}f_{2j}\right)\tag{5.3}$$

对比式 (5.1) 和式 (5.3) ，可以发现步长为 $h$ 的方案包含了步长为 $2h$ 的方案，即

$$T_{h}=\dfrac12T_{2h}+h\sum^{N/2-1}_ {j=0}f_{2j+1}\tag{5.4}$$

这种方法被称为`自适应梯形积分法`. 事实上，在进行数值计算时，我们并不能事先得知需要的步长：步长设置太大会使精度下降，步长设置太小则会浪费计算资源.

## Romberg 积分法

上述方法收敛速度慢，我们在这种逐渐二分的思想上，采用`误差事后估计法`所求得的误差作为积分近似值的补偿值，就得到了 `Romberg 积分法`.

梯形积分 $T_n$ 的截断误差与 $h^2$ 成正比，因此步长二分后，误差约为原来的 $\dfrac{1}{2}$，即得到

$$\dfrac{E_{2n}}{E_n}=\dfrac{I-T_{2n}}{I-T_n}\approx\dfrac 14\tag{5.5}$$

也就是说

$$I-T_{2n}\approx\dfrac13(T_{2n}-T_n)\tag{5.6}$$

因此就有

$$I\approx T_{2n}+\dfrac13(T_{2n}-T_n)=\dfrac43T_{2n}-\dfrac13T_n\tag{5.7}$$

式 (5.7) 的精度显然要比 $T_{2n}$ 高，记作 $\bar{I}$ ，将式 （5.1） 代入进式 (5.3) ，得到

$$\bar{I}=\dfrac43\left[\dfrac12\cdot\dfrac12h\left(f_0+f_N+2\sum^{N-1}_ {j=1}f_j\right)+\dfrac12h\sum^{N-1}_ {j=0}f_{j+\frac12}\right]-\dfrac13\left[\dfrac12h\left(f_0+f_N+2\sum^{N-1}_ {j=1}f_j\right)\right]$$

$$\bar{I}=\dfrac16h\left(f_0+f_N+2\sum^{N-1}_ {j=1}f_j+4\sum^{N-1}_ {j=0}f_{j+\frac12}\right)$$

与式 (5.2) 比较发现

$$S_n=\dfrac34T_{2n}-\dfrac13T_n\tag{5.8}$$

因此我们还可以类推，Simpson 积分的误差和 $h^4$ 成正比，从而得到
 
$$C_n=\dfrac{16}{15}S_{2n}-\dfrac{1}{16}S_n\tag{5.9}$$

Cotes 积分的误差和 $h^6$ 成正比，从而得到

$$R_n=\dfrac{64}{63}C_{2n}-\dfrac{1}{63}C_n\tag{5.10}$$

这种方法可以加速积分计算的收敛.
