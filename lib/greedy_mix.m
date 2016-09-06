%% GreedyMix bandit
% Bandit algorithm implemented from 'Finite-time Regret Bounds
% for the Multiarmed Bandit Problem' [Cesa-Bianchi and Fischer, 1998].
% Author : Rémy Frenoy
classdef greedy_mix < bandit_mix
    properties
        alpha;        
        I;            % Set of arms maximizing the confidence measure
    end
    
    methods
        
        function obj = greedy_mix(nb_arms, gamma_value)
            obj@bandit_mix(nb_arms, gamma_value);
            obj.alpha = 0;
            obj.I = 1:1:nb_arms;        % Initially every arm maximize the confidence       
        end
        
        function [arm,pb] = select(obj)
            rand_draw = random('unif',0,1);
            obj.alpha = obj.compute_alpha();
            
            if rand_draw < obj.alpha        % Pure exploration : drawing randomly uniformly across all arms
                arm = randi(obj.K);
                pb = 1/obj.K;
            else                           % Exploitation : drawing randomly uniformly across all members of I
                rand_index = randi(length(obj.I));
                arm = obj.I(rand_index);
                pb = 1/length(obj.I);
            end
        end
        
        % Updating s value for selected arm
        % Updating set I
        function update(obj, i, reward)
            if ismember(i,obj.I)
                Q = (1-obj.alpha)/length(obj.I) + obj.alpha/obj.K;
            else
                Q = obj.alpha/obj.K;
            end
            obj.s(i) = obj.s(i) + reward/Q;
            obj.I = compute_I(obj.s);
            update@bandit_mix(obj,i,reward);
        end
    end
end

function I = compute_I(s_scores)
    I = [];
    max_value = max(s_scores);
    for s=1:length(s_scores)
        if s_scores(s) == max_value
            I = [I,s];
        end
    end
end