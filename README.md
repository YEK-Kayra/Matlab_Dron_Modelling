
# Quadrotor with Spherical Inverted Pendulum Modeling and Simulation

## 📌 Project Overview
This project models and simulates a quadrotor unmanned aerial vehicle carrying a spherical inverted pendulum system. Developed at Kocaeli University's Mechatronics Engineering Department, the project provides:
        
-> **Mathematical modeling** of the complex MIMO nonlinear system using Euler-Lagrange     formulation  
-> **Simulink implementation** of the dynamic equations     
-> **3D physical modeling** using Simscape Multibody        
-> **Interactive GUI** for parameter configuration and simulation control   
-> **Six predefined motion scenarios** for system analysis


## 🛠️ Technical Components
1. **System Dynamics**  
        -> 8-DOF nonlinear system (3 positional, 3 rotational for quadrotor + 2 angular for pendulum)   
        -> Derived using Euler-Lagrange formulation:    

M(q)q̈ + C(q,q̇)q̇ + G(q) = Bu
        
        -> Includes Coriolis effects, inertia coupling, and gravitational forces

2. **Implementation Approaches**

2.1 **Equation-based modeling** in Simulink

2.2 **Physical modeling** using Simscape Multibody components:

        -> Rigid body elements (bricks, cylinders, spheres)
        -> Joints (bushing, spherical, revolute)
        -> Contact forces with ground                           

3. **Control Interface**
MATLAB App Designer GUI with: 

        ->Motor thrust/torque sliders   
        ->Simulation time/solver settings   
        ->Initial condition configuration   
        ->Visualization controls    
        ->Predefined motion scenarios 

## 🚀 Motion Scenarios      

        -> Hover - Static equilibrium analysis
        -> Parabolic Takeoff - X-Z plane trajectory
        -> Vortex Takeoff - Rotating ascent
        -> Free Fall - Gravity-only dynamics
        -> Pendulum Kick - Initial angular displacement
        -> Barrel Roll Takeoff - Aggressive maneuver simulation

## 📊 Simulation Results

Key analyses performed:

1. **Free Fall Dynamics:**  

        -> Position-time: Validated kinematic equations   
        -> Velocity-time: Confirmed gravitational acceleration    
        -> Acceleration-time: Constant -9.81 m/s²

2. **Hover Analysis:**

        -> Calculated required thrust (5.2728 N per motor)
        -> Verified force equilibrium condition  

 

## 🛠️ Installation & Usage
### Requirements

    -> MATLAB R2024a or later   
    -> Simulink  
    -> Simscape Multibody   

### Running Simulations
    -> Clone the repository
    -> Open Drone_Modelling.slx in MATLAB
    -> Run the GUI application
    -> Configure parameters via the interface
    -> Start simulation and visualize results

## 📚 References
    -> Martinez-Vasquez et al. (2023)           - Spherical pendulum control approaches
    -> Martinez-Vasquez & Castro-Linares (2024) - Flatness-based control

## 🔮 Future Work
    Implementation of control strategies (PID, state feedback)








