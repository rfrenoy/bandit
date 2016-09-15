clear ; close all; clc     % Initialization
K = 3;
T = 1000;                 % Horizon
verbose = false;           % Print ongoing results if set to true
% bandit_types = char('dummy','exp3','softmax','softmax\_dec','softmix','greedy\_first','greedy\_mix');
bandit_types = char('softmax','softmax\_c','softmax\_dec','softmix'); %,'softmax','softmax\_dec');
gammas = [0.1,0.1,0.1,0.1];
% gammas = [0.1,0.1,0.1,0.8,0.8,0.1,0.8]; % Gamma parameter for exploitation vs exploration tradeoff

if size(bandit_types,1) ~= length(gammas)
    fprintf('Error, please provide as many gamma parameters as there are algorithms\n');
    fprintf('Nb gamma parameters: %d\tNb algorithms: %d',length(gammas),length(bandit_types));
    return;
end

sigma = zeros(K,1);
A = [-1;0;1];
B = [1;0.7;0];
% A = zeros(K,1);
% B = zeros(K,1);
arm_legend = cell(K,1);
for k=1:K    
%     A(k) = random('unif',-1,1);    
%     B(k) = random('unif',0,1);
    sigma(k) = random('unif',0,1);
    x = (0:1:1000)./10;
    mu = A(k) * x + B(k);
    r = zeros(numel(mu),1);
    for i = 1:numel(mu)
        r(i) = random('norm',mu(i), sigma(k));
    end
    hold on;
    plot(x,A(k)*x+B(k));
    arm_legend{k} = sprintf('arm %d',k);
end
xlim([0,1]);
ylim([0,1]);
legend(arm_legend);
hold off;

x = 1:1:T;
figure;
hold on;

% Looping on every algorithm
for s=1:size(bandit_types,1)
  % Instantiate algorithm with correct type
  bandit_type = strtrim(bandit_types(s,:));
  gamma = gammas(s);
  switch bandit_type
    case 'dummy'
      bandit = dummy(K,gamma);
    case 'exp3'
      bandit = exp3(K,gamma);
    case 'softmax'
      bandit = softmax(K,gamma);
    case 'softmax\_dec'
      bandit = softmax_dec(K,gamma);
    case 'softmix'
      bandit = softmix(K,gamma);
    case 'softmax\_c'
      bandit = softmax_context(K,gamma);
    case 'greedy\_first'
      bandit = greedy_first(K,gamma,T);
    case 'greedy\_mix'
      bandit = greedy_mix(K,gamma);
    otherwise
      bandit = softmax(K,gamma);
  end
  
  % Reset the simulation data
  hist_rewards = [];  % Save rewards at every round
  playcount = zeros(K,1);
  best_play = [];

  % Simulation for every algorithm
  for t=1:T
    c = random('unif',0,1);                           % Context
    if strcmp(bandit_type,'softmax\_c') == 1
        [i,pb] = bandit.select(c);
    else
        [i,pb] = bandit.select();                         % Select arm based on the algorithm strategy
    end
    mu = A * c + B;                                   % Reward computed from corresponding distribution
    reward = random('norm',mu(i), sigma(i));
    if strcmp(bandit_type,'softmax\_c') == 1
        bandit.update(i,reward,c); 
    else
        bandit.update(i,reward);                          % Update weigths/probabilities
    end
    playcount(i) = playcount(i) + 1;
    
    if verbose
      fprintf('----- iteration %d -----\n',t);
      for j=1:K
        fprintf('Proba to select arm %d : %f\n',j,pb(j));
      end
      fprintf('Arm %d is selected with probability %f\n',i,pb(i));
      fprintf('reward = %f\n',reward);
      fprintf('\n\n');
    end
    hist_rewards = [hist_rewards,reward];
    best_play = [best_play, max(mu)];
%     fprintf('Reward = %f\tBest play = %f\t pseudo-r = %f\n', reward, max(mu),sum(best_play)-sum(hist_rewards));

  end

  fprintf('\n\n----- Results for %s -----\n',bandit_type);
  fprintf('Initial distribution per arm\n');

  for k=1:K
    fprintf('Arm %d has mean %f and std %f\tplayed %d times\n',k,mu(k),sigma(k),playcount(k));
  end

  fprintf('Refer to plot to see the pseudo-regret\n');

  % Recall that pseudo regret is T times mean of the best arm minus the cumulated reward
  cumul_bestplay = cumsum(best_play);
  cumul_hist = cumsum(hist_rewards);
  pseudo_regret = cumul_bestplay - cumul_hist;

  plot(x,pseudo_regret);
end

% Formatting plots
title(['Pseudo regret with K=' num2str(K) ', T=' num2str(T) ', \gamma=' num2str(gamma)]);
xlabel('Simulation iterations');
ylabel('Pseudo-regret value');
legend(bandit_types);
hold off;   % Revealing every plots

