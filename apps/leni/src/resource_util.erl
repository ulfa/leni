%% Copyright (c) 2013 Ulf Angermann
%% See MIT-LICENSE for licensing information.

%%% -------------------------------------------------------------------
%%% Author  : Ulf Angermann uaforum1@googlemail.com
%%% Description :
%%%
%%% Created : 

-module(resource_util).

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
%% --------------------------------------------------------------------
%% External exports
%% --------------------------------------------------------------------
-export([convert_nodes/1]).

convert_nodes(Nodes) ->
    [{Node, convert_date_in_things(Things)}|| {Node, Things} <- Nodes].

%% --------------------------------------------------------------------
%%% Internal functions
%% --------------------------------------------------------------------
convert_date_in_things(Things) ->
    lists:foldl(fun({Pid, Name, Date, Description, Driver}, Acc) -> [{Pid, Name, date:get_formated_date_for_now(Date), Description, Driver}|Acc] end, [], Things).  

%% --------------------------------------------------------------------
%%% Test functions
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
-ifdef(TEST).
convert_now_to_date_test() ->
    Things = [{"<0.94.0>",'Temperatur_Anzeige',
                       {1379,236269,790482},
                       "Temp sensor in my office",dht22_display_driver},
                      {"<0.95.0>",'Message_Logger',
                       {1379,236269,790612},
                       "Stores the last 20 messages and counts all messages",
                       message_counter_driver}],
    convert_date_in_things(Things).
-endif.
