%% SoftMax-decreasing bandit
% Extension of the softmax method decreasing the temperature parameter by a
% factor ln(t)/t.
% Author : Rémy Frenoy
classdef softmax_dec < softmax
    
    methods
        % Build a new SofMax decreasing object
        function obj = softmax_dec(nb_arms, gamma_value)
          obj@softmax(nb_arms, gamma_value);
        end
    
        % Compute probability to select arm i according to a Gibb distribution
        % The only change from a softmax strategy is that gamma parameter
        % decrease over time by a log(t)/(t) factor
        function probas = proba(obj)
          probas = zeros(obj.K,1);
          exp_sum_rewards = zeros(obj.K,1);
          playcount = sum(obj.t_arms);
          alpha = obj.compute_alpha(playcount);
       
          for k=1:obj.K
            exp_sum_rewards(k) = exp(obj.cum_rewards(k) / (max([1,obj.t_arms(k)])*alpha));
          end
          
          for k=1:obj.K
            probas(k) = exp_sum_rewards(k)/sum(exp_sum_rewards);
          end
          
        end
        
        function alpha = compute_alpha(obj, playcount)
            if playcount <= 2
                alpha = 1;
            else
                alpha = min([1, 5*obj.K*log(playcount-1) / (obj.gamma^2 * (playcount-1))]);
            end
        end
    end
end