% SoftMax bandit
% Softmax Bandits draw arms according to a Gibbs distribution on the mean
% reward for every arm. A temperature parameter is used to trade between
% exploration and exploitation.
% Author : Rémy Frenoy
classdef softmax_context < bandit
    
    properties
        arm_rewards;
        context_rewards;
        t_arms;       % Number of selection for every arm
    end
    
    methods
        
        % Build a new SofMax object
        function obj = softmax_context(nb_arms, gamma_value)
            obj@bandit(nb_arms, gamma_value);
            obj.t_arms = zeros(nb_arms,1);
            obj.arm_rewards = cell(nb_arms,1);
            obj.context_rewards = cell(nb_arms,1);
        end
        
        function sim = similarity(obj,s1,s2)
            sim = 1-abs(s1-s2);
        end

        function w_reward = weightedcumreward(obj,k,context)
            w_reward = 0;
            for r=1:numel(obj.arm_rewards{k})
                w_reward = w_reward + obj.arm_rewards{k}(r)*obj.similarity(context,obj.context_rewards{k}(r));
            end
        end
            
        % Compute probability to select arm i according to a Gibb distribution
        function probas = proba(obj,context)
            probas = zeros(obj.K,1);
            exp_sum_rewards = zeros(obj.K,1);
            for k=1:obj.K
                exp_sum_rewards(k) = exp(obj.weightedcumreward(k,context) / (max([1,obj.t_arms(k)])*obj.gamma));
            end
            for k=1:obj.K
                probas(k) = exp_sum_rewards(k)/sum(exp_sum_rewards);
            end
        end
        
        % Call proba function to collect proba to draw each arm
        % Draw arm according to given probabilities
        function [arm,pb] = select(obj,context)
            pb = obj.proba(context);
            rand_draw = random('unif',0,1);
            cumul = cumsum(pb);
            for k=1:length(cumul)
                if rand_draw <= cumul(k)
                    arm = k;
                    return;
                end
            end
        end
        
        % Update weigth according to received reward
        function update(obj, i, reward, context)
            obj.arm_rewards{i} = [obj.arm_rewards{i}, reward];
            obj.context_rewards{i} = [obj.context_rewards{i}, context];
            obj.t_arms(i) = obj.t_arms(i) + 1;
        end
        
    end
    
end