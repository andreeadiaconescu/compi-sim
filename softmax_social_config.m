function c = softmax_social_config
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Contains the configuration for the Softmax reward and social learning observation model
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2012 Christoph Mathys, Andreea Diaconescu TNU, UZH & ETHZ

%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Config structure
c = struct;

% Model name
c.model = 'softmax_social';

% Sufficient statistics of Gaussian parameter priors


% Zeta is in log-space
c.logitze1mu = tapas_logit(0.5,1);
c.logitze1sa = 4^2;

% Beta in log-space
c.logbetamu = log(48);
c.logbetasa = 4^2;

% Gather prior settings in vectors
c.priormus = [
    c.logitze1mu,...
    c.logbetamu,...
    ];

c.priorsas = [
    c.logitze1sa,...
    c.logbetasa,...
    ];


% Model filehandle
c.obs_fun = @softmax_social;

% Handle to function that transforms observation parameters to their native space
% from the space they are estimated in
c.transp_obs_fun = @softmax_social_transp;

return;
