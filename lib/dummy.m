% A dummy bandit selecting arms randomly according to a uniform
% distribution. To be used only as a comparison point
classdef dummy < bandit

    methods
        
        function obj = dummy(nb_arms, gamma_value)
            obj@bandit(nb_arms, gamma_value);
        end
        
        function [arm,pb] = select(obj)
            arm = randi(obj.K);         % Random selection from a uniform distribution in [1,K]
            pb = 1/obj.K;               % Uniform probability p(k) = 1/K
        end
        function update(~, ~, ~)
        end
    end 
end