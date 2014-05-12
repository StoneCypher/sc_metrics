
-module(sc_metrics_tests).
-compile(export_all).

-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").





real_unines_test_() ->

    { "real_unines()", [

        { "0",              ?_assert( perfect == sc_metrics:real_unines(0)              ) },
        { "0.0",            ?_assert( perfect == sc_metrics:real_unines(0.0)            ) },

        { "0.1",            ?_assert(     1.0 == sc_metrics:real_unines(0.1)            ) },
        { "0.01",           ?_assert(     2.0 == sc_metrics:real_unines(0.01)           ) },
        { "0.001",          ?_assert(     3.0 == sc_metrics:real_unines(0.001)          ) },
        { "0.0001",         ?_assert(     4.0 == sc_metrics:real_unines(0.0001)         ) },
        { "0.00001",        ?_assert(     5.0 == sc_metrics:real_unines(0.00001)        ) },
        { "0.000001",       ?_assert(     6.0 == sc_metrics:real_unines(0.000001)       ) },
        { "0.0000001",      ?_assert(     7.0 == sc_metrics:real_unines(0.0000001)      ) },
        { "0.00000001",     ?_assert(     8.0 == sc_metrics:real_unines(0.00000001)     ) },
        { "0.000000001",    ?_assert(     9.0 == sc_metrics:real_unines(0.000000001)    ) },
        { "0.0000000001",   ?_assert(    10.0 == sc_metrics:real_unines(0.0000000001)   ) },
        { "0.00000000001",  ?_assert(    11.0 == sc_metrics:real_unines(0.00000000001)  ) },
        { "0.000000000001", ?_assert(    12.0 == sc_metrics:real_unines(0.000000000001) ) }

    ] }.





real_nines_test_() ->

    EW = fun(Test, Base) ->
        sc_math:eq_within(Test, Base, 0.00001) % because log10's error rate grows lol-fast
    end,

    { "real_unines()", [

        { "0",              ?_assert( perfect == sc_metrics:real_nines(1)              ) },
        { "0.0",            ?_assert( perfect == sc_metrics:real_nines(1.0)            ) },

        { "0.1",            ?_assert( EW(  1.0, sc_metrics:real_nines(0.9) )            ) },
        { "0.01",           ?_assert( EW(  2.0, sc_metrics:real_nines(0.99) )           ) },
        { "0.001",          ?_assert( EW(  3.0, sc_metrics:real_nines(0.999) )          ) },
        { "0.0001",         ?_assert( EW(  4.0, sc_metrics:real_nines(0.9999) )         ) },
        { "0.00001",        ?_assert( EW(  5.0, sc_metrics:real_nines(0.99999) )        ) },
        { "0.000001",       ?_assert( EW(  6.0, sc_metrics:real_nines(0.999999) )       ) },
        { "0.0000001",      ?_assert( EW(  7.0, sc_metrics:real_nines(0.9999999) )      ) },
        { "0.00000001",     ?_assert( EW(  8.0, sc_metrics:real_nines(0.99999999) )     ) },
        { "0.000000001",    ?_assert( EW(  9.0, sc_metrics:real_nines(0.999999999) )    ) },
        { "0.0000000001",   ?_assert( EW( 10.0, sc_metrics:real_nines(0.9999999999) )   ) },
        { "0.00000000001",  ?_assert( EW( 11.0, sc_metrics:real_nines(0.99999999999) )  ) },
        { "0.000000000001", ?_assert( EW( 12.0, sc_metrics:real_nines(0.999999999999) ) ) }

    ] }.





%_test_() ->
%
%    { "", [
%
%        { "", ?_assert() },
%
%    ] }.