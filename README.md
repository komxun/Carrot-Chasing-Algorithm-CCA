# Carrot Chasing Algorithm (CCA)
One of the simplest path-following algorithm is Carrot Chasing Algorithm (CCA). CCA exploits the virtual target (VTP) and make the UAV chase this VTP by updating the 
heading angle direction $\psi$ 

# Sraight-line Following CCA
The carrot chasing algorithm (CCA) for straight line can be applied, even the path is a nonlinear curve, by simply discretizing the path into waypoints. After obtaining all the waypoints, CCA can be executed for each section of the path as shown in figure below. 
|![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/3ce249e2-ea7d-4bab-9226-0e3b49112eaa)|
|:--:|
|*CCA path following implementation scheme*|

The algorithm can be summarized below. This has been coded in the main while loop in **CCA_Straight.m**

![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/8d2d5987-c5ef-48ba-97b2-c8ab054d71a9)
https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/blob/ce4031642923f50cec0069f32617ef8b945e5d68/CCA_Straight.m#L36-L82


# Result - CCA Straight-Line
|![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/fdc6446a-bfde-43dc-aee3-c50c7efd85c1)|
|:--:|
|CCA for straight-line path following with $\kappa = 0.75$ and various $\delta$| 


# Tuning CCA
For CCA, the design parameters include the look-ahead distance $\delta$, and the gain $\kappa$. The closed loop trajectory directly depends on these parameters. The effect of each parameters have been plotted in figure below. In general, too small $\delta$ can give an overshoot and oscillation to the trajectory since the virtual target has been placed too close to the initial position. Larger $\delta$ can make the trajectory settle on the path quickly while reducing the cross-track error. However, too large $\delta$ may results in a slow convergence to the line. The value of $\delta$ should be carefully determined based on the distance of the path and the velocity of the vehicle. Although the gain $\kappa$ has little effect on the trajectory, smaller $\kappa$ can increase the stability of the trajectory and has less error to the desired path.

| ![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/05f944c0-a825-4ca4-8312-5afebf80f5e4) ![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/a14caa51-e0a3-485b-aef7-f74c30104693) |
|:--:|
|*The effect of different design parameters on the path following trajectory*|



# References
[1] Bhadani, R. (2020). _Path Planning of Unmanned System using Carrot-chasing Algorithm_. arXiv preprint arXiv:2012.13227.

[2] X. Jin, W. Mei and Y. Zhaolong, "Path Following Control for Unmanned Aerial Vehicle Based on Carrot Chasing Algorithm and PLOS," 2020 IEEE International Conference on Artificial Intelligence and Information Systems (ICAIIS), Dalian, China, 2020, pp. 571-576, doi: 10.1109/ICAIIS49377.2020.9194843.
