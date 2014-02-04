:- begin_tests(sort_dict).
:- use_module(prolog/sort_dict).

test(asc):-
    List = [
        vehicle{ year: 1926, make: chrysler, model: imperial },
        vehicle{ year: 1954, make: cadillac, model: fleetwood },
        vehicle{ year: 1953, make: chevrolet, model: corvette }
    ],
    sort_dict(year, asc, List, Sorted), !,
    Sorted = [
        vehicle{ year: 1926, make: chrysler, model: imperial },
        vehicle{ year: 1953, make: chevrolet, model: corvette },
        vehicle{ year: 1954, make: cadillac, model: fleetwood }
    ].

test(desc):-
    List = [
        vehicle{ year: 1926, make: chrysler, model: imperial },
        vehicle{ year: 1954, make: cadillac, model: fleetwood },
        vehicle{ year: 1953, make: chevrolet, model: corvette }
    ],
    sort_dict(year, desc, List, Sorted), !,
    Sorted = [
        vehicle{ year: 1954, make: cadillac, model: fleetwood },
        vehicle{ year: 1953, make: chevrolet, model: corvette },
        vehicle{ year: 1926, make: chrysler, model: imperial }
    ].

test(default):-
    List = [
        vehicle{ year: 1926, make: chrysler, model: imperial },
        vehicle{ year: 1954, make: cadillac, model: fleetwood },
        vehicle{ year: 1953, make: chevrolet, model: corvette }
    ],
    sort_dict(year, List, Sorted), !,
    Sorted = [
        vehicle{ year: 1926, make: chrysler, model: imperial },
        vehicle{ year: 1953, make: chevrolet, model: corvette },
        vehicle{ year: 1954, make: cadillac, model: fleetwood }
    ].

:- end_tests(sort_dict).
