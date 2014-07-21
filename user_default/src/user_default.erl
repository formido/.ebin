-module(user_default).
-compile(export_all).

c_test(Path) ->
    CTinc = code:lib_dir(common_test)++"/include",
    TSinc = code:lib_dir(test_server)++"/include",
    compile:file(Path,[{i, CTinc},{i, TSinc}]).

show_chars(L) ->
    [io:format("~p", [[C]]) || C <- L],
    io:format("~n"),
    ok.

%% prints out each successive substring of a list
%% to determine just where the shell stops displaying
%% it as a printable list
stops_displaying_where([H|T]) ->
    stops_displaying_where(T, [H]).

stops_displaying_where([], Chars) ->
    io:format("~p~n", [Chars]),
    ok;
stops_displaying_where([H|T], Chars) ->
    io:format("~p~n", [Chars]),
    stops_displaying_where(T, Chars++[H]).
    

