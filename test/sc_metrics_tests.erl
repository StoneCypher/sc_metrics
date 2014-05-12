
-module(sc_metrics_tests).
-compile(export_all).

-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").





real_unines_test_() ->

    { "real_unines()", [

        { "0.1", ?_assert( 1.0 == sc_metrics:real_unines(0.1) ) }

    ] }.





%_test_() ->
%
%    { "", [
%
%        { "", ?_assert() },
%
%    ] }.