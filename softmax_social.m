function logp = softmax_social(r, infStates, ptrans)
% Calculates the log-probability of response y=1 under the IOIO response model with constant
% weight zeta_1
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2016 Andreea Diaconescu, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Transform zetas to their native space
ze1 = exp(ptrans(1));
beta = exp(ptrans(2));


% Initialize returned log-probabilities (choice) as NaNs so that NaN is
% returned for all irregular trials
logp = NaN(length(infStates),1);

% Weed irregular trials out from inferred states, cue inputs, and responses
u = r.u(:,1);
u(r.irr) = [];

x_r =  r.u(:,2);
x_r(r.irr) = [];

x_a = infStates(:,1,1);
x_a(r.irr) = [];


mu3hat_a = infStates(:,3,1);
mu3hat_a(r.irr) = [];


y = r.y(:,1);
y(r.irr) = [];

% Weight vectors
decision_noise=exp(-mu3hat_a)+exp(log(beta));

%%
% Belief vector
b = ze1.*x_a + (1-ze1).*x_r;

logp(not(ismember(1:length(logp),r.irr)))         = y.*decision_noise.*log(b./(1-b)) +log((1-b).^decision_noise ./((1-b).^decision_noise +b.^decision_noise));


return;
