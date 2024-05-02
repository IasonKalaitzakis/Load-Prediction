![loadprediction](https://github.com/IasonasKalaitzakis/Load-Prediction/assets/31860283/70d4bd77-faed-4e4b-bf21-2d2b76fb762d)

A combination of clustering and ANN is used to approximate the residential load of the next day. 

The used dataset of the residential loads is created by modelling each appliance of the residence, and adding the proper respective stochasticity to the power consumption and time of use to emulate human behavior. The above are superimposed to a residential base load pattern. The files to simulate the dataset are included.

The data set is fed to the k-means clustering algorithm, to obtain the optimal clusters and their centroids. Each centroid comprises three parts corresponding to the electricity price, temperature and load. 
 
The final level of the residential load forecast algorithm comprises a feed-forward ANN. The input layer of the ANN consists of the forecasted electricity price and temperature, the load forecasted by the k-means algorithm, last day’s load demand, and the load demand of the same day of the last week. Finally, the output of the ANN, is the forecasted residential load of the next day. 
