%% Copyright (c) 2013 Ulf Angermann
%% See MIT-LICENSE for licensing information.

%%% -------------------------------------------------------------------
%%% Author  : Ulf Angermann uaforum1@googlemail.com
%%% Description :
%%%
%%% Created : 

-module(leni).

%% Application callbacks
-export([start/0, stop/0]).
-export([set_debug/0, set_info/0]).

ensure_started(App) ->

    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
	
start() ->
	ensure_started(inets), 
	ensure_started(crypto),
  	ensure_started(lager),
	ensure_started(mochiweb),
	%%application:set_env(webmachine, webmachine_logger_module, webmachine_logger),
	ensure_started(webmachine),
	ensure_started(sue),	
	application:start(?MODULE).

stop() ->
    application:stop(?MODULE).

set_debug() ->
    lager:set_loglevel(lager_console_backend, debug).

set_info() ->
    lager:set_loglevel(lager_console_backend, info).
