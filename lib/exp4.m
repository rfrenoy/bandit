classdef exp4 < bandit
    properties
        experts;
        w;      % Confidence weigths for every expert
    end
    
    methods
        
        function obj = exp4(nb_arms, gamma_value, experts)
            obj@bandit(nb_arms, gamma_value);
            obj.experts = experts;
            obj.w = ones(size(experts,2),1);
        end
        
        function index = get_index(obj,c)
            contexts = size(obj.experts,1);
            index = 1;
            
            if rem(c,1) ~= 0
                for i = 1:contexts
                    if c < i/contexts
                        index = i;
                        return
                    end
                end
            else
                index = c;
            end
            
        end
        
        % Compute probabilities to select every arm
        % see 'The non-stochastic multi-armed bandit problem' from Peter Auer for further proof
        function pb = proba(obj,c)
            W = sum(obj.w);
            pb = zeros(obj.K,1);
            c_index = obj.get_index(c);

            for k=1:obj.K
                exp_k = (obj.experts(c_index,:) == k);
                pb(k) = (1 - obj.gamma)/W * exp_k * obj.w + obj.gamma/obj.K;
            end
        end
        
        % Call proba function to collect proba to draw each arm
        % Draw arm according to given probabilities
        function [arm,pb] = select(obj,c)
            pb = obj.proba(c);
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
        function update(obj, i, reward,c)
            p = obj.proba(c);
            x = zeros(obj.K,1);
            x(i) = reward/p(i);
            c_index = obj.get_index(c);
            y = (obj.experts(c_index,:) == i);
            y = y * x(i);
            obj.w = obj.w .* exp(obj.gamma*y' / obj.K);
        end
        
    end
end