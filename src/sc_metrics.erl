
-module(sc_metrics).





-export([

    real_nines/1,
    real_unines/1

]).




real_unines(X) when X == 0; X == 0.0 ->

    perfect;





real_unines(Unavailability) ->

    -1 * math:log10(Unavailability).





real_nines(Availability) ->

    real_unines(1 - Availability).
