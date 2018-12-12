function [y, prob] = softmax_social_sim(r, infStates, p)
% Simulates observations from a Bernoulli distribution
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2012-2013 Christoph Mathys, Andreea Diaconescu TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

x_r = r.u(:,2);
x_a = infStates(:,1,1);
mu3_hat_a = infStates(:,3,1);

ze1 = p(1);
beta = p(2);

decision_noise=exp(-mu3_hat_a)+exp(log(beta));


% Belief vector
b = ze1.*x_a + (1-ze1).*x_r;

% Apply the unit-square sigmoid to the inferred states
prob = b.^(decision_noise)./(b.^(decision_noise)+(1-b).^(decision_noise));

y = binornd(1, prob);


return;
