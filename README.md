# WDOM
(WDOM is an acronym for weekday-of-month)

This module provides a constructor to create a Date object given year, month, weekday-of-month, and day-of-week arguments.  
The weekday-of-month argument will also accept 'L' for the last weekday-of-month.

### Examples
```
use Date::WDOM;

say Date::WDOM.new(weekday-of-month => 'L',
                   day-of-week      =>  1,
                   month            =>  5,
                   year             =>  2030).yyyy-mm-dd; # Memorial Day 2030-05-27
```

```
use Date::WDOM;

say Date::WDOM.new(weekday-of-month =>  4,
                   day-of-week      =>  4,
                   month            =>  11,
                   year             =>  2030).yyyy-mm-dd; # Thanksgiving 2030-11-28
```

*-Mark Anderson*
