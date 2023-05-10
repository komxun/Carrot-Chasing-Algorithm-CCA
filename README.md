# Carrot Chasing Algorithm (CCA)
One of the simplest path-following algorithm is Carrot Chasing Algorithm (CCA). CCA exploits the virtual target (VTP) and make the UAV chase this VTP by updating the 
heading angle direction $\psi$ 

# Sraight-line Following CCA
Even the path is a nonlinear curve, the carrot chasing algorithm (CCA) for straight line can still be applied by simply discretizing the path into waypoints. After obtaining all the waypoints, CCA can be executed for each section of the path as shown in figure below. 
![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/4605f7c2-932e-403f-8b64-551f8239e34f)

The algorithm can be summarized below. This has been coded in the main while loop in **CCA_Straight.m**

![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/f63f7179-9559-4ba7-85a4-dc1fec7a0247)
https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/blob/ce4031642923f50cec0069f32617ef8b945e5d68/CCA_Straight.m#L36-L82


# Result - CCA Straight-Line
![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/c14b2706-c9c2-4caa-908e-622ff491f453)

# Tuning CCA
For CCA, the design parameters include the look-ahead distance $\delta$, and the gain $\kappa$. The closed loop trajectory directly depends on these parameters. The effect of each parameters have been plotted in figure below. In general, too small $\delta$ can give an overshoot and oscillation to the trajectory since the virtual target has been placed too close to the initial position. Larger $\delta$ can make the trajectory settle on the path quickly while reducing the cross-track error. However, too large $\delta$ may results in a slow convergence to the line. The value of $\delta$ should be carefully determined based on the distance of the path and the velocity of the vehicle. Although the gain $\kappa$ has little effect on the trajectory, smaller $\kappa$ can increase the stability of the trajectory and has less error to the desired path.

![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/a6c02fc1-9da9-4cf3-889a-5002b054d595)
![image](https://github.com/komxun/Carrot-Chasing-Algorithm-CCA/assets/133139057/3061d4f0-83fa-4eee-9c49-56932ea9ada2)


# Reference
[1] Bhadani, R. (2020). _Path Planning of Unmanned System using Carrot-chasing Algorithm_. arXiv preprint arXiv:2012.13227.

[2] X. Jin, W. Mei and Y. Zhaolong, "Path Following Control for Unmanned Aerial Vehicle Based on Carrot Chasing Algorithm and PLOS," 2020 IEEE International Conference on Artificial Intelligence and Information Systems (ICAIIS), Dalian, China, 2020, pp. 571-576, doi: 10.1109/ICAIIS49377.2020.9194843.
