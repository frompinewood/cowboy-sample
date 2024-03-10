-module(index_handler).
-export([init/2]).

init(Req0, []) ->
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/html">>},
        <<"<p>Hello, world!</p>">>, Req0),
    {ok, Req, []}.
