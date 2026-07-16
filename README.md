# Predicting Renovation Risk in Existing Buildings Using Multilayer Perceptrons

This repository contains the supplementary materials (empirical dataset, statistical analyses, and MATLAB source codes) for the scientific article dedicated to predicting renovation risk in existing academic buildings using Multilayer Perceptrons (MLP).

All files are located directly in the root directory of the repository and correspond exactly to the structure described in the manuscript.

---

## Repository Content

The repository consists of exactly 4 files:

### 1. `data.csv`
This file contains the complete empirical dataset used for statistical analysis, as well as for training and testing the neural networks.
* **Format:** Plain text CSV, semicolon-separated values (`;`).
* **Sample Size:** 122 historical cases (renovation projects).
* **Column Structure (13 explanatory variables + 1 dependent variable):**
  1. `Delays in material deliveries`
  2. `Problems with system installation`
  3. `Damage during installation`
  4. `Insufficient worker qualifications`
  5. `Shortage of specialized workers`
  6. `Work coordination`
  7. `Changes in scope of work`
  8. `Problems obtaining approvals from network utility managers`
  9. `Adverse weather conditions`
  10. `Equipment failures`
  11. `Project complexity`
  12. `Availability of ministerial funds`
  13. `Type of building`
  14. `Renovation Risk` (**Target variable** – quantitative assessment of the renovation risk)

### 2. `Supplementary D – Code C1.m`
A MATLAB script that implements and trains the first neural network architecture (Model 1) with two hidden layers.
* **Architecture:** Feedforward neural network with a `13 – 160 – 90 – 1` structure.
* **Activation Functions:** Hyperbolic tangent sigmoid (`tansig`) for both hidden layers, Linear (`purelin`) for the output layer.
* **Training Algorithm:** Levenberg-Marquardt (`trainlm`).
* **Performance Function:** Mean Squared Error (`mse`).
* **Data Partitioning:** Random split (`dividerand`) with the following ratios: 80% training set, 10% validation set, 10% testing set.

### 3. Supplementary D – Code C2.m`
A MATLAB script that implements and trains the second, deeper neural network architecture (Model 2) with four hidden layers.
* **Architecture:** Feedforward neural network with a `13 – 260 – 90 – 90 – 90 – 1` structure.
* **Activation Functions:** `tansig` for all four hidden layers, `purelin` for the output layer.
* **Training and Partitioning Parameters:** Identical to Code C1 (`trainlm`, `dividerand`, 80/10/10 ratio).

### 4. Supplementary C – Excel E1.xlsx`
An Excel spreadsheet containing detailed statistical analyses of the dataset and the baseline reference model results.
* **Correlation Analysis:** Matrix of Spearman's rank correlation coefficients between input variables and the risk level.
* **Multiple Linear Regression:** Estimation results of the classical linear model, which serves as the baseline reference for the MLP models.
  * *Multiple R:* 0.388
  * *R-squared:* 0.151
  * *Adjusted R-squared:* 0.049
* **Model Comparison:** Summary table of R-squared values demonstrating the advantage of non-linear mapping:
  * Multiple Linear Regression: 0.151
  * MLP Model 1 (2 hidden layers): 0.58
  * MLP Model 2 (4 hidden layers): 0.86

---

## Code Execution Instructions

1. Download all files and place them **in the same working directory** on your computer.
2. Launch MATLAB (recommended version R2021a or newer with the *Deep Learning Toolbox* installed).
3. Open and run your chosen script (`Appendix A – Code C1.m` or `Appendix A – Code C2.m`).
4. The codes automatically import the data matrix from the `data.csv` file (skipping the text headers), configure the network architecture, execute the training process, and generate comparative plots for the test set.

---

## Important Methodological Note

As detailed in the scientific article, the provided codes perform a single, randomized data partition into training, validation, and testing sets using the `dividerand` function. Because the random number generator seed is not explicitly fixed (*random seed*), each subsequent execution of the scripts in MATLAB will produce a different data split and initialize the network weights from different starting points. Consequently, the resulting performance metrics may exhibit fluctuations around the baseline values reported in the manuscript.