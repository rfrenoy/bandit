%% Bandit abstract class
% Implement the bandit interface
% Bandit algorithms should inherit from this class, and implement the
% methods select(obj), which select an arm in [1,...,K], and the method
% update, which update the weights/probabilities for the next rounds
classdef (Abstract) bandit < handle
   
    properties
        K;      % Number of arms
        gamma;  % Gamma parameter, make the deal between exploration and exploitation
    end
    
    methods
        function obj = bandit(nb_arms, gamma_value)
            obj.K = nb_arms;
            obj.gamma = gamma_value;
        end
    end
    
    methods (Abstract)
        [arm,pb] = select(obj);     % Return an arm in [1,...,K] and the probability to select this arm
        update(obj, i, reward);     % Update weights/probabilities, given the reward received by arm i
    end
end