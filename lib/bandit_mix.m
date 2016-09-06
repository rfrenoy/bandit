%% Bandit_mix interface
% Slight additions from the base bandit interface
% Used by SoftMix and GreedyMix algorithms
classdef (Abstract) bandit_mix < bandit
    properties
        s;            % Array of confidence measures for every arm
        playcount;    % Total number of played rounds
    end
    
    methods
        
        function obj = bandit_mix(nb_arms, gamma_value)
            obj@bandit(nb_arms, gamma_value);
            obj.s = zeros(nb_arms,1);
            obj.playcount = 0;
        end
        
        function alpha = compute_alpha(obj)
            if obj.playcount <= 2
                alpha = 1;
            else
                alpha = min([1, 5*obj.K*log(obj.playcount-1) / (obj.gamma^2 * (obj.playcount-1))]);
            end
        end
        
        function update(obj,~,~)
            obj.playcount = obj.playcount + 1;
        end
    end
end