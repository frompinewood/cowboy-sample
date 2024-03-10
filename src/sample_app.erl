%%%-------------------------------------------------------------------
%% @doc sample public API
%% @end
%%%-------------------------------------------------------------------

-module(sample_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", index_handler, []},
            {"/assets/[...]", cowboy_static, {priv_dir, sample, "static/assets"}}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(sample, [{port, 8080}], #{env => #{dispatch => Dispatch}}),
    sample_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
