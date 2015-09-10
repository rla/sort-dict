# sort_dict

Sorts list of dicts by key in the given direction. Duplicate entries
are not removed.

[![Build Status](https://travis-ci.org/rla/sort-dict.svg)](https://travis-ci.org/rla/sort-dict)

## Example

Sorting some things by the key `weight` in the descending order:

    ?- sort_dict(weight, desc, [
            object{ name: paper, weight: 0.01 },
            object{ name: rock, weight: 1.0 },
            object{ name: scrissors, weight: 0.2 }
        ], Sorted).
    ?- Sorted = [
        object{ name:rock, weight:1.0 },
        object{ name:scrissors, weight:0.2 },
        object{ name:paper, weight:0.01 }
    ].

## Installation

This package requires Swi-Prolog 7.x.

    pack_install(sort_dict).

## Known issues

Sorting is not stable.

## Bug reports/feature requests

Please send bug reports/feature request through the GitHub
project [page](https://github.com/rla/sort-dict).

## API documentation

See <http://packs.rlaanemets.com/sort-dict/doc/>.

## Changelog

 * 2014-04-22 v0.0.3 - uses dot notation instead of get_dict_ex/3.
 * 2014-02-13 v0.0.2 - uses `@<` for comparing.
 * 2014-02-04 v0.0.1

## License

The MIT License. See LICENSE file.
