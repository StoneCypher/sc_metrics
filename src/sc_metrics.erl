
-module(sc_metrics).





-export([

    nines_epsilon/0,

    real_nines/1,
    real_unines/1,
    nines/1

]).




nines_epsilon() ->

    0.00001.




real_unines(X) when X == 0; X == 0.0 ->

    perfect;





real_unines(Unavailability) when Unavailability >= 0, Unavailability =< 1 ->

    -1 * math:log10(Unavailability).





real_nines(Availability) when Availability >= 0, Availability =< 1 ->

    real_unines(1 - Availability).





nines(Availability) when Availability == 100; Availability == 100.0 ->

    perfect;





nines(Availability) when Availability >= 0, Availability =< 100 ->

    trunc(real_unines(1 - (Availability / 100)) + nines_epsilon()).
