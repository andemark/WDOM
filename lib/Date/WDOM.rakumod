unit class Date::WDOM is Date is export;

multi method new(:$weekday-of-month!, :$day-of-week!, :$month!, :$year! where $weekday-of-month ~~ 1..5) 
{
    my $dt = Date.new(:$year, :$month);

    my @weeks = Any,[1..7],[8..14],[15..21],[22..28],[29,30,31,Any,Any,Any,Any];

    my $day = @weeks[$weekday-of-month].rotate(-$dt.day-of-week)[$day-of-week mod 7];

    if $weekday-of-month == 5
    {
        # TODO: return the appropriate error. X::Temporal::OutOfRange ?
        return False unless $day;
        return False unless $day <= $dt.last-date-in-month.day 
    }
  
    Date.new(:$year, :$month, :$day)
}

multi method new(:$weekday-of-month!, :$day-of-week!, :$month!, :$year! where $weekday-of-month eq 'L')
{
    my $dt = Date.new(:$year, :$month).last-date-in-month;

    my $day = [$dt.day-6..$dt.day].rotate(6-$dt.day-of-week)[$day-of-week mod 7];

    Date.new(:$year, :$month, :$day)
}
