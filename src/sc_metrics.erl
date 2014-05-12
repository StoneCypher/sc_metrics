
-module(sc_metrics).





-export([

    real_unines/1

]).




real_unines(Unavailability) ->

    -1 * math:log10(Unavailability).
