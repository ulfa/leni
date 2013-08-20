%% Copyright (c) 2013 Ulf Angermann
%% See MIT-LICENSE for licensing information.

%%% -------------------------------------------------------------------
%%% Author  : Ulf Angermann uaforum1@googlemail.com
%%% Description :
%%%
%%% Created : 

-module(sender_util).

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
%% --------------------------------------------------------------------
%% External exports
%% --------------------------------------------------------------------
-export([create_message/5, send_message/2]).
-export([encode/1]).
%% --------------------------------------------------------------------
%% record definitions
%% --------------------------------------------------------------------
%% --------------------------------------------------------------------
%%% Internal functions
%% --------------------------------------------------------------------

create_message(Node, Sensor, Id, Time, Body) ->
    [atom_to_binary(Node, utf8), atom_to_binary(Sensor, utf8), list_to_binary(Id), list_to_binary(integer_to_list(Time)), Body].

send_message(Nodes, Message) ->
  send_message(Nodes, 'actor_group', Message).    
send_message(Nodes, Target, Message) ->
  rpc:abcast(Nodes, Target, Message).    

encode([]) ->
	[];
encode(List) ->
	[{pid_to_list(Pid), atom_to_list(Module), Description} || {Pid, Module, Description} <- List].

get_result({}) ->
	[].

%% --------------------------------------------------------------------
%%% Test functions
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
-ifdef(TEST).
encode_test() ->
	A= [{list_to_pid("<11802.80.0>"),seven_eleven_actor,"Actor, which rings the 7-11 bell"},
   		{list_to_pid("<11802.81.0>"),dht22_actor,"Actor, which is responspable for dht22 messages"}],
	B= [{"<11802.80.0>","seven_eleven_actor","Actor, which rings the 7-11 bell"},
   		{"<11802.81.0>","dht22_actor","Actor, which is responspable for dht22 messages"}],
   	?assertEqual(B, encode(A)).


get_result_test() ->

 A= [
  	{badrpc,{'EXIT',{undef,[{ronja,get_actors,[],[]},{rpc,'-handle_call_call/6-fun-0-',5,[{file,"rpc.erl"},{line,203}]}]}}},
  	{badrpc,{'EXIT',{undef,[{ronja,get_actors,[],[]},{rpc,'-handle_call_call/6-fun-0-',5,[{file,"rpc.erl"},{line,203}]}]}}},
  	[
  		{"<11876.80.0>",seven_eleven_actor,"Actor, which rings the 7-11 bell"},
   		{"<11876.81.0>",dht22_actor,"Actor, which is responspable for dht22 messages"}
  	]
  ],

  [R || R <- A, is_list(R) ].
-endif.
