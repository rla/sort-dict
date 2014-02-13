:- module(sort_dict, [
    sort_dict/3, % +Key, +List, -Sorted
    sort_dict/4  % +Key, +Direction, +List, -Sorted
]).

/** <module> Sorts list of dicts by key

Sorts list of dicts by key.
*/

%! sort_dict(+Key, +Direction, +List, -Sorted) is det.
%
% Sorts the list of dicts in the given direction.
% Direction is either `asc` or `desc`. Sorting is done by
% predsort/3. Throws error(invalid_direction(Direction))
% when the Direction is neither `asc` or `desc`.

sort_dict(Key, Direction, List, Sorted):-
    (   Direction = asc
    ->  predsort(asc(Key), List, Sorted)
    ;   (   Direction = desc
        ->  predsort(desc(Key), List, Sorted)
        ;   throw(error(invalid_direction(Direction))))).

asc(Key, Result, Dict1, Dict2):-
    get_dict_ex(Key, Dict1, Value1),
    get_dict_ex(Key, Dict2, Value2),
    (   Value1 @< Value2
    ->  Result = (<)
    ;   Result = (>)).

desc(Key, Result, Dict1, Dict2):-
    get_dict_ex(Key, Dict1, Value1),
    get_dict_ex(Key, Dict2, Value2),
    (   Value2 < Value1
    ->  Result = (<)
    ;   Result = (>)).

%! sort_dict(+Key, +List, -Sorted) is det.
%
% Does same as sort_dict/4 but uses `asc` as
% the default sorting direction.

sort_dict(Key, List, Sorted):-
    sort_dict(Key, asc, List, Sorted).
