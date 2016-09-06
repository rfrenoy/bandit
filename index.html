
<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <!--
This HTML was auto-generated from MATLAB code.
To make changes, update the MATLAB code and republish this document.
      --><title>Example of how-to-use bandit algorithms</title><meta name="generator" content="MATLAB 9.0"><link rel="schema.DC" href="http://purl.org/dc/elements/1.1/"><meta name="DC.date" content="2016-09-06"><meta name="DC.source" content="main.m"><style type="text/css">
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td{margin:0;padding:0;border:0;outline:0;font-size:100%;vertical-align:baseline;background:transparent}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}:focus{outine:0}ins{text-decoration:none}del{text-decoration:line-through}table{border-collapse:collapse;border-spacing:0}

html { min-height:100%; margin-bottom:1px; }
html body { height:100%; margin:0px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#000; line-height:140%; background:#fff none; overflow-y:scroll; }
html body td { vertical-align:top; text-align:left; }

h1 { padding:0px; margin:0px 0px 25px; font-family:Arial, Helvetica, sans-serif; font-size:1.5em; color:#d55000; line-height:100%; font-weight:normal; }
h2 { padding:0px; margin:0px 0px 8px; font-family:Arial, Helvetica, sans-serif; font-size:1.2em; color:#000; font-weight:bold; line-height:140%; border-bottom:1px solid #d6d4d4; display:block; }
h3 { padding:0px; margin:0px 0px 5px; font-family:Arial, Helvetica, sans-serif; font-size:1.1em; color:#000; font-weight:bold; line-height:140%; }

a { color:#005fce; text-decoration:none; }
a:hover { color:#005fce; text-decoration:underline; }
a:visited { color:#004aa0; text-decoration:none; }

p { padding:0px; margin:0px 0px 20px; }
img { padding:0px; margin:0px 0px 20px; border:none; }
p img, pre img, tt img, li img, h1 img, h2 img { margin-bottom:0px; } 

ul { padding:0px; margin:0px 0px 20px 23px; list-style:square; }
ul li { padding:0px; margin:0px 0px 7px 0px; }
ul li ul { padding:5px 0px 0px; margin:0px 0px 7px 23px; }
ul li ol li { list-style:decimal; }
ol { padding:0px; margin:0px 0px 20px 0px; list-style:decimal; }
ol li { padding:0px; margin:0px 0px 7px 23px; list-style-type:decimal; }
ol li ol { padding:5px 0px 0px; margin:0px 0px 7px 0px; }
ol li ol li { list-style-type:lower-alpha; }
ol li ul { padding-top:7px; }
ol li ul li { list-style:square; }

.content { font-size:1.2em; line-height:140%; padding: 20px; }

pre, code { font-size:12px; }
tt { font-size: 1.2em; }
pre { margin:0px 0px 20px; }
pre.codeinput { padding:10px; border:1px solid #d3d3d3; background:#f7f7f7; }
pre.codeoutput { padding:10px 11px; margin:0px 0px 20px; color:#4c4c4c; }
pre.error { color:red; }

@media print { pre.codeinput, pre.codeoutput { word-wrap:break-word; width:100%; } }

span.keyword { color:#0000FF }
span.comment { color:#228B22 }
span.string { color:#A020F0 }
span.untermstring { color:#B20000 }
span.syscmd { color:#B28C00 }

.footer { width:auto; padding:10px 0px; margin:25px 0px 0px; border-top:1px dotted #878787; font-size:0.8em; line-height:140%; font-style:italic; color:#878787; text-align:left; float:none; }
.footer p { margin:0px; }
.footer a { color:#878787; }
.footer a:hover { color:#878787; text-decoration:underline; }
.footer a:visited { color:#878787; }

table th { padding:7px 5px; text-align:left; vertical-align:middle; border: 1px solid #d6d4d4; font-weight:bold; }
table td { padding:7px 5px; text-align:left; vertical-align:top; border:1px solid #d6d4d4; }





  </style></head><body><div class="content"><h1>Example of how-to-use bandit algorithms</h1><!--introduction--><p>In this example, we have to choose between K levers at each iteration. Following the selection of a lever, we receive a reward. The reward is drawn from gaussian distributions. Every lever is assigned a gaussian distribution with unkown mean and standard deviation.</p><!--/introduction--><h2>Contents</h2><div><ul><li><a href="#1">Simulation parameters</a></li><li><a href="#2">Select mean and std for reward distribution on every arms</a></li><li><a href="#3">Looping on every algorithm</a></li><li><a href="#5">Reset the simulation data</a></li><li><a href="#6">Simulation for every algorithm</a></li><li><a href="#7">Recall that pseudo regret is T times mean of the best arm minus the cumulated reward</a></li><li><a href="#9">Formatting plots</a></li><li><a href="#10">Conclusions</a></li></ul></div><h2>Simulation parameters<a name="1"></a></h2><pre class="codeinput">clear ; close <span class="string">all</span>; clc     <span class="comment">% Initialization</span>
K = 10;                    <span class="comment">% Number of arms</span>
T = 10000;                 <span class="comment">% Horizon</span>
reward_distrib = <span class="string">'norm'</span>;   <span class="comment">% Reward distribution</span>
verbose = false;           <span class="comment">% Print ongoing results if set to true</span>
bandit_types = char(<span class="string">'dummy'</span>,<span class="string">'exp3'</span>,<span class="string">'softmax'</span>,<span class="string">'softmax\_dec'</span>,<span class="string">'softmix'</span>,<span class="string">'greedy\_first'</span>,<span class="string">'greedy\_mix'</span>);
gammas = [0.1,0.1,0.1,0.8,0.8,0.1,0.8]; <span class="comment">% Gamma parameter for exploitation vs exploration tradeoff</span>

<span class="keyword">if</span> size(bandit_types,1) ~= length(gammas)
    fprintf(<span class="string">'Error, please provide as many gamma parameters as there are algorithms\n'</span>);
    fprintf(<span class="string">'Nb gamma parameters: %d\tNb algorithms: %d'</span>,length(gammas),length(bandit_types));
    <span class="keyword">return</span>;
<span class="keyword">end</span>
</pre><h2>Select mean and std for reward distribution on every arms<a name="2"></a></h2><p>Mean and standard deviation are randomly uniformly drawn from [0,1]</p><pre class="codeinput">mu = zeros(K,1);
sigma = zeros(K,1);

<span class="keyword">for</span> k=1:K
  mu(k) = random(<span class="string">'unif'</span>,0,1);
  sigma(k) = random(<span class="string">'unif'</span>,0,1);
  fprintf(<span class="string">'Arm %d has mean %f and std %f\n'</span>,k,mu(k),sigma(k));
<span class="keyword">end</span>

hold <span class="string">on</span>; <span class="comment">% Holding on to plot results from all algorithms in the same graph</span>
x = 1:1:T;
</pre><pre class="codeoutput">Arm 1 has mean 0.839179 and std 0.693495
Arm 2 has mean 0.188132 and std 0.096875
Arm 3 has mean 0.673482 and std 0.155688
Arm 4 has mean 0.339664 and std 0.436525
Arm 5 has mean 0.473645 and std 0.908293
Arm 6 has mean 0.096243 and std 0.957439
Arm 7 has mean 0.151995 and std 0.823209
Arm 8 has mean 0.753612 and std 0.929680
Arm 9 has mean 0.176593 and std 0.308989
Arm 10 has mean 0.935610 and std 0.656420
</pre><img vspace="5" hspace="5" src="main_01.png" alt=""> <h2>Looping on every algorithm<a name="3"></a></h2><pre class="codeinput"><span class="keyword">for</span> s=1:size(bandit_types,1)
</pre><pre class="codeinput">  <span class="comment">% Instantiate algorithm with correct type</span>
  bandit_type = strtrim(bandit_types(s,:));
  gamma = gammas(s);
  <span class="keyword">switch</span> bandit_type
    <span class="keyword">case</span> <span class="string">'dummy'</span>
      bandit = dummy(K,gamma);
    <span class="keyword">case</span> <span class="string">'exp3'</span>
      bandit = exp3(K,gamma);
    <span class="keyword">case</span> <span class="string">'softmax'</span>
      bandit = softmax(K,gamma);
    <span class="keyword">case</span> <span class="string">'softmax\_dec'</span>
      bandit = softmax_dec(K,gamma);
    <span class="keyword">case</span> <span class="string">'softmix'</span>
      bandit = softmix(K,gamma);
    <span class="keyword">case</span> <span class="string">'greedy\_first'</span>
      bandit = greedy_first(K,gamma,T);
    <span class="keyword">case</span> <span class="string">'greedy\_mix'</span>
      bandit = greedy_mix(K,gamma);
    <span class="keyword">otherwise</span>
      bandit = softmax(K,gamma);
  <span class="keyword">end</span>
</pre><h2>Reset the simulation data<a name="5"></a></h2><pre class="codeinput">  hist_rewards = [];  <span class="comment">% Save rewards at every round</span>
  playcount = zeros(K,1);
</pre><h2>Simulation for every algorithm<a name="6"></a></h2><pre class="codeinput">  <span class="keyword">for</span> t=1:T
    [i,pb] = bandit.select();                         <span class="comment">% Select arm based on the algorithm strategy</span>
    reward = random(reward_distrib,mu(i),sigma(i));   <span class="comment">% Reward computed from corresponding distribution</span>
    bandit.update(i,reward);                          <span class="comment">% Update weigths/probabilities</span>
    playcount(i) = playcount(i) + 1;

    <span class="keyword">if</span> verbose
      fprintf(<span class="string">'----- iteration %d -----\n'</span>,t);
      <span class="keyword">for</span> j=1:K
        fprintf(<span class="string">'Proba to select arm %d : %f\n'</span>,j,pb(j));
      <span class="keyword">end</span>
      fprintf(<span class="string">'Arm %d is selected with probability %f\n'</span>,i,pb(i));
      fprintf(<span class="string">'reward = %f\n'</span>,reward);
      fprintf(<span class="string">'\n\n'</span>);
    <span class="keyword">end</span>

    hist_rewards = [hist_rewards,reward];
  <span class="keyword">end</span>

  fprintf(<span class="string">'\n\n----- Results for %s -----\n'</span>,bandit_type);
  fprintf(<span class="string">'Initial distribution per arm\n'</span>);

  <span class="keyword">for</span> k=1:K
    fprintf(<span class="string">'Arm %d has mean %f and std %f\tplayed %d times\n'</span>,k,mu(k),sigma(k),playcount(k));
  <span class="keyword">end</span>

  fprintf(<span class="string">'Refer to plot to see the pseudo-regret\n'</span>);
</pre><pre class="codeoutput">

----- Results for dummy -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 970 times
Arm 2 has mean 0.188132 and std 0.096875	played 1030 times
Arm 3 has mean 0.673482 and std 0.155688	played 1000 times
Arm 4 has mean 0.339664 and std 0.436525	played 970 times
Arm 5 has mean 0.473645 and std 0.908293	played 1056 times
Arm 6 has mean 0.096243 and std 0.957439	played 972 times
Arm 7 has mean 0.151995 and std 0.823209	played 1030 times
Arm 8 has mean 0.753612 and std 0.929680	played 970 times
Arm 9 has mean 0.176593 and std 0.308989	played 1013 times
Arm 10 has mean 0.935610 and std 0.656420	played 989 times
Refer to plot to see the pseudo-regret
</pre><pre class="codeoutput">

----- Results for exp3 -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 1203 times
Arm 2 has mean 0.188132 and std 0.096875	played 111 times
Arm 3 has mean 0.673482 and std 0.155688	played 160 times
Arm 4 has mean 0.339664 and std 0.436525	played 132 times
Arm 5 has mean 0.473645 and std 0.908293	played 118 times
Arm 6 has mean 0.096243 and std 0.957439	played 120 times
Arm 7 has mean 0.151995 and std 0.823209	played 104 times
Arm 8 has mean 0.753612 and std 0.929680	played 378 times
Arm 9 has mean 0.176593 and std 0.308989	played 111 times
Arm 10 has mean 0.935610 and std 0.656420	played 7563 times
Refer to plot to see the pseudo-regret
</pre><pre class="codeoutput">

----- Results for softmax -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 5662 times
Arm 2 has mean 0.188132 and std 0.096875	played 4 times
Arm 3 has mean 0.673482 and std 0.155688	played 1512 times
Arm 4 has mean 0.339664 and std 0.436525	played 50 times
Arm 5 has mean 0.473645 and std 0.908293	played 1 times
Arm 6 has mean 0.096243 and std 0.957439	played 3 times
Arm 7 has mean 0.151995 and std 0.823209	played 4 times
Arm 8 has mean 0.753612 and std 0.929680	played 2763 times
Arm 9 has mean 0.176593 and std 0.308989	played 0 times
Arm 10 has mean 0.935610 and std 0.656420	played 1 times
Refer to plot to see the pseudo-regret
</pre><pre class="codeoutput">

----- Results for softmax\_dec -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 2235 times
Arm 2 has mean 0.188132 and std 0.096875	played 121 times
Arm 3 has mean 0.673482 and std 0.155688	played 788 times
Arm 4 has mean 0.339664 and std 0.436525	played 186 times
Arm 5 has mean 0.473645 and std 0.908293	played 275 times
Arm 6 has mean 0.096243 and std 0.957439	played 91 times
Arm 7 has mean 0.151995 and std 0.823209	played 99 times
Arm 8 has mean 0.753612 and std 0.929680	played 1293 times
Arm 9 has mean 0.176593 and std 0.308989	played 112 times
Arm 10 has mean 0.935610 and std 0.656420	played 4800 times
Refer to plot to see the pseudo-regret
</pre><pre class="codeoutput">

----- Results for softmix -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 691 times
Arm 2 has mean 0.188132 and std 0.096875	played 207 times
Arm 3 has mean 0.673482 and std 0.155688	played 236 times
Arm 4 has mean 0.339664 and std 0.436525	played 213 times
Arm 5 has mean 0.473645 and std 0.908293	played 237 times
Arm 6 has mean 0.096243 and std 0.957439	played 237 times
Arm 7 has mean 0.151995 and std 0.823209	played 231 times
Arm 8 has mean 0.753612 and std 0.929680	played 233 times
Arm 9 has mean 0.176593 and std 0.308989	played 218 times
Arm 10 has mean 0.935610 and std 0.656420	played 7497 times
Refer to plot to see the pseudo-regret
</pre><pre class="codeoutput">

----- Results for greedy\_first -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 106 times
Arm 2 has mean 0.188132 and std 0.096875	played 91 times
Arm 3 has mean 0.673482 and std 0.155688	played 112 times
Arm 4 has mean 0.339664 and std 0.436525	played 110 times
Arm 5 has mean 0.473645 and std 0.908293	played 101 times
Arm 6 has mean 0.096243 and std 0.957439	played 87 times
Arm 7 has mean 0.151995 and std 0.823209	played 100 times
Arm 8 has mean 0.753612 and std 0.929680	played 105 times
Arm 9 has mean 0.176593 and std 0.308989	played 93 times
Arm 10 has mean 0.935610 and std 0.656420	played 9095 times
Refer to plot to see the pseudo-regret
</pre><pre class="codeoutput">

----- Results for greedy\_mix -----
Initial distribution per arm
Arm 1 has mean 0.839179 and std 0.693495	played 2045 times
Arm 2 has mean 0.188132 and std 0.096875	played 231 times
Arm 3 has mean 0.673482 and std 0.155688	played 252 times
Arm 4 has mean 0.339664 and std 0.436525	played 240 times
Arm 5 has mean 0.473645 and std 0.908293	played 214 times
Arm 6 has mean 0.096243 and std 0.957439	played 241 times
Arm 7 has mean 0.151995 and std 0.823209	played 244 times
Arm 8 has mean 0.753612 and std 0.929680	played 235 times
Arm 9 has mean 0.176593 and std 0.308989	played 233 times
Arm 10 has mean 0.935610 and std 0.656420	played 6065 times
Refer to plot to see the pseudo-regret
</pre><h2>Recall that pseudo regret is T times mean of the best arm minus the cumulated reward<a name="7"></a></h2><pre class="codeinput">  best_lever = max(mu);
  cumul_hist = cumsum(hist_rewards);
  pseudo_regret = x.*best_lever - cumul_hist;

  plot(x,pseudo_regret);
</pre><img vspace="5" hspace="5" src="main_02.png" alt=""> <img vspace="5" hspace="5" src="main_03.png" alt=""> <img vspace="5" hspace="5" src="main_04.png" alt=""> <img vspace="5" hspace="5" src="main_05.png" alt=""> <img vspace="5" hspace="5" src="main_06.png" alt=""> <img vspace="5" hspace="5" src="main_07.png" alt=""> <img vspace="5" hspace="5" src="main_08.png" alt=""> <pre class="codeinput"><span class="keyword">end</span>
</pre><h2>Formatting plots<a name="9"></a></h2><pre class="codeinput">title([<span class="string">'Pseudo regret with K='</span> num2str(K) <span class="string">', T='</span> num2str(T) <span class="string">', \gamma='</span> num2str(gamma)]);
xlabel(<span class="string">'Simulation iterations'</span>);
ylabel(<span class="string">'Pseudo-regret value'</span>);
legend(bandit_types);
hold <span class="string">off</span>;   <span class="comment">% Revealing every plots</span>
</pre><img vspace="5" hspace="5" src="main_09.png" alt=""> <h2>Conclusions<a name="10"></a></h2><p>This simple simulation illustrates how to use the various bandit algorithms implemented in this library. Recall that gamma values were empirically specified, hence this simulation does not aim (at this time) at comparing algorithms.</p><p class="footer"><br><a href="http://www.mathworks.com/products/matlab/">Published with MATLAB&reg; R2016a</a><br></p></div><!--
##### SOURCE BEGIN #####
%% Example of how-to-use bandit algorithms% In this example, we have to choose between K levers at each iteration.% Following the selection of a lever, we receive a reward. The reward is% drawn from gaussian distributions. Every lever is assigned a gaussian% distribution with unkown mean and standard deviation.%% Simulation parametersclear ; close all; clc     % InitializationK = 10;                    % Number of armsT = 10000;                 % Horizonreward_distrib = 'norm';   % Reward distributionverbose = false;           % Print ongoing results if set to truebandit_types = char('dummy','exp3','softmax','softmax\_dec','softmix','greedy\_first','greedy\_mix');gammas = [0.1,0.1,0.1,0.8,0.8,0.1,0.8]; % Gamma parameter for exploitation vs exploration tradeoffif size(bandit_types,1) ~= length(gammas)    fprintf('Error, please provide as many gamma parameters as there are algorithms\n');    fprintf('Nb gamma parameters: %d\tNb algorithms: %d',length(gammas),length(bandit_types));    return;end%% Select mean and std for reward distribution on every arms% Mean and standard deviation are randomly uniformly drawn from [0,1]mu = zeros(K,1);sigma = zeros(K,1);for k=1:K  mu(k) = random('unif',0,1);  sigma(k) = random('unif',0,1);  fprintf('Arm %d has mean %f and std %f\n',k,mu(k),sigma(k));endhold on; % Holding on to plot results from all algorithms in the same graphx = 1:1:T;%% Looping on every algorithmfor s=1:size(bandit_types,1)  % Instantiate algorithm with correct type  bandit_type = strtrim(bandit_types(s,:));  gamma = gammas(s);  switch bandit_type    case 'dummy'      bandit = dummy(K,gamma);    case 'exp3'      bandit = exp3(K,gamma);    case 'softmax'      bandit = softmax(K,gamma);    case 'softmax\_dec'      bandit = softmax_dec(K,gamma);    case 'softmix'      bandit = softmix(K,gamma);    case 'greedy\_first'      bandit = greedy_first(K,gamma,T);    case 'greedy\_mix'      bandit = greedy_mix(K,gamma);    otherwise      bandit = softmax(K,gamma);  end    %% Reset the simulation data  hist_rewards = [];  % Save rewards at every round  playcount = zeros(K,1);    %% Simulation for every algorithm  for t=1:T    [i,pb] = bandit.select();                         % Select arm based on the algorithm strategy    reward = random(reward_distrib,mu(i),sigma(i));   % Reward computed from corresponding distribution    bandit.update(i,reward);                          % Update weigths/probabilities    playcount(i) = playcount(i) + 1;        if verbose      fprintf('REPLACE_WITH_DASH_DASHREPLACE_WITH_DASH_DASH- iteration %d REPLACE_WITH_DASH_DASHREPLACE_WITH_DASH_DASH-\n',t);      for j=1:K        fprintf('Proba to select arm %d : %f\n',j,pb(j));      end      fprintf('Arm %d is selected with probability %f\n',i,pb(i));      fprintf('reward = %f\n',reward);      fprintf('\n\n');    end        hist_rewards = [hist_rewards,reward];  end  fprintf('\n\nREPLACE_WITH_DASH_DASHREPLACE_WITH_DASH_DASH- Results for %s REPLACE_WITH_DASH_DASHREPLACE_WITH_DASH_DASH-\n',bandit_type);  fprintf('Initial distribution per arm\n');  for k=1:K    fprintf('Arm %d has mean %f and std %f\tplayed %d times\n',k,mu(k),sigma(k),playcount(k));  end  fprintf('Refer to plot to see the pseudo-regret\n');  %% Recall that pseudo regret is T times mean of the best arm minus the cumulated reward  best_lever = max(mu);  cumul_hist = cumsum(hist_rewards);  pseudo_regret = x.*best_lever - cumul_hist;  plot(x,pseudo_regret);end%% Formatting plotstitle(['Pseudo regret with K=' num2str(K) ', T=' num2str(T) ', \gamma=' num2str(gamma)]);xlabel('Simulation iterations');ylabel('Pseudo-regret value');legend(bandit_types);hold off;   % Revealing every plots%% Conclusions% This simple simulation illustrates how to use the various bandit% algorithms implemented in this library. Recall that gamma values were% empirically specified, hence this simulation does not aim (at this time) at comparing% algorithms.
##### SOURCE END #####
--></body></html>