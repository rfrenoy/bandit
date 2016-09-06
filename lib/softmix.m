%% SoftMix bandit
% Extension of the softmax method decreasing the temperature parameter by a
% factor ln(t)/t. Inspired by 'Finite-time Regret Bounds
% for the Multiarmed Bandit Problem' [Cesa-bianchi and Fischer, 1998].
% Author : Rémy Frenoy
classdef softmix < bandit_mix & softmax

    methods
        % Build a new SofMax decreasing object
        function obj = softmix(nb_arms, gamma_value)
          obj@bandit_mix(nb_arms, gamma_value);
          obj@softmax(nb_arms, gamma_value);
        end
    
        % Compute probability to select arm i according to a Gibb distribution
        % The only change from a softmax strategy is that gamma parameter
        % decrease over time by a log(t)/(t) factor (as proposed in 'Finite-Time Regret Bounds for the Multiarmed
        % Bandit Problem' [Cesa-Bianchi and Fisher, 1998])
        function probas = proba(obj)
          probas = zeros(obj.K,1);
          exp_sum_rewards = zeros(obj.K,1);
          alpha = obj.compute_alpha();
          n = obj.compute_n(alpha);
          
          for k=1:obj.K
            exp_sum_rewards(k) = exp(n*obj.s(k));
          end
          
          for k=1:obj.K
            probas(k) = (1-alpha) * exp_sum_rewards(k)/sum(exp_sum_rewards) + alpha/obj.K;
          end
        end
        
        % Update weigth according to received reward
        function update(obj, i, reward)
          pb = obj.proba();
          obj.s(i) = obj.s(i) + reward/pb(i);
          update@bandit_mix(obj,i,reward);
        end
        
        function n = compute_n(obj,alpha)
            n = (1/ ((obj.K/alpha) + 1)) * log(1 + (obj.gamma * ((obj.K/alpha) + 1)/ (2*(obj.K/alpha)-obj.gamma^2)));
        end
    end
end