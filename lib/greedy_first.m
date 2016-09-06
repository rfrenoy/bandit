%% Greedy-first bandit
% The greedy-first bandit purely explores arms for $\gammaT$ rounds, T
% being the horizon. Then it purely explores by selecting the arm with the
% highest mean for the remaining $(1-\gamma)T$ rounds.
% Author : Rémy Frenoy
classdef greedy_first < bandit
    properties
        cum_rewards;  % Cumulated reward for every arm
        t_arms;       % Number of selection for every arm
        T;            % Size of the decision sequence
    end
    
    methods
        function obj = greedy_first(nb_arms, gamma_value, horizon)
            obj@bandit(nb_arms, gamma_value);
            obj.cum_rewards = zeros(nb_arms,1);
            obj.t_arms = zeros(nb_arms,1);
            obj.T = horizon;
        end
        
        function [arm,pb] = select(obj)
            playcount = sum(obj.t_arms);
            if playcount < obj.gamma*obj.T  % Pure exploration phase
                arm = randi(obj.K);
                pb = 1/obj.K;
            else                            % Pure exploitation phase
                mean_rewards = obj.cum_rewards./max(1,obj.t_arms);
                [pb,arm] = max(mean_rewards);
                pb = pb/sum(mean_rewards);
            end
        end
        
        function update(obj, i, reward)
            obj.cum_rewards(i) = obj.cum_rewards(i) + reward;
            obj.t_arms(i) = obj.t_arms(i) + 1;
        end
    end
    
end